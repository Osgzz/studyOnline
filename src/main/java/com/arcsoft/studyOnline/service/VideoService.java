package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Videos;
import com.arcsoft.studyOnline.dao.VideosMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Focus on 2017/6/20.
 */
@Service
public class VideoService {
    @Autowired
    private VideosMapper videosMapper;

    public void insertVideo(Videos video) {
        videosMapper.insertVideo(video);
    }
}
