package com.arcsoft.studyOnline.service;

import com.arcsoft.studyOnline.bean.*;
import com.arcsoft.studyOnline.dao.AudiosMapper;
import com.arcsoft.studyOnline.dao.PPTsMapper;
import com.arcsoft.studyOnline.dao.RouteMapper;
import com.arcsoft.studyOnline.dao.VideosMapper;
import com.arcsoft.studyOnline.ffmepg.FFmpegScreen;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * Created by Focus on 2017/6/20.
 */
@Service
public class RouteService {
    @Autowired
    private RouteMapper routeMapper;
    @Autowired
    private VideosMapper videosMapper;
    @Autowired
    private PPTsMapper pptsMapper;
    @Autowired
    private AudiosMapper audiosMapper;

    public void insertRoute(Route route) {
        routeMapper.insertRoute(route);
    }


    public void insertRouteWithResource(Integer lessonId, String routeName, String time, MultipartFile routeCover, String routeDetail, MultipartFile videoPath, String videoName, MultipartFile pptPath, String pptName, MultipartFile audioPath, String audioName, HttpServletRequest request) {

        ApplicationContext applicationContext = new ClassPathXmlApplicationContext("applicationContext.xml");

        Route route = (Route) applicationContext.getBean("route");
        PPTs ppt = (PPTs) applicationContext.getBean("ppts");
        Videos video = (Videos) applicationContext.getBean("videos");
        Audios audio = (Audios) applicationContext.getBean("audios");

        Date date = null;
        String cover = "";
        String filePath = "";

        try {
            SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            date = simpleDateFormat.parse(time);
            route.setTime(date);
        } catch (ParseException e) {
            e.printStackTrace();
        }

        // 判断文件是否为空
        if (!routeCover.isEmpty()) {
            try {
                date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                cover = sdf.format(date);
                route.setCover(cover + "." + routeCover.getOriginalFilename().split("\\.")[1]);

                // 文件保存路径
                filePath = request.getSession().getServletContext().getRealPath("/") + "img\\routeImage\\"
                        + cover + "." + routeCover.getOriginalFilename().split("\\.")[1];
                System.out.println("路径封面保存路径" + filePath);
                // 转存文件
                routeCover.transferTo(new File(filePath));
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        route.setLessonId(lessonId);
        route.setDetail(routeDetail);
        route.setRouteName(routeName);

        //新增学习路径
        routeMapper.insertRoute(route);
        //获取刚新增学习路径的自增ID
        Integer routeId = route.getId();


        // 判断文件是否为空
        if (!videoPath.isEmpty()) {
            try {
                date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                cover = sdf.format(date);


                // 视频保存路径
                filePath = request.getSession().getServletContext().getRealPath("/") + "video\\"
                        + cover + "." + videoPath.getOriginalFilename().split("\\.")[1];
                System.out.println("视频保存路径" + filePath);
                // 转存视频到路径下
                videoPath.transferTo(new File(filePath));

                video.setPath(cover + "." + videoPath.getOriginalFilename().split("\\.")[1]);
                //视频截图保存路径
                String videoSceen = request.getSession().getServletContext().getRealPath("/") + "img\\videoSceen\\"
                        + cover + ".png";

                String batPath=request.getSession().getServletContext().getRealPath("/")+"\\sceen.bat";

                System.out.println("截图路径" + videoSceen);

                //调用FFmpeg，截取视频截图到路径下
                FFmpegScreen ffmpeg = new FFmpegScreen();
                ffmpeg.screenFromViedo(filePath, videoSceen,batPath);

                //设置实体类video的封面路径
                video.setCoverPath(cover + ".png");
            } catch (Exception e) {
                e.printStackTrace();
            }
        }

        video.setName(videoName);
        video.setRouteId(routeId);
        video.setViews(0);

        //插入该学习路径下的视频
        videosMapper.insertVideo(video);


        // 判断文件是否为空
        if (!pptPath.isEmpty()) {
            try {
                date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                cover = sdf.format(date);


                // 文件保存路径
                filePath = request.getSession().getServletContext().getRealPath("/") + "ppts\\"
                        + cover + "." + pptPath.getOriginalFilename().split("\\.")[1];
                System.out.println("ppt保存路径:" + filePath);
                // 转存文件
                pptPath.transferTo(new File(filePath));

                ppt.setPath(cover + "." + pptPath.getOriginalFilename().split("\\.")[1]);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        ppt.setName(pptName);
        ppt.setRouteId(routeId);
        //插入该学习路径下的ppt
        pptsMapper.insetPpt(ppt);


        // 判断文件是否为空
        if (!audioPath.isEmpty()) {
            try {
                date = new Date();
                SimpleDateFormat sdf = new SimpleDateFormat("yyyyMMddhhmmss");
                cover = sdf.format(date);


                // 文件保存路径
                filePath = request.getSession().getServletContext().getRealPath("/") + "audios\\"
                        + cover + "." + audioPath.getOriginalFilename().split("\\.")[1];
                System.out.println("音频保存路径:" + filePath);
                // 转存文件
                audioPath.transferTo(new File(filePath));

                audio.setPath(cover + "." + audioPath.getOriginalFilename().split("\\.")[1]);
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        audio.setName(audioName);
        audio.setRouteId(routeId);
        //插入该学习路径下的ppt
        audiosMapper.insetAudio(audio);


    }

    public List<RouteWithResource> selectRouteWithResource(Integer id) {
        return routeMapper.selectRouteWithResourceById(id);
    }
}
