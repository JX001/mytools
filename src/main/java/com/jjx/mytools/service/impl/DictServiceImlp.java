/**
 * 
 */
package com.jjx.mytools.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjx.mytools.dao.DictdefDao;
import com.jjx.mytools.dao.DictinfoDao;
import com.jjx.mytools.entity.Dictdef;
import com.jjx.mytools.entity.DictdefExample;
import com.jjx.mytools.entity.Dictinfo;
import com.jjx.mytools.entity.DictinfoExample;
import com.jjx.mytools.entity.DictinfoKey;
import com.jjx.mytools.service.DictService;
import com.jjx.mytools.utils.Message;

/**
 * <p>功能： </p>
 * <p>版权： Copyright (c) 2019</p>
 * <p>创建日期：2019年12月5日 下午3:30:15</p>
 * <p>类全名：com.jjx.mytools.service.impl.DictServiceImlp</p>
 * 作者：姜金鑫
 * @version 1.0
 */
@Service
public class DictServiceImlp implements DictService {
	@Autowired
	DictdefDao dictdefDao;
	@Autowired
	DictinfoDao dictinfoDao;

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jjx.mytools.service.DictService#queryDictdefList()
	 */
	public Message queryDictdefList() {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		DictdefExample example = new DictdefExample();
		List<Dictdef> list = dictdefDao.selectByExample(example);
		data.put("data", list);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jjx.mytools.service.DictService#queryDictdefByDictId(int)
	 */
	public Message queryDictdefByDictId(int dictId) {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		DictdefExample example = new DictdefExample();
		example.or().andDictIdEqualTo(dictId);
		List<Dictdef> list = dictdefDao.selectByExample(example);
		data.put("data", list);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jjx.mytools.service.DictService#queryDictinfoByDictId(int)
	 */
	public Message queryDictinfoByDictId(int dictId) {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		DictinfoExample example = new DictinfoExample();
		example.or().andDictIdEqualTo(dictId);
		List<Dictinfo> list = dictinfoDao.selectByExample(example);
		data.put("data", list);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.jjx.mytools.service.DictService#saveDictdef(com.jjx.mytools.entity.
	 * Dictdef)
	 */
	public void saveDictdef(Dictdef dictdef) {
		int dictId = dictdef.getDictId();
		Dictdef d = dictdefDao.selectByPrimaryKey(dictId);
		Date date = new Date();
		dictdef.setDictUpdatedate(date);
		if (d != null) {
			dictdefDao.updateByPrimaryKey(dictdef);
		} else {
			dictdef.setDictCreatedate(date);
			dictdefDao.insert(dictdef);
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.jjx.mytools.service.DictService#saveDictinfo(com.jjx.mytools.entity.
	 * Dictinfo)
	 */
	public void saveDictinfo(Dictinfo dictinfo) {
		int dictId = dictinfo.getDictId();
		String dictCode = dictinfo.getDictCode();
		DictinfoKey key = new DictinfoKey();
		key.setDictId(dictId);
		key.setDictCode(dictCode);
		Dictinfo d = dictinfoDao.selectByPrimaryKey(key);
		if (d != null) {
			dictinfoDao.updateByPrimaryKey(dictinfo);
		} else {
			dictinfoDao.insert(dictinfo);
		}

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see
	 * com.jjx.mytools.service.DictService#delDictdef(com.jjx.mytools.entity.
	 * Dictdef)
	 */
	public void delDictdefByDictId(int dictId) {
		dictdefDao.deleteByPrimaryKey(dictId);
		DictinfoExample example = new DictinfoExample();
		example.or().andDictIdEqualTo(dictId);
		dictinfoDao.deleteByExample(example);

	}

	/*
	 * (non-Javadoc)
	 * 
	 * @see com.jjx.mytools.service.DictService#delDictinfoByKey(int,
	 * java.lang.String)
	 */
	public void delDictinfoByKey(int dictId, String dictCode) {
		DictinfoKey key = new DictinfoKey();
		key.setDictId(dictId);
		key.setDictCode(dictCode);
		dictinfoDao.deleteByPrimaryKey(key);

	}

}
