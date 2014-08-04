package com.woodle;

import com.woodle.model.DB;
import com.woodle.model.DiffedDB;
import com.woodle.service.ISchemaParser;
import com.woodle.service.impl.SQLGenerateService;
import com.woodle.service.impl.SchemaDiffService;
import com.woodle.service.impl.SchemaParser;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-8-4 下午9:35
 */
public class Diff {

    private  static ISchemaParser parser = new SchemaParser();

    private  static SchemaDiffService diffService = new SchemaDiffService();

    private  static SQLGenerateService sqlGenerateService = new SQLGenerateService();

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
