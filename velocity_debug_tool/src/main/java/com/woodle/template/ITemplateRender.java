package com.woodle.template;

/**
 * 模板渲染接口
 * User: wuqingchao
 * Time: 14-5-11 下午10:11
 */
public interface ITemplateRender <T> {

    public String renderTemplate(String templateFile, T params);

    public ITemplateRender<T> switchTemplateRender(String vmTemplateFile, String fmTemplateFile);
}
