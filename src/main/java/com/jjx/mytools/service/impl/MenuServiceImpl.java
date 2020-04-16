package com.jjx.mytools.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjx.mytools.dao.MenuDao;
import com.jjx.mytools.entity.Menu;
import com.jjx.mytools.entity.MenuExample;
import com.jjx.mytools.service.MenuService;
import com.jjx.mytools.utils.Message;

@Service
public class MenuServiceImpl implements MenuService {
	@Autowired
	MenuDao menuDao;

	public Message queryMenuList() {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		MenuExample example = new MenuExample();
		List<Integer> l = new ArrayList<Integer>();
		l.add(10);
		example.or().andMenuTypeIn(l);
		List<Menu> listMenu = menuDao.selectByExample(example);
		data.put("data", listMenu);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	public void saveMenu(Menu menu) {
		int menuId = menu.getMenuId();
		Menu m = menuDao.selectByPrimaryKey(menuId);
		
		if(m!=null){
			menu.setMenuCreatedate(new Date());
			menuDao.updateByPrimaryKey(menu);
		}else{
			menu.setMenuCreatedate(new Date());
			menuDao.insert(menu);
		}
		
	}

 
	public Message queryMenuLisByType(int menuType) {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		MenuExample example = new MenuExample();
		example.or().andMenuTypeEqualTo(menuType);
		List<Menu> listMenu = menuDao.selectByExample(example);
		data.put("data", listMenu);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	/* (non-Javadoc)
	 * @see com.jjx.mytools.service.MenuService#queryAllMenuList()
	 */
	public Message queryAllMenuList() {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		MenuExample example = new MenuExample();
		List<Menu> listMenu = menuDao.selectByExample(example);
		data.put("data", listMenu);
		message.setData(data);
		message.setOk(true);
		return message;
	}

}
