package com.jjx.mytools.service;

import com.jjx.mytools.dto.ArticleDto;
import com.jjx.mytools.utils.Message;

public interface ArticleService {

	Message queryArticleList();
	
	Message queryArticleByType(int articleType);
	
	Message queryArticleByType(int articleType,int offset,int limit);
	
	int countArticleSize(int articleType);
	
	Message queryArticleById(String articleId);
	
	void saveArticle(ArticleDto articleDto);
	
	void addArticle(ArticleDto articleDto);
	
	void updateArticle(ArticleDto articleDto);
	
	void updateArticleCount(String articleId);
	int queryArticleClickCount(String articleId);
	
	void delArticle(String articleId);
			
}
