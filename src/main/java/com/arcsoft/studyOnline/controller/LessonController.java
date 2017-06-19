package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.bean.Lesson;
import com.arcsoft.studyOnline.service.LessonService;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.fileupload.servlet.ServletRequestContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.UnsupportedEncodingException;
import java.sql.Connection;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
/**
 * Created by Focus on 2017/6/19.
 */
@Controller
public class LessonController {
    @Autowired
    private LessonService lessonService;

    @RequestMapping("/toCreateLesson")
    public String toCreateLesson() {
        return "createLesson";
    }


    @RequestMapping("/createLesson")
    public String createLesson(HttpServletRequest request) throws UnsupportedEncodingException {
//        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;

        System.out.println(request);
        FileItemFactory factory = new DiskFileItemFactory();
        System.out.println(factory);
        ServletFileUpload upload = new ServletFileUpload(factory);
        System.out.println(upload);
        List<FileItem> items = null;
        int flag = 0;
        try {
            items=upload.parseRequest(new ServletRequestContext(request));
            System.out.println(items);
        } catch (FileUploadException e) {
            e.printStackTrace();
        }
        Iterator<FileItem> itr = items.iterator();
        System.out.println(itr);
        Lesson lesson = new Lesson();
        while (itr.hasNext()) {
            FileItem item = (FileItem) itr.next();
            System.out.println("???");
            if (item.isFormField()) {
                String fieldName = item.getFieldName();
                System.out.println(fieldName);
                if ("lessonName".equals(fieldName)) {
                    String name = item.getString("utf-8");
                    if (name != null) {
                        lesson.setName(name);
                    }
                }

                if ("lessonId".equals(fieldName)) {
                    String lessonId = item.getString("utf-8");
                    if (lessonId != null) {
                        lesson.setId(Integer.valueOf(lessonId));
                    }
                }


                if ("isshow".equals(fieldName)) {
                    String isshow = item.getString("utf-8");
                    if (isshow != null) {
                        lesson.setIsshow(Integer.valueOf(isshow));
                    }
                }


                if ("imageName".equals(fieldName) && flag == 1) {
                    String cover = item.getString("utf-8");
                    if (cover != null && (!cover.equals(""))) {
                        lesson.setCover(cover);
                    }
                }
            } else if (!"".equals(item.getName())) {
                try {
                    Date date = new Date();
                    SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                    String cover = sdf.format(date);
                    lesson.setCover(cover + "." + item.getName().split("\\.")[1]);
                    String filePath = "E:\\JetBrains\\studyOnline\\build\\libs\\exploded\\studyOnline-1.0-SNAPSHOT.war\\img\\lessonImage\\" + cover + "." + item.getName().split("\\.")[1];
                    item.write(new File(filePath));
                } catch (Exception e) {
                    e.printStackTrace();
                }
            } else {
                flag = 1;
            }
        }

        if (lesson.getId() != null) {
            lessonService.updateLesson(lesson);
            return "redirect:/toBookList";
        } else {
            lessonService.insertLesson(lesson);
            return "redirect:/toCreateLesson";
        }

    }

}
