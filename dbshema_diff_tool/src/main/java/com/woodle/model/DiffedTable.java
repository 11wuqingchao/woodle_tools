package com.woodle.model;

import java.util.Map;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.woodle.dev.constant.DiffType;

public class DiffedTable {
	

	private DiffType tableDiffType;
	
	private Table table;
	
	private Map<DiffType, Map<String, String>> filedDiffResult;


	public DiffType getTableDiffType() {
		return tableDiffType;
	}


	public void setTableDiffResult(DiffType filedDiffResult) {
		this.tableDiffType = filedDiffResult;
	}


	public Map<DiffType, Map<String, String>> getFiledDiffResult() {
		return filedDiffResult;
	}


	public void setFiledDiffResult(Map<DiffType, Map<String, String>> filedDiffResult) {
		this.filedDiffResult = filedDiffResult;
	}
	
	public Table getTable() {
		return table;
	}

	public void setTable(Table table) {
		this.table = table;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

}
