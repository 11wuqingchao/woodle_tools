package com.woodle;

import org.apache.maven.plugin.logging.Log;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.PushbackInputStream;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-13 上午12:01
 */
public class BomCheck {

    public boolean needCheck(String fileName) {
        for (String subfix : CommonConstants.FILE_NEED_CHECK_BOM) {
            if (fileName.endsWith(subfix))
                return true;
        }
        return false;
    }

    public boolean hasBom(FileInputStream in) {
        Log log = BomCheckContext.getLog();
        PushbackInputStream internalIn = new PushbackInputStream(in, CommonConstants.BOM_SIZE);
        byte bom[] = new byte[CommonConstants.BOM_SIZE];

        try {
            internalIn.read(bom, 0, bom.length);

            if ((bom[0] == (byte) 0x00) && (bom[1] == (byte) 0x00) && (bom[2] == (byte) 0xFE)
                    && (bom[3] == (byte) 0xFF)) {
                log.error("bom found:encoding is UTF-32BE");
                return true;
            } else if ((bom[0] == (byte) 0xFF) && (bom[1] == (byte) 0xFE) && (bom[2] == (byte) 0x00)
                    && (bom[3] == (byte) 0x00)) {
                log.error("bom found:encoding is UTF-32LE");
                return true;
            } else if ((bom[0] == (byte) 0xEF) && (bom[1] == (byte) 0xBB) && (bom[2] == (byte) 0xBF)) {
                log.error("bom found:encoding is UTF-8");
                return true;
            } else if ((bom[0] == (byte) 0xFE) && (bom[1] == (byte) 0xFF)) {
                log.error("bom found:encoding is UTF-16BE");
                return true;
            } else if ((bom[0] == (byte) 0xFF) && (bom[1] == (byte) 0xFE)) {
                log.error("bom found:encoding is UTF-16LE");
                return true;
            } else {
                return false;
            }
        } catch (IOException e) {
            log.warn("read file fail", e);
            return false;
        } finally {
            try {
                internalIn.close();
            } catch (IOException e) {
            }
        }

    }
}
