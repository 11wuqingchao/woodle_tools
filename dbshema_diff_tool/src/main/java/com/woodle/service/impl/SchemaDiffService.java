package com.woodle.dev.service.impl;

import java.util.List;
import java.util.Map;
import java.util.Set;

import org.apache.commons.collections.MapUtils;
import org.apache.commons.lang.StringUtils;

import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.collect.Sets;
import com.woodle.dev.constant.DiffType;
import com.woodle.dev.model.DB;
import com.woodle.dev.model.DiffedDB;
import com.woodle.dev.model.Table;
import com.woodle.dev.model.DiffedTable;

public class SchemaDiffService {
	
	public DiffedDB diff(DB sourceDb, DB targetDb) {
		Set<String> sourceTableNames = sourceDb.getTableNames();
		Set<String> targetTableNames = targetDb.getTableNames();
		
		Set<String> deleteTables = Sets.newHashSet();	// 需要删除的表名集合
		for (String tb : sourceTableNames) {
			if (targetTableNames.contains(tb))  {
				targetTableNames.remove(tb); 			// targetTableNames得到的就是需要新增的表名集合
				continue;
			}
			deleteTables.add(tb);
		}
		
		List<DiffedTable> diffedList = Lists.newArrayList();
	
		List<Table> sourceTables = sourceDb.getTables();
		List<Table> targetTables = targetDb.getTables();
		Set<String> temp = Sets.newHashSet();
		
		// TODO 复杂度可以从O(mn) 优化为O(m+n)
		for (Table st : sourceTables) {
			if (deleteTables.contains(st.getName())) {
				// 删除的表
				DiffedTable td = new DiffedTable();
				td.setTableDiffResult(DiffType.DELETE);
				td.setTable(st);
				
				diffedList.add(td);
				continue;
			}
			outer:
			for (Table tt : targetTables) {
				if (!temp.contains(tt.getName())  && targetTableNames.contains(tt.getName()) ) {
					// 确定是新增的表后标记 避免重复添加
					temp.add(tt.getName());
					// 新增的表
					DiffedTable td = new DiffedTable();
					td.setTableDiffResult(DiffType.ADD);
					td.setTable(tt);					
					diffedList.add(td);	
				}
				else {
					if (StringUtils.equals(st.getName(), tt.getName())) {
						
						Map<String, String> sourceFields = st.getFields();
						Map<String, String> targetFields = tt.getFields();
						// compare field
						Map<DiffType, Map<String, String>> fieldDiffed= Maps.newHashMap();
						
						Map<String, String> deleteFields = Maps.newHashMap();				
						Map<String, String> modifyFields = Maps.newHashMap();
						for(String field: sourceFields.keySet()) {
							if (!targetFields.containsKey(field)) {
								deleteFields.put(field, sourceFields.get(field));
							}
							if (targetFields.containsKey(field)) {
								if (!StringUtils.equals(sourceFields.get(field), targetFields.get(field)) 
									) {
									modifyFields.put(field, targetFields.get(field));
								}
								targetFields.remove(field);	// targetFields的记录即为要新增的列
							}
						}
						boolean hasModify = false;
						if (MapUtils.isNotEmpty(deleteFields)) {
							fieldDiffed.put(DiffType.DELETE, deleteFields);
							hasModify = true;
						}
						if (MapUtils.isNotEmpty(modifyFields)) {
							fieldDiffed.put(DiffType.MODIFY, modifyFields);
							hasModify = true;
						}
						if (MapUtils.isNotEmpty(targetFields)) {
							fieldDiffed.put(DiffType.ADD, targetFields);
							hasModify = true;
						}
						// 变化的表
						if (hasModify) {
							DiffedTable td = new DiffedTable();
							td.setTableDiffResult(DiffType.MODIFY);
							td.setFiledDiffResult(fieldDiffed);
							td.setTable(st);
							diffedList.add(td);
						}
						break outer;
					}
				}
				
			}
			
		}
		
		
		return new DiffedDB(diffedList);	
	}
}
