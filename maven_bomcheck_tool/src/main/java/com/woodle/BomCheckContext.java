package com.woodle;

import org.apache.maven.plugin.logging.Log;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-13 上午12:29
 */
public class BomCheckContext {

    private static InheritableThreadLocal<Log> Log = new InheritableThreadLocal<Log>();

    public static void setLog(Log log) {
        Log.set(log);
    }

    public static Log getLog() {
        return Log.get();
    }

    public static void release() {
        Log.remove();
    }
}
