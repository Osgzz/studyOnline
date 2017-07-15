import org.apache.shiro.crypto.hash.SimpleHash;
import org.junit.Test;
import org.mybatis.generator.api.MyBatisGenerator;
import org.mybatis.generator.config.Configuration;
import org.mybatis.generator.config.xml.ConfigurationParser;
import org.mybatis.generator.exception.XMLParserException;
import org.mybatis.generator.internal.DefaultShellCallback;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Focus on 2017/5/23.
 */
public class TestMybatis {
    @Test
    public void testgenerarot() throws Exception {
//        List<String> warnings = new ArrayList<>();
//        boolean overwrite = true;
//        File configFile = new File("generatorConfig.xml");
//        ConfigurationParser cp = new ConfigurationParser(warnings);
//        Configuration config = cp.parseConfiguration(configFile);
//        DefaultShellCallback callback = new DefaultShellCallback(overwrite);
//        MyBatisGenerator myBatisGenerator = new MyBatisGenerator(config, callback, warnings);
//        myBatisGenerator.generate(null);
    }

    @Test
    public void testMD5(){
        System.out.println(new SimpleHash("MD5","admin","admin",499));
    }

    @Test
    public  void testSceen(){
//        String dirStr = "C:\\Users\\Focus\\Desktop";
//        //视频文件
//        String videoRealPath ="E:\\JetBrains\\studyOnline\\build\\libs\\exploded\\studyOnline-1.0-SNAPSHOT.war\\video\\1.wmv";
//
//        //截图的路径（输出路径）
////        String imageRealPath = dirStr + "//a.png";
//        String imageRealPath ="E:\\JetBrains\\studyOnline\\build\\libs\\exploded\\studyOnline-1.0-SNAPSHOT.war\\img\\videoSceen\\a.png";
//
//
//        //视频转换地址
//        String transVideo ="E:\\JetBrains\\studyOnline\\build\\libs\\exploded\\studyOnline-1.0-SNAPSHOT.war\\video\\trans.mp4";
//        try {
//            //调用批处理文件
////            Runtime.getRuntime().exec("cmd /c start  " +"sceen.bat " + videoRealPath + " " + imageRealPath);
//
//            Runtime.getRuntime().exec("cmd /c start  " +"transVideo.bat "  +videoRealPath+ " " +transVideo);
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
    }

    @Test
    public  void coverPPT(){


    }
}
