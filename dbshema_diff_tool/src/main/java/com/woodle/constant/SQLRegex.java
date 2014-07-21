package com.woodle.dev.constant;

public class SQLRegex {
	
	/**
	 * 匹配表名的正则		<br/>
	 * 匹配到的$1为表名		<p/>
	 * example:			<br/>
	 * CREATE TABLE `address` (
	 */
	public static final String NAME_REG = "CREATE TABLE (.*) \\(";
	
	/**
	 * 匹配表的列 			<br/>
	 * 匹配到的$1为列名  		<br/>
	 * 匹配到的$2为列的属性	<p/>
	 * example:			<br/>
	 *  `name` varchar(200) NOT NULL COMMENT '名称',
	 */
	public static final String FIELD_REG = "[^KEY]\\s(`.*`)(.*),$";
	
	/**
	 * 匹配表的索引			<br/>	 
	 * 匹配到的$1是索引名		<br/>
	 * 匹配到的$2是索引列		<p/>
	 * * example:		<br/>
	 * KEY `cash_payment_payment_type_key` (`payment_type`)
	 */
	public static final String INDEX_REG = "KEY `(.*)` \\(`(.*)`\\)";
	
	/**
	 * 匹配表的属性			<P/>
	 * example:			<br/>
	 * ) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='现金收款表(cash_payment)';
	 */
	public static final String PROPERTY_REG = "\\) ENGINE=(.*);$";
	
	/**
	 * 此前缀表示sql文件中注释的行<br/>
	 * 处理过程中可以忽略此行<p/>
	 */
	public static final String USELESS_LINE_PREFIX_1 = "/*";
	
	/**
	 * 此前缀表示sql文件中注释的行<br/>
	 * 处理过程中可以忽略此行<p/>
	 * 如下面的行可以忽略:<br/>
	 * -- MySQL dump 10.13  Distrib 5.1.73, for redhat-linux-gnu (x86_64)
	 */
	public static final String USELESS_LINE_PFEFIX_2 = "--";
}
