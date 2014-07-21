package com.woodle.service.impl;

import java.net.URL;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.lang.StringUtils;

import com.google.common.base.Charsets;
import com.google.common.base.Preconditions;
import com.google.common.base.Strings;
import com.google.common.collect.Lists;
import com.google.common.collect.Maps;
import com.google.common.io.LineProcessor;
import com.google.common.io.Resources;
import com.woodle.constant.SQLRegex;
import com.woodle.model.DB;
import com.woodle.model.Table;
import com.woodle.service.ISchemaParser;

public class SchemaParser implements ISchemaParser{
	
	public static final Pattern NAME_P = Pattern.compile(SQLRegex.NAME_REG);
	public static final Pattern FIELD_P = Pattern.compile(SQLRegex.FIELD_REG);
	public static final Pattern INDEX_P = Pattern.compile(SQLRegex.INDEX_REG);
	public static final Pattern PROPERTY_P = Pattern.compile(SQLRegex.PROPERTY_REG);
	
	
	private  LineProcessor<List<Table>> parseFile2Db = new LineProcessor<List<Table>>() {
        private List<Table> tablelist = Lists.newArrayList();
        
        private String name = null;									// 保存表名
        private Map<String, String> indexMap = Maps.newHashMap();	// 保存索引
        private Map<String, String> fielMap = Maps.newHashMap();	// 保存属性    	
        private String property = null;								// 保存表的属性
        private StringBuilder builder = new StringBuilder();		// 保存建表语句
     	
        @Override
        public boolean processLine(String line) {
        	// 空行或者注释行不处理
        	if (StringUtils.isEmpty(line) || StringUtils.startsWith(line, SQLRegex.USELESS_LINE_PREFIX_1)
        			|| StringUtils.startsWith(line, SQLRegex.USELESS_LINE_PFEFIX_2)) {
        		return true;
        	}
        	
            builder.append(line);
            Matcher m = NAME_P.matcher(line);
            if (m.find()) {
            	name = m.group(1);
            	return true;
            }
            
            m = FIELD_P.matcher(line);	                
            if (m.find()){
            	fielMap.put(m.group(1), m.group(2));	                	
            	return true;
            }
            
            m = INDEX_P.matcher(line);	                
            if (m.find()){
            	indexMap.put(m.group(1), m.group(2));
            	return true;
            }
            
            m = PROPERTY_P.matcher(line);	                
            if (m.find()) {
            	property = m.group(1);
            	
            	Table tb = new Table().withName(name).withProperty(property)
            	  .withCreateSql(builder.toString()).withFields(fielMap);
           
            	tablelist.add(tb);
            	
            	builder = new StringBuilder();
            	indexMap = Maps.newHashMap();
            	fielMap = Maps.newHashMap();
            	return true;
            }
            return true;
        }
 
        @Override
        public List<Table> getResult() {
        	List<Table> returnList = Lists.newArrayList(tablelist);
        	tablelist = Lists.newArrayList();     	
            return returnList;
        }
    };
	        
	public DB parse2DB(String fileName) {

		Preconditions.checkArgument(!Strings.isNullOrEmpty(fileName), "file name must not be null");
		
		URL resource = this.getClass().getClassLoader().getResource(fileName);
		List<Table> tables = Lists.newArrayList();
        try {
			tables = Resources.readLines(resource, Charsets.UTF_8, parseFile2Db);
		} catch (Exception e) {
			System.out.println("read file occurs exception:" + e);
			return null;
		}

        DB db = new DB();
        db.setName(getDBName(fileName));
        db.addTables(tables);
             
		return db;		
	}
	
	private String getDBName(String fileName) {
		if (Strings.isNullOrEmpty(fileName)) {
			return "UNKOWN-DB";
		}
		return fileName.lastIndexOf('.') == -1 ? fileName : fileName.substring(0, fileName.lastIndexOf('.'));
	}
}
