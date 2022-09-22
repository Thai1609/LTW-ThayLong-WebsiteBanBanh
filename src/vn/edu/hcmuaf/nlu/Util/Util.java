package vn.edu.hcmuaf.nlu.Util;

public class Util {
    static final String HOST ="http://localhost:8080/LTW_ThayLong_WebsiteBanBanh_war_exploded/";
    public static String fullPath(String path){
        return HOST+path;
    }
}