package com.woodle.utils;

import java.io.UnsupportedEncodingException;
import java.net.URL;
import java.net.URLDecoder;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-10 下午7:05
 */
public class PathUtil {
    public static String ROOT_DIR = "";

    static {
        URL url = PathUtil.class.getProtectionDomain().getCodeSource().getLocation();
        try {
            ROOT_DIR = URLDecoder.decode(url.getPath(), "UTF-8");
        } catch (UnsupportedEncodingException e) {
            System.out.println("decode file path exception!!");
        }
        if (ROOT_DIR.endsWith(".jar"))
            ROOT_DIR = ROOT_DIR.substring(0, ROOT_DIR.lastIndexOf("/") + 1);
        System.out.println("jar root directory is:"+ROOT_DIR);
    }

}
