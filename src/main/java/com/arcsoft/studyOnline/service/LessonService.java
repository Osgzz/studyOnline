package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.Lesson;
import com.arcsoft.studyOnline.bean.LessonWithRoute;
import com.arcsoft.studyOnline.dao.LessonMapper;
import com.arcsoft.studyOnline.utils.Utils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Focus on 2017/6/19.
 */
@Service
public class LessonService {
    @Autowired
    private LessonMapper lessonMapper;

    public void updateLesson(MultipartFile file, String lessonName, HttpServletRequest request, Integer isshow, Integer id, String oldCover, String detail) {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Lesson lesson = (Lesson) applicationContext.getBean("lesson");
        lesson.setId(id);
        lesson.setName(lessonName);
        lesson.setIsshow(isshow);
        lesson.setDetail(detail);

        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                Date date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                String cover = sdf.format(date);
                lesson.setCover(cover + "." + file.getOriginalFilename().split("\\.")[1]);

                // 文件保存路径
                String filePath = request.getSession().getServletContext().getRealPath("/") + "img\\lessonImage\\"
                        + cover + "." + file.getOriginalFilename().split("\\.")[1];
                // 转存文件
                file.transferTo(new File(filePath));
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            lesson.setCover(oldCover);
        }
        lessonMapper.updateLesson(lesson);
    }

    public void insertLesson(MultipartFile file, String lessonName, HttpServletRequest request, Integer isshow, String detail) {

        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Lesson lesson = (Lesson) applicationContext.getBean("lesson");
        lesson.setName(lessonName);
        lesson.setIsshow(isshow);
        lesson.setDetail(detail);

        // 判断文件是否为空
        if (!file.isEmpty()) {
            try {
                Date date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                String cover = sdf.format(date);
                lesson.setCover(cover + "." + file.getOriginalFilename().split("\\.")[1]);

                // 文件保存路径
                String filePath = request.getSession().getServletContext().getRealPath("/") + "img\\lessonImage\\"
                        + cover + "." + file.getOriginalFilename().split("\\.")[1];
                // 转存文件
                file.transferTo(new File(filePath));

                lessonMapper.insertLesson(lesson);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

    }

    public List<Lesson> selectLessonList() {
        return lessonMapper.selectLessonList();
    }

    public void deleteLesson(Integer id) {
        lessonMapper.deleteLessonById(id);
    }

    public Lesson selectLesson(Integer id) {
        return lessonMapper.selectLessonById(id);
    }

    public List<LessonWithRoute> selectLessonListWithRoute() {
        return lessonMapper.selectLessonListWithRoute();
    }

    public List<Lesson> selectLessonListByName(String name) {
        return lessonMapper.selectLessonListByName(Utils.fuzzyString(name));
    }
}
