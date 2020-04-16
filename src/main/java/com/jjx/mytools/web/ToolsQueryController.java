package com.jjx.mytools.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.jjx.mytools.dto.ArticleDto;
import com.jjx.mytools.dto.ImporterXmlDefgDto;
import com.jjx.mytools.entity.Dictdef;
import com.jjx.mytools.entity.Dictinfo;
import com.jjx.mytools.entity.Menu;
import com.jjx.mytools.entity.User;
import com.jjx.mytools.service.ArticleService;
import com.jjx.mytools.service.DictService;
import com.jjx.mytools.service.ImporterXmlDefService;
import com.jjx.mytools.service.MenuService;
import com.jjx.mytools.service.UserService;
import com.jjx.mytools.utils.Message;
import com.jjx.mytools.utils.PageHelper;

@Controller
@RequestMapping("/admin")
public class ToolsQueryController {
	@Autowired
	private ImporterXmlDefService importerXmlDefService;
	@Autowired
	private MenuService menuService;
	@Autowired
	private UserService userService;
	@Autowired
	private DictService dictService;
	@Autowired
	private ArticleService articleService;

	@RequestMapping("/menu")
	@ResponseBody
	public List<Menu> menu(HttpServletRequest request, Model m) {
		Message message = menuService.queryMenuList();
		List<Menu> listMenu = (List<Menu>) message.getData().get("data");
		JSONArray jsonArray = new JSONArray(listMenu);
		request.setAttribute("data", jsonArray);
		return listMenu;
	}

	@RequestMapping("/queryMenuList")
	@ResponseBody
	public Message queryMenuList(HttpServletRequest request, Model m) {
		Message message = menuService.queryAllMenuList();
		// List<Menu> listMenu = (List<Menu>) message.getData().get("data");
		// JSONArray jsonArray = new JSONArray(listMenu);
		return message;
	}

	@RequestMapping("/queryUserList")
	@ResponseBody
	public Message queryUserList(HttpServletRequest request, Model m) {
		Message message = userService.queryUserList();
		// List<User> listMenu = (List<User>) message.getData().get("data");
		// JSONArray jsonArray = new JSONArray(listMenu);
		return message;
	}

	@RequestMapping("/xmltool")
	public String openXmlView(HttpServletRequest request, Model m) {
		Message message = importerXmlDefService.queryImporterXmlDef();
		List<ImporterXmlDefgDto> list = (List<ImporterXmlDefgDto>) message.getData().get("data");
		JSONArray jsonArray = new JSONArray(list);
		request.setAttribute("data", jsonArray);
		return "xmltool";
	}

	@RequestMapping("/demo1")
	@ResponseBody
	public Object demo1(@RequestBody ImporterXmlDefgDto importerXmlDefgDto) {
		System.out.println(importerXmlDefgDto.toString());
		importerXmlDefService.saveImporterXmlDefg(importerXmlDefgDto);
		return "success";
	}

	/**
	 * 添加菜单
	 * @param menu
	 * @return
	 */
	@RequestMapping("/addMenu")
	@ResponseBody
	public Object addMenu(@RequestBody Menu menu) {
		System.out.println(menu.toString());
		menuService.saveMenu(menu);
		return "success";
	}

	/**
	 * 添加人员
	 */
	@RequestMapping("/addUser")
	@ResponseBody
	public Object addUser(@RequestBody User user) {
		System.out.println(user.toString());
		userService.saveUser(user);
		return "success";
	}

	@RequestMapping("/queryDictdefList")
	@ResponseBody
	public Message queryDictdefList(Model m) {
		Message message = dictService.queryDictdefList();
		return message;
	}

	/**
	 * 添加字典
	 */
	@RequestMapping("/saveDictdef")
	@ResponseBody
	public Object saveDictdef(@RequestBody Dictdef dictdef) {
		dictService.saveDictdef(dictdef);
		return "success";
	}

	/**
	 * 添加字典
	 */
	@RequestMapping("/saveDictinfo")
	@ResponseBody
	public Object saveDictinfo(@RequestBody Dictinfo dictinfo) {
		dictService.saveDictinfo(dictinfo);
		return "success";
	}

