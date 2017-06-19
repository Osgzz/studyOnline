package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Lesson;
import com.arcsoft.studyOnline.dao.LessonMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by Focus on 2017/6/19.
 */
@Service
public class LessonService {
    @Autowired
    private LessonMapper lessonMapper;

    public void updateLesson(Lesson lesson) {
        lessonMapper.updateLesson(lesson);
    }

    public void insertLesson(Lesson lesson) {
        lessonMapper.insertLesson(lesson);
    }

    public List<Lesson> getLessonList() {
        return lessonMapper.selectLessonList();
    }

    public void deleteLesson(Integer id) {
        lessonMapper.deleteLessonById(id);
    }

    public Lesson selectLesson(Integer id) {
        return  lessonMapper.selectLessonById(id);
    }
}
