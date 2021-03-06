package com.jjx.mytools.dto;

import java.io.Serializable;
import java.util.Date;

public class ArticleDto implements Serializable {
	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_id
	 *
	 * @mbg.generated
	 */
	private String articleId;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_title
	 *
	 * @mbg.generated
	 */
	private String articleTitle;
	/**
	*
	* This field was generated by MyBatis Generator.
	* This field corresponds to the database column article.article_content
	*
	* @mbg.generated
	*/
	private String articleContent;

 
	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_name
	 *
	 * @mbg.generated
	 */
	private String articleName;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_keywords
	 *
	 * @mbg.generated
	 */
	private String articleKeywords;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_userid
	 *
	 * @mbg.generated
	 */
	private Integer articleUserid;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_createdate
	 *
	 * @mbg.generated
	 */
	private Date articleCreatedate;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_updatedate
	 *
	 * @mbg.generated
	 */
	private Date articleUpdatedate;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_status
	 *
	 * @mbg.generated
	 */
	private Integer articleStatus;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_flag
	 *
	 * @mbg.generated
	 */
	private Integer articleFlag;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_description
	 *
	 * @mbg.generated
	 */
	private String articleDescription;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_count
	 *
	 * @mbg.generated
	 */
	private Integer articleCount;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_tag
	 *
	 * @mbg.generated
	 */
	private String articleTag;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_menuid
	 *
	 * @mbg.generated
	 */
	private String articleMenuid;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_type
	 *
	 * @mbg.generated
	 */
	private Integer articleType;

	/**
	 *
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database column article.article_username
	 *
	 * @mbg.generated
	 */
	private String articleUsername;

