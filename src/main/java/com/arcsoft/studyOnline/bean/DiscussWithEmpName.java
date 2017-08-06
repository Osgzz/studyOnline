package com.arcsoft.studyOnline.bean;

import com.arcsoft.studyOnline.utils.JsonDateSerializer;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class DiscussWithEmpName {

    private Integer id;
    private Integer vedioId;
    private Integer commentatorsId;
    private Date time;
    private Integer preId;
    private Integer fromWho;
    private String content;

    private String empNickName;

    public DiscussWithEmpName(Integer id, Integer vedioId, Integer commentatorsId, Date time, Integer preId, Integer fromWho, String content, String empNickName) {
        this.id = id;
        this.vedioId = vedioId;
        this.commentatorsId = commentatorsId;
        this.time = time;
        this.preId = preId;
        this.fromWho = fromWho;
        this.content = content;
        this.empNickName = empNickName;
    }

    public DiscussWithEmpName() {
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getVedioId() {
        return vedioId;
    }

    public void setVedioId(Integer vedioId) {
        this.vedioId = vedioId;
    }

    public Integer getCommentatorsId() {
        return commentatorsId;
    }

    public void setCommentatorsId(Integer commentatorsId) {
        this.commentatorsId = commentatorsId;
    }


    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonSerialize(using=JsonDateSerializer.class)
    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public Integer getPreId() {
        return preId;
    }

    public void setPreId(Integer preId) {
        this.preId = preId;
    }

    public Integer getFromWho() {
        return fromWho;
    }

    public void setFromWho(Integer fromWho) {
        this.fromWho = fromWho;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getEmpNickName() {
        return empNickName;
    }

    public void setEmpNickName(String empNickName) {
        this.empNickName = empNickName;
    }
}
