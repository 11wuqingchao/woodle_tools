package com.woodle.data;

import java.util.List;

/**
 * 数据处理接口
 * User: wuqingchao
 * Time: 14-5-11 下午10:21
 */
public interface IDataFormater <T>{

    public T formatData(List<String> source);

    public IDataFormater<T> switchDataFormater(String jsonDataFile, String xmlDataFile) ;
}
