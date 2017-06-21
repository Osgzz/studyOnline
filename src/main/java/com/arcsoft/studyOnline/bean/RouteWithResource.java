package com.arcsoft.studyOnline.bean;

import java.util.Date;

/**
 * Created by Focus on 2017/6/21.
 */
public class RouteWithResource {
    //route信息
    private Integer routeId;
    private Integer lessonId;
    private String routeName;
    private Date routeTime;
    private String routeCover;
    private String routeDetail;

    //video信息
    private Integer videoId;
    private String videoName;
    private String videoPath;
    private Integer videoViews;
    private String videoCoverPath;

    //ppt信息
    private Integer pptId;
    private String pptName;
    private String pptPath;

    //audio信息
    private Integer audioId;
    private String audioName;
    private String audioPath;


    public Integer getRouteId() {
        return routeId;
    }

    public void setRouteId(Integer routeId) {
        this.routeId = routeId;
    }

    public Integer getLessonId() {
        return lessonId;
    }

    public void setLessonId(Integer lessonId) {
        this.lessonId = lessonId;
    }

    public String getRouteName() {
        return routeName;
    }

    public void setRouteName(String routeName) {
        this.routeName = routeName;
    }

    public Date getRouteTime() {
        return routeTime;
    }

    public void setRouteTime(Date routeTime) {
        this.routeTime = routeTime;
    }

    public String getRouteCover() {
        return routeCover;
    }

    public void setRouteCover(String routeCover) {
        this.routeCover = routeCover;
    }

    public String getRouteDetail() {
        return routeDetail;
    }

    public void setRouteDetail(String routeDetail) {
        this.routeDetail = routeDetail;
    }

    public Integer getVideoId() {
        return videoId;
    }

    public void setVideoId(Integer videoId) {
        this.videoId = videoId;
    }

    public String getVideoName() {
        return videoName;
    }

    public void setVideoName(String videoName) {
        this.videoName = videoName;
    }

    public String getVideoPath() {
        return videoPath;
    }

    public void setVideoPath(String videoPath) {
        this.videoPath = videoPath;
    }

    public Integer getVideoViews() {
        return videoViews;
    }

    public void setVideoViews(Integer videoViews) {
        this.videoViews = videoViews;
    }

    public String getVideoCoverPath() {
        return videoCoverPath;
    }

    public void setVideoCoverPath(String videoCoverPath) {
        this.videoCoverPath = videoCoverPath;
    }

    public Integer getPptId() {
        return pptId;
    }

    public void setPptId(Integer pptId) {
        this.pptId = pptId;
    }

    public String getPptName() {
        return pptName;
    }

    public void setPptName(String pptName) {
        this.pptName = pptName;
    }

    public String getPptPath() {
        return pptPath;
    }

    public void setPptPath(String pptPath) {
        this.pptPath = pptPath;
    }

    public Integer getAudioId() {
        return audioId;
    }

    public void setAudioId(Integer audioId) {
        this.audioId = audioId;
    }

    public String getAudioName() {
        return audioName;
    }

    public void setAudioName(String audioName) {
        this.audioName = audioName;
    }

    public String getAudioPath() {
        return audioPath;
    }

    public void setAudioPath(String audioPath) {
        this.audioPath = audioPath;
    }

    @Override
    public String toString() {
        return "RouteWithResource{" +
                "routeId=" + routeId +
                ", lessonId=" + lessonId +
                ", routeName='" + routeName + '\'' +
                ", routeTime=" + routeTime +
                ", routeCover='" + routeCover + '\'' +
                ", routeDetail='" + routeDetail + '\'' +
                ", videoId=" + videoId +
                ", videoName='" + videoName + '\'' +
                ", videoPath='" + videoPath + '\'' +
                ", videoViews=" + videoViews +
                ", videoCoverPath='" + videoCoverPath + '\'' +
                ", pptId=" + pptId +
                ", pptName='" + pptName + '\'' +
                ", pptPath='" + pptPath + '\'' +
                ", audioId=" + audioId +
                ", audioName='" + audioName + '\'' +
                ", audioPath='" + audioPath + '\'' +
                '}';
    }
}
