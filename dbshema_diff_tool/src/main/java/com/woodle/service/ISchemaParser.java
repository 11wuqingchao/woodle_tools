package com.woodle.service;

import com.woodle.model.DB;

public interface ISchemaParser {
	
	/**
	 * 
	 * @param source 可以为文件名;
	 * @Param source 可以为一个jdbc的url(TODO)
	 * @return
	 */
	public DB parse2DB(String source);

}
