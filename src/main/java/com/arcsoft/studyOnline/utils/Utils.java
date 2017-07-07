package com.arcsoft.studyOnline.utils;

/**
 * Created by Focus on 2017/6/20.
 */
public class Utils {
    /**
     * @param str 传入的字符串
     * @return 返回模糊处理后的字符串
     * fuzzyString(String str)：模糊查询关键字工具，将传入的关键字进行模糊处理再返回
     */
    public static String fuzzyString(String str) {
        if (str.equals("")) {
            str = "%%";
        } else {
            str = "%" + str + "%";
        }
        return str;
    }

    /**
     * @param str 传入字符串进行判断
     * @return 若字符串为空则返回空字符串否则原样返回
     * ifNull(String str): 判断是否字符串为null工具，在该项目中用于类似<a href="addCustomer.do"></a>标签跳转时请求中不带参数导致获取参数失败的问题
     */
    public static String ifNull(String str) {
        if (str == null) {
            str = "";
        }
        return str;
    }

}
