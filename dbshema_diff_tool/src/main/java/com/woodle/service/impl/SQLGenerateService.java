package com.woodle.dev.service.impl;

import java.util.List;
import java.util.Map;

import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.MapUtils;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.woodle.dev.constant.DiffType;
import com.woodle.dev.model.DiffedDB;
import com.woodle.dev.model.DiffedTable;
import com.woodle.dev.util.SQLUtil;

public class SQLGenerateService {

	/**
	 * 根据比对结果生成sql语句
	 * @param dbDiffed
	 * @return
	 */
	public String generateSQL(DiffedDB dbDiffed) {
		if (dbDiffed == null || CollectionUtils.isEmpty(dbDiffed.getDiffResult()))  {
			System.out.println("比对结果为空");
			return "";
		}
		List<String> sql = Lists.newArrayList();
		
		List<DiffedTable> diffResult = dbDiffed.getDiffResult();				
		for (DiffedTable td : diffResult) {
			if (diffResult == null) continue;	// 防御性代码
			
			switch (td.getTableDiffType()) {
			case ADD:
				// 新增的表
				sql.add(td.getTable().getCreate_sql());
				break;
			case DELETE:
				// 要删除的表
				sql.add("drop table "+ td.getTable().getName()+"");
				break;
			case MODIFY:
				// 变化的表
				Map<DiffType, Map<String, String>> fields = td.getFiledDiffResult();
				if(MapUtils.isEmpty(fields)) continue;	//防御性代码
				
				StringBuilder builder = new StringBuilder("alter table ").append(td.getTable().getName()).append(" ");
				boolean reallyModify = false;
				
				Map<String, String> add_fields = fields.get(DiffType.ADD);
				if (MapUtils.isNotEmpty(add_fields)) {
					for (String s : add_fields.keySet()) {
						reallyModify = true;
						builder.append("add column ").append(s).append(" ").append(add_fields.get(s)).append(" ,");
					}
				}
				
				Map<String, String> delete_fields = fields.get(DiffType.DELETE);
				if (MapUtils.isNotEmpty(delete_fields)) {
					for (String s: delete_fields.keySet()) {
						reallyModify = true;
						builder.append("drop column ").append(s).append(" ,");
					}
				}
				
				Map<String, String> modify_fields = fields.get(DiffType.MODIFY);
				if (MapUtils.isNotEmpty(modify_fields)) {
					for (String s: modify_fields.keySet()) {
						reallyModify = true;
						builder.append("modify column ").append(s).append(" ").append(modify_fields.get(s)).append(" ,");
					}
				}
				if (reallyModify) {
					sql.add(SQLUtil.removeEndToSQL(builder.toString()));
				}
				// TODO
				// 变化的索引			
				// 变化的属性
				break;		
			default:
				break;				
			}		
		}
		
		return Joiner.on("\n").join(sql);
	}

}