	/**
	 * 删除字典Def
	 */
	@RequestMapping("/delDictdef")
	@ResponseBody
	public Object delDictdef(@RequestBody Dictdef dictdef) {
		dictService.delDictdefByDictId(dictdef.getDictId());
		return "success";
	}

	/**
	 * 删除字典Info
	 */
	@RequestMapping("/delDictinfo")
	@ResponseBody
	public Object delDictinfo(@RequestBody Dictinfo dictinfo) {
		int dictId = dictinfo.getDictId();
		String dictCode = dictinfo.getDictCode();
		dictService.delDictinfoByKey(dictId, dictCode);
		return "success";
	}

	/**
	 * 查询字典明细
	 */
	@RequestMapping("/queryDictinfo")
	@ResponseBody
	public Message queryDictinfo(@RequestBody Dictdef dictdef) {
		Message message = dictService.queryDictinfoByDictId(dictdef.getDictId());
		return message;
	}

	/**
	 * 查询文章LIST
	 */
	@RequestMapping("/queryArticleList")
	@ResponseBody
	public Message queryArticleList(@RequestParam(value = "offset") Integer offset,
            @RequestParam(value = "limit",defaultValue = "10") Integer limit) {
		Message message = articleService.queryArticleByType(10);
		PageHelper pa  =new PageHelper();
		List l = (List) message.getData().get("data");
		pa.setRows(l);
		return message;
	}
	/**
	 * 查询文章LIST
	 */
	@RequestMapping("/queryArticleList2")
	@ResponseBody
	public PageHelper queryArticleList2(@RequestParam(value = "offset") Integer offset,
            @RequestParam(value = "limit",defaultValue = "10") Integer limit,@RequestParam(value = "page",defaultValue = "10") Integer page) {
		Message message = articleService.queryArticleByType(10, offset, limit);
		PageHelper pa  =new PageHelper();
		List l = (List) message.getData().get("data");
		pa.setRows(l);
		pa.setTotal(articleService.countArticleSize(10));
		return pa;
	}

	/**
	 * 发布文章
	 */
	@RequestMapping("/saveArticle")
	@ResponseBody
	public Object saveArticle(@RequestBody ArticleDto articleDto) {
		articleDto.setArticleStatus(70);
		articleService.saveArticle(articleDto);
		System.out.println(articleDto.toString());
		return "success";
	}

	@RequestMapping("/queryMenuListByType20")
	@ResponseBody
	public Message queryMenuListByType20(HttpServletRequest request, Model m) {
		Message message = menuService.queryMenuLisByType(20);
		return message;
	}
	
	/**
	 * 查询文章
	 */
	@RequestMapping("/queryArticleByType")
	@ResponseBody
	public Message queryArticleByType(@RequestParam("type") int type) {
		Message message = articleService.queryArticleByType(type);
		return message;
	}
	/**
	 * 修改文章
	 */
	@RequestMapping("/updateArticle")
	@ResponseBody
	public Object updateArticle(@RequestBody ArticleDto articleDto) {
		articleDto.setArticleStatus(70);
		articleService.saveArticle(articleDto);
		return "success";
	}
	/**
	 * 删除文章
	 */
	@RequestMapping("/delArticle")
	@ResponseBody
	public Object delArticle(@RequestBody ArticleDto articleDto) {
		String articleId = articleDto.getArticleId();
		articleService.delArticle(articleId);
		return "success";
	}
	/**
	 *  
	 */
	@RequestMapping("/articleUpd")
	public String articleUpd(HttpServletRequest request, @RequestParam("articleId") String articleId) {
		request.setAttribute("articleId", articleId);
		return "admin/articleUpd";
	}
	
	/**
	 * 查询文章 BY id
	 */
	@RequestMapping("/queryArticleByID")
	@ResponseBody
	public Message queryArticleByID(@RequestParam("articleId") String articleId) {
		Message message = articleService.queryArticleById(articleId);
		return message;
	}
 
}
