package com.arcsoft.studyOnline.ffmepg;

import java.io.IOException;

/**
 * Created by Focus on 2017/6/11.
 */
public class FFmpegDemo {
    public static void main(String[] args) {

        String dirStr = "C:\\Users\\Focus\\Desktop";
        //视频文件
        String videoRealPath = dirStr + "\\a.avi";

        //截图的路径（输出路径）
        String imageRealPath = dirStr + "//a.jpg";
        try {
            //调用批处理文件
            Runtime.getRuntime().exec("cmd /c start  " + dirStr + "\\ffmpeg.bat " + videoRealPath + " " + imageRealPath);

        } catch (Exception e) {
            e.printStackTrace();
        }
        new FFmpegDemo().killProcess();

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
