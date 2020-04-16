package com.jjx.mytools.service;

import com.jjx.mytools.dto.ImporterXmlDefgDto;
import com.jjx.mytools.utils.Message;

public interface ImporterXmlDefService {

	Message queryImporterXmlDef();
	
	void saveImporterXmlDefg(ImporterXmlDefgDto importerXmlDefgDto);
}
