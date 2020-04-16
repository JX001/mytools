package com.jjx.mytools.web;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjx.mytools.entity.Article;

/**
 * <p>功能： </p>
 * <p>版权： Copyright (c) 2020</p>
 * <p>创建日期：2020年1月3日 上午11:17:39</p>
 * <p>类全名：com.jjx.mytools.web.AdminViewController</p>
 * 作者：姜金鑫
 * @version 1.0
 */
@Controller
@RequestMapping("/xadmin")
public class AdminViewController {

	/**
	 * xadmin首页
	 */
	@RequestMapping("/index")
	public String index(Model m) {
		return "xadmin/index";
	}

	@RequestMapping("/welcome")
	public String welcome(Model m) {
		return "xadmin/welcome";
	}

	@RequestMapping("/welcome1")
	public String welcome1(Model m) {
		return "xadmin/welcome1";
	}

	/**
	 * 菜单管理页面
	 */
	@RequestMapping("/menulist")
	public String toMenuList(Model m) {
		return "xadmin/menuList";
	}

	/**
	 * 人员管理页面
	 */
	@RequestMapping("/userlist")
	public String toUserList(Model m) {
		return "xadmin/userList";
	}

	/**
	 * 字典管理页面
	 */
	@RequestMapping("/dictdef")
	public String toDictdef(Model m) {
		return "xadmin/dictdef";
	}

	/**
	 * XML字典管理页面
	 */
	@RequestMapping("/xmldef")
	public String toXmldef(Model m) {
		return "xadmin/xmldef";
	}

	/**
	 * XML文章管理页面
	 */
	@RequestMapping("/article-list")
	public String articleList(Model m) {
		return "xadmin/article-list";
	}

	/**
	 * XML文章管理页面
	 */
	@RequestMapping("/article-add")
	public String articleAdd(Model m) {
		return "xadmin/article-add";
	}

	/**
	 * 发布文章
	 */
	@RequestMapping("/saveArticleTo")
	@ResponseBody
	public Object saveArticleTo(@RequestBody Article article) {
		article.setArticleStatus(10);
		// articleService.saveArticle(article);
		return "success";
	}

	/**
	 * 关于我页面
	 */
	@RequestMapping("/articleAbout")
	public String articleAbout(Model m) {
		return "xadmin/articleAbout";
	}

}
