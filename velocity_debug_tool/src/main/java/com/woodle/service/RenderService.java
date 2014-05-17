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
import com.woodle.template.ITemplateRender;
import com.woodle.utils.PathUtil;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.util.List;
import java.util.Map;

/**
 *
 * User: wuqingchao
 * Time: 14-5-11 下午10:07
 */
public class RenderService {


    private IDataFormater<Map<String, Object>> dataFormater;
    private ITemplateRender<Map<String, Object>> templateRender;

    public RenderService(){

    }

    public  String Rendering(String uri) {
        uri = StringUtils.remove(uri, CommonConstants.URL_ROOT_DIR);
        if (StringUtils.isEmpty(uri) || StringUtils.equals(uri, CommonConstants.INVALID_URI)) {
            System.out.println("invalid request");
            return "";
        }

        String renderResult;

        String jsonDataFile = uri + CommonConstants.JSON_DATA_SURFIX;
        String vmTemplateFile = uri + CommonConstants.VM_TEMPLATE_SURFIX;
        String jonsDataFilePath = PathUtil.ROOT_DIR + jsonDataFile;

        String xmlDataFile = uri + CommonConstants.XML_DATA_SURFIX;
        String xmlDataFilePath = PathUtil.ROOT_DIR + xmlDataFile;
        String fmTemplateFile = uri + CommonConstants.FM_TEMPLATE_SURFIX;

        templateRender = templateRender.switchTemplateRender(vmTemplateFile, fmTemplateFile);
        dataFormater = dataFormater.switchDataFormater(jonsDataFilePath, xmlDataFilePath);

        // 读取数据
        File file = new File(jonsDataFilePath);
        List<String> dataList = Lists.newArrayList();
        try {
            dataList = Files.readLines(file, Charsets.UTF_8);
        } catch(Exception ex) {
            System.out.println("read data file excepption: " + ex.getMessage());
            renderResult = String.format(CommonConstants.DATA_NOT_FOUND_FORMAT, jsonDataFile);
            return renderResult;
        }
        // 格式化数据
        Map<String, Object> dataMap = dataFormater.formatData(dataList);
        // 数据渲染模板
        renderResult = templateRender.renderTemplate(vmTemplateFile, dataMap);
        return  renderResult;
    }



}
