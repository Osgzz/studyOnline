package com.arcsoft.studyOnline.bean;

public class Lesson {
    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column lesson.id
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    private Integer id;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column lesson.name
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    private String name;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column lesson.isshow
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    private Integer isshow;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column lesson.cover
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    private String cover;

    /**
     *
     * This field was generated by MyBatis Generator.
     * This field corresponds to the database column lesson.detail
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    private String detail;

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column lesson.id
     *
     * @return the value of lesson.id
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public Integer getId() {
        return id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column lesson.id
     *
     * @param id the value for lesson.id
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public void setId(Integer id) {
        this.id = id;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column lesson.name
     *
     * @return the value of lesson.name
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public String getName() {
        return name;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column lesson.name
     *
     * @param name the value for lesson.name
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column lesson.isshow
     *
     * @return the value of lesson.isshow
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public Integer getIsshow() {
        return isshow;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column lesson.isshow
     *
     * @param isshow the value for lesson.isshow
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public void setIsshow(Integer isshow) {
        this.isshow = isshow;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column lesson.cover
     *
     * @return the value of lesson.cover
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public String getCover() {
        return cover;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column lesson.cover
     *
     * @param cover the value for lesson.cover
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public void setCover(String cover) {
        this.cover = cover == null ? null : cover.trim();
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method returns the value of the database column lesson.detail
     *
     * @return the value of lesson.detail
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public String getDetail() {
        return detail;
    }

    /**
     * This method was generated by MyBatis Generator.
     * This method sets the value of the database column lesson.detail
     *
     * @param detail the value for lesson.detail
     *
     * @mbg.generated Mon Jun 19 18:22:15 CST 2017
     */
    public void setDetail(String detail) {
        this.detail = detail == null ? null : detail.trim();
    }
}