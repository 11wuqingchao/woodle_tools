package com.woodle.template;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-11 下午10:11
 */
public interface ITemplateRender <T> {

    public String renderTemplate(String templateFile, T params);
}
