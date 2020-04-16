package com.jjx.mytools.service.impl;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.jjx.mytools.dao.ImporterXmlDefDao;
import com.jjx.mytools.dao.ImporterXmlDefgDao;
import com.jjx.mytools.dto.ImporterXmlDefgDto;
import com.jjx.mytools.entity.ImporterXmlDefg;
import com.jjx.mytools.entity.ImporterXmlDefgExample;
import com.jjx.mytools.entity.ImporterXmlDefgWithBLOBs;
import com.jjx.mytools.service.ImporterXmlDefService;
import com.jjx.mytools.utils.Message;

@Service
public class ImporterXmlDefServiceImpl implements ImporterXmlDefService {
	@Autowired
	ImporterXmlDefDao importerXmlDefDao;
	@Autowired
	ImporterXmlDefgDao importerXmlDefgDao;

	public Message queryImporterXmlDef() {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		ImporterXmlDefgExample example = new ImporterXmlDefgExample();
		List<ImporterXmlDefg> list = importerXmlDefgDao.selectByExample(example);
		
		List<ImporterXmlDefgDto> listdto= new ArrayList<ImporterXmlDefgDto>();
		for (ImporterXmlDefg importerXmlDefg : list) {
			ImporterXmlDefgDto dto  = new ImporterXmlDefgDto();
			String elementlevl=importerXmlDefg.getElementlevl();
			dto.setId(Integer.parseInt(elementlevl));
			if(elementlevl.length()==2){
				dto.setPid(0);
				importerXmlDefg.setPid("0");
			}else{
				dto.setPid(Integer.parseInt(elementlevl.substring(0, elementlevl.length()-2)));
				importerXmlDefg.setPid(elementlevl.substring(0, elementlevl.length()-2));
			}
			dto.setElementdesc(importerXmlDefg.getElementdesc());
			dto.setElementlevl(importerXmlDefg.getElementlevl());
			dto.setElementname(importerXmlDefg.getElementname());
			//dto.setFldname(importerXmlDefg.getFldname());
			dto.setXmlcode(importerXmlDefg.getXmlcode());
			dto.setTables(importerXmlDefg.getTables());
			//dto.setFlags(importerXmlDefg.getFlags());
			listdto.add(dto);
		}
		data.put("data", listdto);
		message.setData(data);
		message.setOk(true);

		return message;
	}

	public void saveImporterXmlDefg(ImporterXmlDefgDto importerXmlDefgDto) {
		ImporterXmlDefgWithBLOBs importerXmlDefg = new ImporterXmlDefgWithBLOBs();
		importerXmlDefg.setXmlcode(importerXmlDefgDto.getXmlcode());
		importerXmlDefg.setElementlevl(importerXmlDefgDto.getElementlevl());
		importerXmlDefg.setElementname(importerXmlDefgDto.getElementname());
		importerXmlDefg.setElementdesc(importerXmlDefgDto.getElementdesc());
		importerXmlDefg.setFlags(importerXmlDefgDto.getFlags());
		importerXmlDefg.setTables(importerXmlDefgDto.getTables());
		importerXmlDefg.setFldname(importerXmlDefgDto.getFldname());
		importerXmlDefgDao.insert(importerXmlDefg);

	}

}
