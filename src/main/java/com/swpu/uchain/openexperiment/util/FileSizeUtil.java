package com.swpu.uchain.openexperiment.util;

/**
 * @Description
 * @Author cby
 * @Date 19-1-26
 **/
public class FileSizeUtil {

    public String sizeConversionMB(Long fileSize) {
        String size = (fileSize / 10000000) + "MB";
        return size;
    }

    public String sizeConversionKB(Long fileSize) {
        String size = (fileSize / 1000) + "Kb";
        return size;
    }
}
