package com.jjx.mytools.dao;

import com.jjx.mytools.entity.ImporterXmlDef;
import com.jjx.mytools.entity.ImporterXmlDefExample;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface ImporterXmlDefDao {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    long countByExample(ImporterXmlDefExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int deleteByExample(ImporterXmlDefExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int deleteByPrimaryKey(String xmlcode);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int insert(ImporterXmlDef record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int insertSelective(ImporterXmlDef record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    List<ImporterXmlDef> selectByExampleWithBLOBs(ImporterXmlDefExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    List<ImporterXmlDef> selectByExample(ImporterXmlDefExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    ImporterXmlDef selectByPrimaryKey(String xmlcode);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int updateByExampleSelective(@Param("record") ImporterXmlDef record, @Param("example") ImporterXmlDefExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int updateByExampleWithBLOBs(@Param("record") ImporterXmlDef record, @Param("example") ImporterXmlDefExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int updateByExample(@Param("record") ImporterXmlDef record, @Param("example") ImporterXmlDefExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int updateByPrimaryKeySelective(ImporterXmlDef record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int updateByPrimaryKeyWithBLOBs(ImporterXmlDef record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table importerxmldef
     *
     * @mbg.generated
     */
    int updateByPrimaryKey(ImporterXmlDef record);
}