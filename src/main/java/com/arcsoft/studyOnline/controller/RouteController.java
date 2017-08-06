package com.arcsoft.studyOnline.controller;

import com.arcsoft.studyOnline.bean.*;
import com.arcsoft.studyOnline.service.LessonService;
import com.arcsoft.studyOnline.service.RouteService;
import com.arcsoft.studyOnline.service.VideoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

/**
 * Created by Focus on 2017/6/20.
 */
@Controller
public class RouteController {
    @Autowired
    private LessonService lessonService;
    @Autowired
    private RouteService routeService;
    @Autowired
    private VideoService videoService;


    /**
     * @return 查询出课程列表信息，跳转到 addRoute.jsp 页面
     */
    @RequestMapping("/toAddRoute")
    public String toAddRoute(Model model) {
        List<Lesson> lessonList = lessonService.selectLessonList();
        model.addAttribute("lessonList", lessonList);
        return "addRoute";
    }

    /**
     * @return 接收前台提交的表单信息，处理后重定向到toAddRoute()方法
     */
    @RequestMapping("/addRoute")
    public String addRoute(Model model, @RequestParam("lessonId") Integer lessonId, @RequestParam("routeName") String routeName, @RequestParam("time") String time, @RequestParam("routeCover") MultipartFile routeCover, @RequestParam("routeDetail") String routeDetail, @RequestParam(value = "video" ,required = false) MultipartFile videoPath, @RequestParam(value = "videoName",required = false) String videoName, @RequestParam(value = "ppt",required = false) MultipartFile pptPath, @RequestParam(value = "pptName",required = false) String pptName, @RequestParam(value = "audio",required = false) MultipartFile audioPath, @RequestParam(value = "audioName",required = false) String audioName, HttpServletRequest request) {
        routeService.insertRouteWithResource(lessonId, routeName, time, routeCover, routeDetail, videoPath, videoName, pptPath, pptName, audioPath, audioName, request);
        return "redirect:/toAddRoute";
    }


    /**
     * @param id 接收前台提交的子课程ID，根据ID查询出该子课程的详细信息
     * @return 将查到的数据以Json的格式返回
     */
    @RequestMapping("/getRouteWithResourceById")
    @ResponseBody
    public RouteWithResource getRouteWithResource(@RequestParam("id") Integer id) {
        RouteWithResource routeWithResources = routeService.selectRouteWithResource(id);
        return routeWithResources;
    }


}
