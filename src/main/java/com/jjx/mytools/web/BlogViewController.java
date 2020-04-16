/**
 * 
 */
package com.jjx.mytools.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjx.mytools.entity.ArticleWithBLOBs;
import com.jjx.mytools.entity.Menu;
import com.jjx.mytools.service.ArticleService;
import com.jjx.mytools.service.DictService;
import com.jjx.mytools.service.MenuService;
import com.jjx.mytools.service.UserService;
import com.jjx.mytools.utils.Message;

/**
 * <p>功能： </p>
 * <p>版权： Copyright (c) 2019</p>
 * <p>创建日期：2019年12月27日 上午9:23:55</p>
 * <p>类全名：com.jjx.mytools.web.BlogViewController</p>
 * 作者：姜金鑫
 * @version 1.0
 */
@Controller
public class BlogViewController {
	@Autowired
	private UserService userService;
	@Autowired
	private DictService dictService;
	@Autowired
	private ArticleService articleService;
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/blogmenu")
	@ResponseBody
	public List<Menu> blogmenu(HttpServletRequest request, Model m) {
		Message message = menuService.queryMenuLisByType(20);
		List<Menu> listMenu = (List<Menu>) message.getData().get("data");
		JSONArray jsonArray = new JSONArray(listMenu);
		request.setAttribute("data", jsonArray);
		return listMenu;
	}
	
	
	@RequestMapping("/index")
	public String blogIndex(Model m) {
		return "blog/index";
	}

	@RequestMapping("/about")
	public String blogAbout(Model m) {
		// Message message = articleService.queryArticleByType(50);
		return "blog/about";
	}
	@RequestMapping("/time")
	public String blogTime(Model m) {
		// Message message = articleService.queryArticleByType(50);
		return "blog/time";
	}
	@RequestMapping("/blogs")
	public String blogList(Model m) {
		return "blog/articleList";
	}

	@RequestMapping("/queryAbout")
	@ResponseBody
	public Message queryAbout() {
		Message message = articleService.queryArticleByType(50);
		return message;
	}

	@RequestMapping("/queryBlogList")
	@ResponseBody
	public Message queryBlogList() {
		Message message = articleService.queryArticleByType(10);
		return message;
	}

	@RequestMapping("/blogs/{hostKey}")
	public String queryArticleByKey(@PathVariable String hostKey,HttpServletRequest request) throws Exception {
		Message message = articleService.queryArticleById(hostKey);
		ArticleWithBLOBs a = (ArticleWithBLOBs) message.getData().get("data");
		request.setAttribute("articleData", a);
		return "blog/articleInfo";
	}
	@RequestMapping("/articleclick/{hostKey}/{count}")
	@ResponseBody
	public String articleclick(@PathVariable String hostKey,@PathVariable int count,HttpServletRequest request) throws Exception {
		articleService.updateArticleCount(hostKey);
		count =articleService.queryArticleClickCount(hostKey);
		return "document.write("+count+")";
	}
}
