package com.woodle.common;

/**
 * 常数
 * User: wuqingchao
 * Time: 14-5-11 下午10:55
 */
public class CommonConstants {

    public static final int PORT_LISTENED = 12321;

    /* 网页URL根目录地址 */
    public static final String URL_ROOT_DIR = "/";

    /* 无效请求 */
    public static final String INVALID_URI = "favicon.ico";

    /* json文件的后缀名 */
    public static final String JSON_DATA_SURFIX = ".json";

    /* xml文件的后缀名 */
    public static final String XML_DATA_SURFIX = ".xml";

    /* velocity模板文件的后缀名 */
    public static final String VM_TEMPLATE_SURFIX = ".vm";

    /* freemarker模板后缀名*/
    public static final String FM_TEMPLATE_SURFIX = ".fm";

    /* 请求类型不支持 */
    public static final String INVALID_REQUST_METHOD = "不支持该请求类型，仅支持GET请求";

    public static final String VM_NOT_FOUND_FORMAT = "错误，找不到模板文件！请确认模板文件%s是否存在（模板文件放在与jar包相同路径下）！";

    public static final String PARSE_VM_ERROR_FORMAT = "错误，解析模板错误！请确认模板文件%s语法正确！";

    public static final String INVOKE_VM_METHOD_ERROR_FORMAT = "错误，对象方法错误！请确认模板文件%s语法正确！";

    public static final String VM_OUTPUT_ERROR = "错误，输出模板结果错误！！请刷新！";

    public static final String DATA_NOT_FOUND_FORMAT = "错误，找不到数据文件！请确认数据文件%s是否存在（数据文件放在与jar包相同路径下）！";

}
