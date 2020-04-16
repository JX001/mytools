package com.jjx.mytools.service.impl;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.jjx.mytools.dao.ArticleDao;
import com.jjx.mytools.dto.ArticleDto;
import com.jjx.mytools.entity.Article;
import com.jjx.mytools.entity.ArticleExample;
import com.jjx.mytools.entity.ArticleWithBLOBs;
import com.jjx.mytools.service.ArticleService;
import com.jjx.mytools.utils.Message;

@Service
public class ArticleServiceImpl implements ArticleService {
	@Autowired
	ArticleDao articleDao;

	public Message queryArticleList() {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArticleExample example = new ArticleExample();
		List<Article> listMenu = articleDao.selectByExample(example);
		data.put("data", listMenu);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	public void saveArticle(ArticleDto articleDto) {
		ArticleWithBLOBs articleWithBLOBs = new ArticleWithBLOBs();
		String id = articleDto.getArticleId();
		articleWithBLOBs.setArticleTitle(articleDto.getArticleTitle());
		articleWithBLOBs.setArticleName(articleDto.getArticleName());
		articleWithBLOBs.setArticleTag(articleDto.getArticleTag());
		articleWithBLOBs.setArticleContent(articleDto.getArticleContent());
		articleWithBLOBs.setArticleStatus(articleDto.getArticleStatus());
		articleWithBLOBs.setArticleType(articleDto.getArticleType());
		articleWithBLOBs.setArticleKeywords(articleDto.getArticleKeywords());
		articleWithBLOBs.setArticleDescription(articleDto.getArticleDescription());
		articleWithBLOBs.setArticleFlag(articleDto.getArticleFlag());
		articleWithBLOBs.setArticleMenuid(articleDto.getArticleMenuid());
		articleWithBLOBs.setArticleUserid(articleDto.getArticleUserid());
		articleWithBLOBs.setArticleUsername(articleDto.getArticleUsername());

		if (id == null || "".equals(id)) {
			String articleId = UUID.randomUUID().toString().replaceAll("-", "");
			articleWithBLOBs.setArticleId(articleId);
			articleWithBLOBs.setArticleCount(0);
			articleWithBLOBs.setArticleCreatedate(new Date());
			articleDao.insert(articleWithBLOBs);
		} else {
			articleWithBLOBs.setArticleId(id);
			articleWithBLOBs.setArticleCount(articleDto.getArticleCount());
			articleWithBLOBs.setArticleUpdatedate(new Date());
			articleWithBLOBs.setArticleCreatedate(articleDto.getArticleCreatedate());
			articleDao.updateByPrimaryKeySelective(articleWithBLOBs);
		}

	}

	public Message queryArticleByType(int articleType) {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArticleExample example = new ArticleExample();
		example.or().andArticleTypeEqualTo(articleType);
		List<ArticleWithBLOBs> listMenu = articleDao.selectByExampleWithBLOBs(example);
		data.put("data", listMenu);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	public void addArticle(ArticleDto articleDto) {
		ArticleWithBLOBs articleWithBLOBs = new ArticleWithBLOBs();
		String articleId = UUID.randomUUID().toString().replaceAll("-", "");
		articleWithBLOBs.setArticleId(articleId);
		articleWithBLOBs.setArticleTitle(articleDto.getArticleTitle());
		articleWithBLOBs.setArticleName(articleDto.getArticleName());
		articleWithBLOBs.setArticleTag(articleDto.getArticleTag());
		articleWithBLOBs.setArticleContent(articleDto.getArticleContent());
		articleWithBLOBs.setArticleStatus(articleDto.getArticleStatus());
		articleWithBLOBs.setArticleType(articleDto.getArticleType());
		articleWithBLOBs.setArticleCount(0);
		articleWithBLOBs.setArticleKeywords(articleDto.getArticleKeywords());
		articleWithBLOBs.setArticleDescription(articleDto.getArticleDescription());
		articleWithBLOBs.setArticleFlag(articleDto.getArticleFlag());
		articleWithBLOBs.setArticleMenuid(articleDto.getArticleMenuid());
		articleWithBLOBs.setArticleUserid(articleDto.getArticleUserid());
		articleWithBLOBs.setArticleUsername(articleDto.getArticleUsername());
		articleWithBLOBs.setArticleCreatedate(new Date());
		articleDao.insert(articleWithBLOBs);

	}

	public void updateArticle(ArticleDto articleDto) {
		String articleId = articleDto.getArticleId();
		ArticleWithBLOBs articleWithBLOBs = new ArticleWithBLOBs();
		articleWithBLOBs.setArticleId(articleId);
		articleWithBLOBs.setArticleTitle(articleDto.getArticleTitle());
		articleWithBLOBs.setArticleName(articleDto.getArticleName());
		articleWithBLOBs.setArticleTag(articleDto.getArticleTag());
		articleWithBLOBs.setArticleContent(articleDto.getArticleContent());
		articleWithBLOBs.setArticleStatus(articleDto.getArticleStatus());
		articleWithBLOBs.setArticleType(articleDto.getArticleType());
		articleWithBLOBs.setArticleCount(articleDto.getArticleCount());
		articleWithBLOBs.setArticleKeywords(articleDto.getArticleKeywords());
		articleWithBLOBs.setArticleDescription(articleDto.getArticleDescription());
		articleWithBLOBs.setArticleFlag(articleDto.getArticleFlag());
		articleWithBLOBs.setArticleMenuid(articleDto.getArticleMenuid());
		articleWithBLOBs.setArticleUserid(articleDto.getArticleUserid());
		articleWithBLOBs.setArticleUsername(articleDto.getArticleUsername());
		articleDao.updateByPrimaryKeyWithBLOBs(articleWithBLOBs);
	}

	public void delArticle(String articleId) {

		articleDao.deleteByPrimaryKey(articleId);
	}

	public Message queryArticleById(String articleId) {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		ArticleWithBLOBs listMenu = articleDao.selectByPrimaryKey(articleId);
		data.put("data", listMenu);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	/* (non-Javadoc)
	 * @see com.jjx.mytools.service.ArticleService#queryArticleByType(int, int, int)
	 */
	public Message queryArticleByType(int articleType, int offset, int limit) {
		Message message = new Message();
		HashMap<String, Object> data = new HashMap<String, Object>();
		Article  article = new Article ();
		article.setArticleType(articleType);
		article.setOffset(offset);
		article.setLimit(limit);
		List<Article> listMenu = articleDao.selectByArtycleType(article);
		data.put("data", listMenu);
		message.setData(data);
		message.setOk(true);
		return message;
	}

	/* (non-Javadoc)
	 * @see com.jjx.mytools.service.ArticleService#countArticleSize(int)
	 */
	public int countArticleSize(int articleType) {
		ArticleExample example = new ArticleExample();
		example.or().andArticleTypeEqualTo(articleType);
		return (int) articleDao.countByExample(example);
	}

	/* (non-Javadoc)
	 * @see com.jjx.mytools.service.ArticleService#updateArticleCount(java.lang.String)
	 */
	@Override
	public void updateArticleCount(String articleId) {
		articleDao.updateArticleCountById(articleId);
	}

	/* (non-Javadoc)
	 * @see com.jjx.mytools.service.ArticleService#queryArticleClickCount(java.lang.String)
	 */
	@Override
	public int queryArticleClickCount(String articleId) {
		 
		return articleDao.queryArticleCountById(articleId);
	}

}
