package com.woodle.constant;

public enum DiffType {
	ADD(1, "新增"), 
	DELETE(2, "删除"), 
	MODIFY(3, "修改");
	
	public int code;
	public String desc;
	
	DiffType(int code, String desc) {
		this.code = code;
		this.desc = desc;
	}
}
