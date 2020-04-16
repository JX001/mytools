package com.jjx.mytools.service;

import com.jjx.mytools.entity.Menu;
import com.jjx.mytools.utils.Message;

public interface MenuService {

	Message queryMenuList();
	Message queryMenuLisByType(int menuType);
	Message queryAllMenuList();
	void saveMenu(Menu menu);
}
