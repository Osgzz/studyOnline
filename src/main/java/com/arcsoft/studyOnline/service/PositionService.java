package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Position;
import com.arcsoft.studyOnline.dao.PositionMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by 59309 on 2017/7/17.
 */
@Service
public class PositionService {
    @Autowired
    private PositionMapper positionMapper;

    public List<Position> selectPositionList(){
        return positionMapper.selectPositionList();
    }
}
