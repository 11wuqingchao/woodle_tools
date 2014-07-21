package com.woodle.dev.model;

import java.util.List;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

public class DiffedDB {
	
	private List<DiffedTable> tableDiffedList;

	public List<DiffedTable> getTableDiffedList() {
		return tableDiffedList;
	}

	public List<DiffedTable> getDiffResult() {
		return tableDiffedList;
	}
	
	public void setTableDiffedList(List<DiffedTable> tableDiffedList) {
		this.tableDiffedList = tableDiffedList;
	}
	
	public DiffedDB(List<DiffedTable> tableDiffedList) {
		this.tableDiffedList = tableDiffedList;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}
	
}
