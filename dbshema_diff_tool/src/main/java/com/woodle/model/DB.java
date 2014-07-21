package com.woodle.dev.model;

import java.util.List;
import java.util.Set;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

import com.google.common.base.Joiner;
import com.google.common.collect.Lists;
import com.google.common.collect.Sets;

public class DB {
	
	/**
	 * 数据库名
	 */
	private String name;
	
	/**
	 * 表集合
	 */
	private List<Table> tables;
	
	/**
	 * 表名集合
	 */
	private Set<String> tableNames; // for diff performance

	public List<Table> getTables() {
		return tables;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	
	public Set<String> getTableNames() {
		return tableNames;
	}
	
	public void addTable(Table table) {
		if (tableNames == null) tableNames = Sets.newHashSet();
		if (tables == null) tables = Lists.newArrayList();
		
		if (tableNames.add(table.getName())) 
			tables.add(table);
	}
	
	public void addTables(List<Table> tables) {
		for (Table tb : tables)
			addTable(tb);
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

	public String tableNamesToString() {
		return "DB {" + getName() + "} contains tables:[[" 
				+ Joiner.on(",").join(getTableNames()) + "]]";
	}

}
