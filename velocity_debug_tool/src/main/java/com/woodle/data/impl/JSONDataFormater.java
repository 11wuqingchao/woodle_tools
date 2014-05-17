package com.woodle.data.impl;

import com.google.common.base.Joiner;
import com.google.common.collect.Maps;
import com.woodle.data.AbstractDataFormater;
import com.woodle.data.IDataFormater;
import org.codehaus.jackson.JsonParser;
import org.codehaus.jackson.map.ObjectMapper;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * json格式数据处理类
 * User: wuqingchao
 * Time: 14-5-11 下午10:22
 */
public class JSONDataFormater extends AbstractDataFormater {

    @SuppressWarnings("unchecked")
    @Override
    public Map<String, Object> formatData(List<String> source) {
        String ret = Joiner.on("").join(source);

        ObjectMapper mapper = new ObjectMapper();
        mapper.configure(JsonParser.Feature.ALLOW_UNQUOTED_FIELD_NAMES, true);

        Map<String, Object> map = Maps.newHashMap();
        try {
            map = mapper.readValue(ret, Map.class);
        } catch (Exception e) {
            System.out.println("json data formater exception"+e.getMessage());
        }

        return map;
    }



}
