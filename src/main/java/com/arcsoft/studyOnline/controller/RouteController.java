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


    @RequestMapping("/toAddRoute")
    public String toAddRoute(Model model) {
        List<Lesson> lessonList = lessonService.selectLessonList();
        model.addAttribute("lessonList", lessonList);
        return "addRoute";
    }

    @RequestMapping("/addRoute")
    public String addRoute(Model model, @RequestParam("lessonId") Integer lessonId, @RequestParam("routeName") String routeName, @RequestParam("time") String time, @RequestParam("routeCover") MultipartFile routeCover, @RequestParam("routeDetail") String routeDetail, @RequestParam("video") MultipartFile videoPath, @RequestParam("videoName") String videoName, @RequestParam("ppt") MultipartFile pptPath, @RequestParam("pptName") String pptName, @RequestParam("audio") MultipartFile audioPath, @RequestParam("audioName") String audioName, HttpServletRequest request) {
        routeService.insertRouteWithResource(lessonId, routeName, time, routeCover, routeDetail, videoPath, videoName, pptPath,  pptName, audioPath, audioName, request);
        return "redirect:/toAddRoute";
    }


    @RequestMapping("/getRouteWithResourceById")
    @ResponseBody
    public  RouteWithResource getRouteWithResource(@RequestParam("id") Integer id){
        RouteWithResource routeWithResources = routeService.selectRouteWithResource(id);
        return routeWithResources;
    }


}