	/**
	 * This field was generated by MyBatis Generator.
	 * This field corresponds to the database table article
	 *
	 * @mbg.generated
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_id
	 *
	 * @return the value of article.article_id
	 *
	 * @mbg.generated
	 */
	public String getArticleId() {
		return articleId;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_id
	 *
	 * @param articleId the value for article.article_id
	 *
	 * @mbg.generated
	 */
	public void setArticleId(String articleId) {
		this.articleId = articleId == null ? null : articleId.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_title
	 *
	 * @return the value of article.article_title
	 *
	 * @mbg.generated
	 */
	public String getArticleTitle() {
		return articleTitle;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_title
	 *
	 * @param articleTitle the value for article.article_title
	 *
	 * @mbg.generated
	 */
	public void setArticleTitle(String articleTitle) {
		this.articleTitle = articleTitle == null ? null : articleTitle.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_name
	 *
	 * @return the value of article.article_name
	 *
	 * @mbg.generated
	 */
	public String getArticleName() {
		return articleName;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_name
	 *
	 * @param articleName the value for article.article_name
	 *
	 * @mbg.generated
	 */
	public void setArticleName(String articleName) {
		this.articleName = articleName == null ? null : articleName.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_keywords
	 *
	 * @return the value of article.article_keywords
	 *
	 * @mbg.generated
	 */
	public String getArticleKeywords() {
		return articleKeywords;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_keywords
	 *
	 * @param articleKeywords the value for article.article_keywords
	 *
	 * @mbg.generated
	 */
	public void setArticleKeywords(String articleKeywords) {
		this.articleKeywords = articleKeywords == null ? null : articleKeywords.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_userid
	 *
	 * @return the value of article.article_userid
	 *
	 * @mbg.generated
	 */
	public Integer getArticleUserid() {
		return articleUserid;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_userid
	 *
	 * @param articleUserid the value for article.article_userid
	 *
	 * @mbg.generated
	 */
	public void setArticleUserid(Integer articleUserid) {
		this.articleUserid = articleUserid;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_createdate
	 *
	 * @return the value of article.article_createdate
	 *
	 * @mbg.generated
	 */
	public Date getArticleCreatedate() {
		return articleCreatedate;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_createdate
	 *
	 * @param articleCreatedate the value for article.article_createdate
	 *
	 * @mbg.generated
	 */
	public void setArticleCreatedate(Date articleCreatedate) {
		this.articleCreatedate = articleCreatedate;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_updatedate
	 *
	 * @return the value of article.article_updatedate
	 *
	 * @mbg.generated
	 */
	public Date getArticleUpdatedate() {
		return articleUpdatedate;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_updatedate
	 *
	 * @param articleUpdatedate the value for article.article_updatedate
	 *
	 * @mbg.generated
	 */
	public void setArticleUpdatedate(Date articleUpdatedate) {
		this.articleUpdatedate = articleUpdatedate;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_status
	 *
	 * @return the value of article.article_status
	 *
	 * @mbg.generated
	 */
	public Integer getArticleStatus() {
		return articleStatus;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_status
	 *
	 * @param articleStatus the value for article.article_status
	 *
	 * @mbg.generated
	 */
	public void setArticleStatus(Integer articleStatus) {
		this.articleStatus = articleStatus;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_flag
	 *
	 * @return the value of article.article_flag
	 *
	 * @mbg.generated
	 */
	public Integer getArticleFlag() {
		return articleFlag;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_flag
	 *
	 * @param articleFlag the value for article.article_flag
	 *
	 * @mbg.generated
	 */
	public void setArticleFlag(Integer articleFlag) {
		this.articleFlag = articleFlag;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_description
	 *
	 * @return the value of article.article_description
	 *
	 * @mbg.generated
	 */
	public String getArticleDescription() {
		return articleDescription;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_description
	 *
	 * @param articleDescription the value for article.article_description
	 *
	 * @mbg.generated
	 */
	public void setArticleDescription(String articleDescription) {
		this.articleDescription = articleDescription == null ? null : articleDescription.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_count
	 *
	 * @return the value of article.article_count
	 *
	 * @mbg.generated
	 */
	public Integer getArticleCount() {
		return articleCount;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_count
	 *
	 * @param articleCount the value for article.article_count
	 *
	 * @mbg.generated
	 */
	public void setArticleCount(Integer articleCount) {
		this.articleCount = articleCount;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_tag
	 *
	 * @return the value of article.article_tag
	 *
	 * @mbg.generated
	 */
	public String getArticleTag() {
		return articleTag;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_tag
	 *
	 * @param articleTag the value for article.article_tag
	 *
	 * @mbg.generated
	 */
	public void setArticleTag(String articleTag) {
		this.articleTag = articleTag == null ? null : articleTag.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_menuid
	 *
	 * @return the value of article.article_menuid
	 *
	 * @mbg.generated
	 */
	public String getArticleMenuid() {
		return articleMenuid;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_menuid
	 *
	 * @param articleMenuid the value for article.article_menuid
	 *
	 * @mbg.generated
	 */
	public void setArticleMenuid(String articleMenuid) {
		this.articleMenuid = articleMenuid == null ? null : articleMenuid.trim();
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_type
	 *
	 * @return the value of article.article_type
	 *
	 * @mbg.generated
	 */
	public Integer getArticleType() {
		return articleType;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_type
	 *
	 * @param articleType the value for article.article_type
	 *
	 * @mbg.generated
	 */
	public void setArticleType(Integer articleType) {
		this.articleType = articleType;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method returns the value of the database column article.article_username
	 *
	 * @return the value of article.article_username
	 *
	 * @mbg.generated
	 */
	public String getArticleUsername() {
		return articleUsername;
	}

	/**
	 * This method was generated by MyBatis Generator.
	 * This method sets the value of the database column article.article_username
	 *
	 * @param articleUsername the value for article.article_username
	 *
	 * @mbg.generated
	 */
	public void setArticleUsername(String articleUsername) {
		this.articleUsername = articleUsername == null ? null : articleUsername.trim();
	}

	public String getArticleContent() {
		return articleContent;
	}

	public void setArticleContent(String articleContent) {
		this.articleContent = articleContent;
	}

 
}