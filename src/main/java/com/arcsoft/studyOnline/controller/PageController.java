package com.arcsoft.studyOnline.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Focus on 2017/6/18.
 */
@Controller
public class PageController {

    @RequestMapping("/index")
    public String index() {
        return "index";
    }

}
