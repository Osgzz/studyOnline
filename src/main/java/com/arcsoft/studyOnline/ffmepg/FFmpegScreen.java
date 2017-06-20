package com.arcsoft.studyOnline.ffmepg;

import java.io.IOException;

/**
 * Created by Focus on 2017/6/11.
 */
public class FFmpegScreen {

    public void screenFromViedo(String videoPath, String videoSceen, String batPath) {
        try {
            //调用批处理文件
            Runtime.getRuntime().exec("cmd /c start  " + batPath + " " + videoPath + " " + videoSceen);
        } catch (Exception e) {
            e.printStackTrace();
        }
        new FFmpegScreen().killProcess();
    }

    private void killProcess() {
        Runtime rt = Runtime.getRuntime();
        try {
            rt.exec("cmd /c start wmic process where name='cmd.exe' call terminate");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
