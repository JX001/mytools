package com.jjx.mytools.service;

import com.jjx.mytools.entity.Dictdef;
import com.jjx.mytools.entity.Dictinfo;
import com.jjx.mytools.utils.Message;

public interface DictService {

	Message queryDictdefList();

	Message queryDictdefByDictId(int dictId);

	Message queryDictinfoByDictId(int dictId);

	void saveDictdef(Dictdef dictdef);
	
	void saveDictinfo(Dictinfo dictinfo);
	
	void delDictdefByDictId(int dictId);
	
	void delDictinfoByKey(int dictId,String dictCode);
}
