package com.arcsoft.studyOnline.bean;

import java.util.List;

/**
 * Created by Focus on 2017/6/21.
 */
public class LessonWithRoute {
    private Integer lessonId;
    private String lessonName;
    private String lessonCover;
    private String lessonDetail;

    private List<Route> routes;


    public Integer getLessonId() {
        return lessonId;
    }

    public void setLessonId(Integer lessonId) {
        this.lessonId = lessonId;
    }

    public String getLessonName() {
        return lessonName;
    }

    public void setLessonName(String lessonName) {
        this.lessonName = lessonName;
    }

    public String getLessonCover() {
        return lessonCover;
    }

    public void setLessonCover(String lessonCover) {
        this.lessonCover = lessonCover;
    }

    public String getLessonDetail() {
        return lessonDetail;
    }

    public void setLessonDetail(String lessonDetail) {
        this.lessonDetail = lessonDetail;
    }

    public List<Route> getRoutes() {
        return routes;
    }

    public void setRoutes(List<Route> routes) {
        this.routes = routes;
    }

    @Override
    public String toString() {
        return "LessonWithRoute{" +
                "lessonId=" + lessonId +
                ", lessonName='" + lessonName + '\'' +
                ", lessonCover='" + lessonCover + '\'' +
                ", lessonDetail='" + lessonDetail + '\'' +
                ", routes=" + routes +
                '}';
    }
}
