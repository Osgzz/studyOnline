package com.arcsoft.studyOnline.dao;

import com.arcsoft.studyOnline.bean.Lesson;
import com.arcsoft.studyOnline.bean.LessonExample;
import java.util.List;

import com.arcsoft.studyOnline.bean.LessonWithRoute;
import org.apache.ibatis.annotations.Param;

public interface LessonMapper {
    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table lesson
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    long countByExample(LessonExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table lesson
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    int deleteByExample(LessonExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table lesson
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    int insert(Lesson record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table lesson
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    int insertSelective(Lesson record);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table lesson
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    List<Lesson> selectByExample(LessonExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table lesson
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    int updateByExampleSelective(@Param("record") Lesson record, @Param("example") LessonExample example);

    /**
     * This method was generated by MyBatis Generator.
     * This method corresponds to the database table lesson
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    int updateByExample(@Param("record") Lesson record, @Param("example") LessonExample example);

    void insertLesson(Lesson lesson);

    List<Lesson> selectLessonList();

    void deleteLessonById(@Param("id") Integer id);

    void updateLesson(@Param("lesson")Lesson lesson);

    Lesson selectLessonById(@Param("id") Integer id);

    List<LessonWithRoute> selectLessonListWithRoute();

    List<Lesson> selectLessonListByName(String name);

    List<LessonWithRoute> selectLessonListWithRouteByName(String name);
}