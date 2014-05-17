package com.woodle.data;

import com.woodle.data.impl.JSONDataFormater;

import java.io.File;
import java.util.Map;

/**
 * 数据处理类
 * User: wuqingchao
 * Time: 14-5-15 下午11:24
 */
public abstract class AbstractDataFormater implements IDataFormater<Map<String, Object>> {

    @Override
    public IDataFormater<Map<String, Object>> switchDataFormater(String jsonDataFile, String xmlDataFile) {
        File vmFile = new File(jsonDataFile);
        File fmFile = new File(xmlDataFile);

        if (vmFile.exists() && fmFile.exists()) {
            System.out.println("error!! both json data file and xml data file existes, please make sure only one data file!!");
            return null;
        }

        if (vmFile.exists()) {
            return new JSONDataFormater();
        }

        if (fmFile.exists()) {
            System.out.println("error!! lack of xml data parser");
            return null;
        }

        System.out.println("lack of data file");
        return null;
    }

}
