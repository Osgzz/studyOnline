package com.arcsoft.studyOnline.ffmepg;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Focus on 2017/6/11.
 */
public class ConvertVideo {
    public static boolean processFLV(String ffmpegPath, String oldFilePath, String newFilePath) {
        if (!checkfile(ffmpegPath)) {
            System.out.println(ffmpegPath + " is not found FFmpeg!");
            return false;
        }
        if (!checkfile(oldFilePath)) {
            System.out.println(oldFilePath + " is not found the file!");
            return false;
        }

        List<String> commend = new ArrayList<String>();
        commend.add(ffmpegPath);
        commend.add("-i");
        commend.add(oldFilePath);
        commend.add("-y");
        commend.add("-ab");
        commend.add("32");
        commend.add("-ar");
        commend.add("22050");
        commend.add("-b");
        commend.add("800000");
        commend.add("-s");
        commend.add("640*480");
        commend.add(newFilePath);

        try {
            Runtime runtime = Runtime.getRuntime();
            Process proce = null;
            String cutCmd = ffmpegPath + " -i" + " " + oldFilePath +" -y -ab 32 -ar 22050 -b 800000 -s 640*480" + " " + newFilePath;
            proce = runtime.exec(cutCmd);
            ProcessBuilder builder = new ProcessBuilder(commend);
            builder.command(commend);
            builder.start();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    private static boolean checkfile(String path) {
        File file = new File(path);
        if (!file.isFile()) {
            return false;
        }
        return true;
    }
}
