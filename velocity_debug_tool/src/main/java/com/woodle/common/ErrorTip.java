package com.woodle.common;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-10 下午7:04
 */
public class ErrorTip {

    public static final String VM_NOT_FOUND_FORMAT = "错误，找不到模板文件！请确认模板文件%s是否存在（模板文件放在与jar包相同路径下）！";

    public static final String PARSE_VM_ERROR_FORMAT = "错误，解析模板错误！请确认模板文件%s语法正确！";

    public static final String INVOKE_VM_METHOD_ERROR_FORMAT = "错误，对象方法错误！请确认模板文件%s语法正确！";

    public static final String VM_OUTPUT_ERROR = "错误，输出模板结果错误！！请刷新！";

    public static final String DATA_NOT_FOUND_FORMAT = "错误，找不到数据文件！请确认数据文件%s是否存在（数据文件放在与jar包相同路径下）！";
}
