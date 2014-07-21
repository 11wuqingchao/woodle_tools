package com.woodle.dev;

import com.woodle.dev.model.DB;
import com.woodle.dev.model.DiffedDB;
import com.woodle.dev.service.ISchemaParser;
import com.woodle.dev.service.impl.SchemaParser;
import com.woodle.dev.service.impl.SQLGenerateService;
import com.woodle.dev.service.impl.SchemaDiffService;

public class Diff {
	
	private  static ISchemaParser parser = new SchemaParser();
	
	private  static SchemaDiffService diffService = new SchemaDiffService();
	
	private  static SQLGenerateService sqlGenerateService = new SQLGenerateService();
	
	
	@SuppressWarnings("unused")
	public static void main(String...strings) {
		long now = System.currentTimeMillis();
		
		DB sdb = parser.parse2DB("qding_pro.sql");				
		DB tdb = parser.parse2DB("qding.sql");
//		System.out.println("耗时：" + (System.currentTimeMillis() - now) + " 毫秒");
		
		DiffedDB dd = diffService.diff(sdb, tdb);
//		System.out.println("耗时：" + (System.currentTimeMillis() - now) + " 毫秒");
		
		String result = sqlGenerateService.generateSQL(dd);	
//		System.out.println(result);
		System.out.println("耗时：" + (System.currentTimeMillis() - now) + " 毫秒");

	}
}
