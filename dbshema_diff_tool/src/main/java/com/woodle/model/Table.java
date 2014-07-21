package com.woodle.dev.model;

import java.util.Map;

import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
 * 表
 * @author woodle
 */
public class Table {
	/**
	 * 表名
	 */
	private String name;
	
	/**
	 * 表的列
	 */
	private Map<String, String> fields;
	
	/**
	 * 表的索引
	 */
	private Map<String, String> index;
	
	/**
	 * 表的属性
	 */
	private String properties;
	
	/**
	 * 建表语句
	 * 保留建表语句, 防止新建表时需要重新组装sql
	 */
	private String create_sql;
	
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Map<String, String> getFields() {
		return fields;
	}

	public void setFields(Map<String, String> fields) {
		this.fields = fields;
	}

	public Map<String, String> getIndex() {
		return index;
	}

	public void setIndex(Map<String, String> index) {
		this.index = index;
	}

	public String getProperties() {
		return properties;
	}

	public void setProperties(String properties) {
		this.properties = properties;
	}
	
	
	public String getCreate_sql() {
		return create_sql;
	}

	public void setCreate_sql(String create_sql) {
		this.create_sql = create_sql;
	}
	
	public Table withName(String name) {
		setName(name);
		return this;
	}
	
	public Table withProperty(String property) {
		setProperties(property);
		return this;
	}
	
	public Table withCreateSql(String create_sql) {
		setCreate_sql(create_sql);
		return this;
	}
	
	public Table withFields(Map<String, String> fields) {
		setFields(fields);
		return this;
	}
	
	@Override
	public String toString() {
		return ToStringBuilder.reflectionToString(this, ToStringStyle.MULTI_LINE_STYLE);
	}

}
