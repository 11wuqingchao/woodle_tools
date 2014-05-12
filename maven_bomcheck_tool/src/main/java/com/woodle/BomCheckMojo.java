package com.woodle;

import org.apache.maven.plugin.AbstractMojo;
import org.apache.maven.plugin.MojoExecutionException;
import org.apache.maven.plugin.logging.Log;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;

/**
 * Created with IntelliJ IDEA.
 * User: wuqingchao
 * Time: 14-5-12 下午11:45
 */
public class BomCheckMojo extends AbstractMojo {

    private File basedir;

    private BomCheck bomCheck;

    public BomCheckMojo() {
        bomCheck = new BomCheck();
    }

    public void execute() throws MojoExecutionException {
        Log log = getLog();
        BomCheckContext.setLog(log);

        log.info("check file bom header, file dir: "+basedir.getAbsolutePath());
        recurDirectory(basedir.getAbsolutePath());
        log.info("bom check passed");
    }

    public  void recurDirectory(String basedir) throws MojoExecutionException {
        File baseDir = new File(basedir);
        Log log = BomCheckContext.getLog();
        if (!baseDir.exists()) {
            log.info("base dir is not exist:" + basedir);
        } else {
            String[] files = baseDir.list();
            for (String file : files) {
                File readFile = new File(baseDir + CommonConstants.FILE_SEPRATER + file);
                if (readFile.isFile() && bomCheck.needCheck(file)) {
                    try {
                        FileInputStream in = new FileInputStream(readFile);
                        if (bomCheck.hasBom(in)) {
                            log.error(readFile.getAbsolutePath() + " has bom header,please check and remove it");
                            throw new MojoExecutionException("bom check fail");
                        }
                    } catch (FileNotFoundException e) {
                        log.warn(file + "is not found", e);
                    }
                } else if (readFile.isDirectory()) {
                    recurDirectory(baseDir + CommonConstants.FILE_SEPRATER + file);
                }
            }

        }
    }
}
