package com.woodle.template.impl;

import com.woodle.common.CommonConstants;
import com.woodle.template.AbstractTemplateRender;
import com.woodle.template.ITemplateRender;
import com.woodle.utils.PathUtil;
import org.apache.velocity.Template;
import org.apache.velocity.VelocityContext;
import org.apache.velocity.app.Velocity;
import org.apache.velocity.exception.MethodInvocationException;
import org.apache.velocity.exception.ParseErrorException;
import org.apache.velocity.exception.ResourceNotFoundException;
import org.apache.velocity.tools.ToolManager;

import java.io.File;
import java.io.IOException;
import java.io.StringWriter;
import java.util.Map;
import java.util.Properties;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-11 下午10:12
 */
public class VelocityRender extends AbstractTemplateRender {
    private static Properties p = new Properties();

    private static VelocityContext context;

    static {
        p.setProperty(Velocity.INPUT_ENCODING, "UTF-8");
        p.setProperty(Velocity.OUTPUT_ENCODING, "UTF-8");
//		p.setProperty("file.resource.loader.class", "org.apache.velocity.runtime.resource.loader.ClasspathResourceLoader");
        p.setProperty("file.resource.loader.path", PathUtil.ROOT_DIR);
        ToolManager toolManager = new ToolManager();
        toolManager.configure("velocity_tools.xml");
        context = new VelocityContext(toolManager.createContext());
    }


    @Override
    public String renderTemplate(String templateFile, Map<String, Object> paramMap) {
        Velocity.init(p);
        String ret;

        try {
            for (String s : paramMap.keySet()) {
                context.put(s, paramMap.get(s));
            }

            StringWriter writer = new StringWriter();
            Template template = Velocity.getTemplate(templateFile);
            template.merge(context, writer);
            ret = writer.toString();
            writer.close();

        } catch(ResourceNotFoundException ex) {
            System.out.println("couldn't find the template!");
            ret  = String.format(CommonConstants.VM_NOT_FOUND_FORMAT, templateFile);
        } catch( ParseErrorException pee )  {
            System.out.println("syntax error : problem parsing the template!");
            ret  = String.format(CommonConstants.PARSE_VM_ERROR_FORMAT, templateFile);
        }  catch(MethodInvocationException mie )  {
            System.out.println("a method on a referenced object in the context could not invoked!");
            ret  = String.format(CommonConstants.INVOKE_VM_METHOD_ERROR_FORMAT, templateFile);
        }  catch (IOException e) {
            System.out.println("output vm content error!");
            ret  = CommonConstants.VM_OUTPUT_ERROR;
        }
        return ret;
    }




}
