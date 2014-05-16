package com.woodle.template;

import com.woodle.template.impl.VelocityRender;

import java.io.File;
import java.util.Map;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-15 下午11:19
 */
public abstract class AbstractTemplateRender implements ITemplateRender<Map<String, Object>> {


    @Override
    public ITemplateRender<Map<String, Object>> switchTemplateRender(String vmTemplateFile, String fmTemplateFile) {
        File vmFile = new File(vmTemplateFile);
        File fmFile = new File(fmTemplateFile);

        if (vmFile.exists() && fmFile.exists()) {
            System.out.println("error!! both velocity template file and freemarkder existes, please make sure only one template file!!");
            return null;
        }

        if (vmFile.exists()) {
            return new VelocityRender();
        }

        if (fmFile.exists()) {
            System.out.println("error!! lack of freemarker render");
            return null;
        }

        System.out.println("lack of template file");
        return null;
    }
}
