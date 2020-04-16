package com.jjx.mytools.utils;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Message implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 8171143968336740873L;
	private boolean ok;
	private String errorCode;// 日志错误编码
	private String mygType;// 校验标识符
	private Map<String, Object> data;
	private Object[] errors;
	private List<String> messageList;
	private String messageType;

	public String getMessageType() {
		return messageType;
	}

	public void setMessageType(String messageType) {
		this.messageType = messageType;
	}

	public String getMygType() {
		return mygType;
	}

	public void setMygType(String mygType) {
		this.mygType = mygType;
	}

	public String getErrorCode() {
		return errorCode;
	}

	public void setErrorCode(String errorCode) {
		this.errorCode = errorCode;
	}

	public boolean isOk() {
		return ok;
	}

	public void setOk(boolean ok) {
		this.ok = ok;
	}

	public Map<String, Object> getData() {
		return data;
	}

	public void setData(Map<String, Object> data) {
		this.data = data;
	}

	public Object[] getErrors() {
		return errors;
	}

	public void setErrors(Object[] errors) {
		this.errors = errors;
	}

	public List<String> getMessageList() {
		if (null == messageList)
			return new ArrayList<String>();
		return messageList;
	}

	public void setMessageList(List<String> messageList) {
		this.messageList = messageList;
	}

}
