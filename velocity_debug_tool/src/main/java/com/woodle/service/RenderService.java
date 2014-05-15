package com.woodle.service;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-12 上午12:09
 */

import com.google.common.base.Charsets;
import com.google.common.collect.Lists;
import com.google.common.io.Files;
import com.woodle.common.CommonConstants;
import com.woodle.data.IDataFormater;
import com.woodle.data.impl.JSONDataFormater;
import com.woodle.template.ITemplateRender;
import com.woodle.template.impl.VelocityRender;
import com.woodle.utils.PathUtil;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-11 下午10:07
 */
public class RenderService {


    private IDataFormater<Map<String, Object>> dataFormater;
    private ITemplateRender<Map<String, Object>> templateRender;

    public RenderService(){
        dataFormater = new JSONDataFormater();
        templateRender = new VelocityRender();
    }

    public  String Rendering(String uri) {
        uri = StringUtils.remove(uri, CommonConstants.URL_ROOT_DIR);
        if (StringUtils.isEmpty(uri) || StringUtils.equals(uri, "favicon.ico")) {
            System.out.println("invalid request");
            return "";
        }

        String renderResult;

        String dataFile = new StringBuilder(uri).append(CommonConstants.JSON_DATA_SURFIX).toString();
        String templateFile = new StringBuilder(uri).append(CommonConstants.VM_TEMPLATE_SURFIX).toString();
        String dataFilePath = new StringBuilder(PathUtil.ROOT_DIR).append(dataFile).toString();

        // 读取数据
        File file = new File(dataFilePath);
        List<String> dataList = Lists.newArrayList();
        try {
            dataList = Files.readLines(file, Charsets.UTF_8);
        } catch(Exception ex) {
            System.out.println("read data file excepption: "+ex.getMessage());
            renderResult = String.format(CommonConstants.DATA_NOT_FOUND_FORMAT, dataFile);
            return renderResult;
        }
        // 格式化数据
        Map<String, Object> dataMap = dataFormater.formatData(dataList);
        // 数据渲染模板
        renderResult = templateRender.renderTemplate(templateFile, dataMap);
        return  renderResult;
    }
}
