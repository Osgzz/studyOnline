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
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
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

    /**
     * @return 跳转到 createLesson.jsp 新增课程页面
     */
    @RequestMapping("/toCreateLesson")
    public String toCreateLesson() {
        return "createLesson";
    }


    /**
     * 根据传入的参数新增课程
     *
     * @param file       上传的课程封面图片文件
     * @param lessonName 传入的课程名称
     * @param request
     * @param isshow     是否上线该课程，1未上线，0为不上线
     * @return 跳转到原页面 createLesson.jsp 新增课程页面
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/createLesson")
    public String createLesson(@RequestParam("picFile") MultipartFile file, @RequestParam("lessonName") String lessonName, HttpServletRequest request, @RequestParam("isshow") Integer isshow) throws UnsupportedEncodingException {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Lesson lesson = (Lesson) applicationContext.getBean("lesson");
        lesson.setName(lessonName);
        lesson.setIsshow(isshow);

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

                lessonService.insertLesson(lesson);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return "createLesson";
    }


    /**
     * 根据课程ID，查出该课程信息，将信息回显到课程信息修改页面
     *
     * @param model 作用相当于request，用于传值到页面
     * @param id    传入的课程ID
     * @return 跳转到 updateLesson.jsp 课程信息修改页面
     */
    @RequestMapping("/toUpdateLesson")
    public String toUpdateLesson(Model model, @RequestParam("id") Integer id) {
        Lesson lesson = lessonService.selectLesson(id);
        model.addAttribute("lesson", lesson);
        return "updateLesson";
    }

    /**
     * 根据上传的参数修改单个课程信息
     *
     * @param file       上传的课程封面图片文件
     * @param lessonName 课程名称
     * @param request    HttpServletRequest
     * @param isshow     是否上线该课程，1未上线，0为不上线
     * @param id         课程ID
     * @param oldCover   原本的课程封面
     * @return 跳转到 toLessonList 方法，重新查询新的课程信息列表后显示
     * @throws UnsupportedEncodingException
     */
    @RequestMapping("/updateLesson")
    public String updateLesson(@RequestParam("picFile") MultipartFile file, @RequestParam("lessonName") String lessonName, HttpServletRequest request, @RequestParam("isshow") Integer isshow, @RequestParam("id") Integer id, @RequestParam("oldPicFile") String oldCover) throws UnsupportedEncodingException {
        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");
        Lesson lesson = (Lesson) applicationContext.getBean("lesson");
        lesson.setId(id);
        lesson.setName(lessonName);
        lesson.setIsshow(isshow);

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
        lessonService.updateLesson(lesson);
        return "redirect:/toLessonList";
    }


    /**
     * 查询所有课程信息列表后跳转到lessonList.jsp
     *
     * @param model 相当于request
     * @return 跳转到 课程信息列表
     */
    @RequestMapping("/toLessonList")
    public String toLessonList(Model model) {
        List<Lesson> lessonList = lessonService.getLessonList();
        model.addAttribute("lessonList", lessonList);
        return "lessonList";
    }


    /**
     * 根据传入的课程ID，删除该课程
     *
     * @param id 传入的课程ID
     * @return 完成后重定向到 查询后跳转到 课程信息列表 的方法
     */
    @RequestMapping("/delLesson")
    public String delLesson(@RequestParam Integer id) {
        lessonService.deleteLesson(id);
        return "redirect:/toLessonList";
    }

}
