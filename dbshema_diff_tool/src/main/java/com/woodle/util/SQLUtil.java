package com.woodle.dev.util;

import org.apache.commons.lang.StringUtils;

public class SQLUtil {
	
	public static String toSQL(String sql) {
		// 去掉尾部空格后，如果不是以 ';'结尾
		if (!StringUtils.endsWith(StringUtils.trim(sql), ";")) {
			return sql+";";
		}
		return sql;
	}
	
	/**
	 * 去掉最后一个字符,然后使之成为格式sql语句
	 * @param sql
	 * @return
	 */
	public static String removeEndToSQL(String sql) {
		if (StringUtils.isNotEmpty(sql)) {
			sql = StringUtils.trim(sql);
			sql = sql.substring(0, sql.length()-1);
		}
		return toSQL(sql);
	}
	
	public static void main(String...strings) {
		System.out.println(removeEndToSQL("alter table column id, add column id,"));
		System.out.println(removeEndToSQL("alter table column id, add column id,    "));
	}
}
