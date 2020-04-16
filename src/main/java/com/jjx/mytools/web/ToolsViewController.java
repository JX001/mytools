package com.jjx.mytools.web;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjx.mytools.entity.Article;

/**
 * 
 * <p>功能： </p>
 * <p>版权： Copyright (c) 2019</p>
 * <p>创建日期：2019年12月5日 下午2:59:06</p>
 * <p>类全名：com.jjx.mytools.web.ToolsViewController</p>
 * 作者：姜金鑫
 * @version 1.0
 */
@Controller
@RequestMapping("/admin")
public class ToolsViewController {

	@RequestMapping("/myTools")
	public String myTools(Model m) {
		return "mytools";
	}

	@RequestMapping("/myTools2")
	public String myTools2(Model m) {
		return "mytools2";
	}

	/**
	 * ADMIN首页
	 */
	@RequestMapping("/index")
	public String index(Model m) {
		return "admin/index";
	}

	@RequestMapping("/tables")
	public String tables(Model m) {
		return "admin/tables";
	}

	/**
	 * 菜单管理页面
	 */
	@RequestMapping("/menulist")
	public String toMenuList(Model m) {
		return "admin/menuList";
	}

	/**
	 * 人员管理页面
	 */
	@RequestMapping("/userlist")
	public String toUserList(Model m) {
		return "admin/userList";
	}

	/**
	 * 字典管理页面
	 */
	@RequestMapping("/dictdef")
	public String toDictdef(Model m) {
		return "admin/dictdef";
	}

	/**
	 * XML字典管理页面
	 */
	@RequestMapping("/xmldef")
	public String toXmldef(Model m) {
		return "admin/xmldef";
	}
	/**
	 * XML文章管理页面
	 */
	@RequestMapping("/article")
	public String articleList(Model m) {
		return "admin/articleList";
	}
	/**
	 * XML文章管理页面
	 */
	@RequestMapping("/articleAdd")
	public String articleAdd(Model m) {
		return "admin/articleAdd";
	}
	/**
	 * 发布文章
	 */
	@RequestMapping("/saveArticleTo")
	@ResponseBody
	public Object saveArticleTo(@RequestBody Article article) {
		article.setArticleStatus(10);
	//	articleService.saveArticle(article);
		return "success";
	}
	
	/**
	 * 关于我页面
	 */
	@RequestMapping("/articleAbout")
	public String articleAbout(Model m) {
		return "admin/articleAbout";
	}
	
}
