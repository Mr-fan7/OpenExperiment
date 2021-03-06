package com.swpu.uchain.openexperiment.service;

import com.swpu.uchain.openexperiment.domain.ProjectFile;
import com.swpu.uchain.openexperiment.result.Result;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletResponse;

/**
 * @Description
 * @Author cby
 * @Date 19-1-22
 **/
public interface ProjectFileService {


    /**
     * 添加文件
     *
     * @param projectFile
     * @return:
     */
    boolean insert(ProjectFile projectFile);

    /**
     * 修改文件
     *
     * @param projectFile
     * @return:
     */
    boolean update(ProjectFile projectFile);

    /**
     * 删除文件
     *
     * @param id
     * @return:
     */
    boolean delete(Long id);


    /**
     * 上传文件
     *
     * @param file
     * @param projectGroupId
     * @return:
     */
    Result uploadFile(MultipartFile file,Long projectGroupId);

    /**
    * 下载文件
    * @param
    * @return:
    */
    Result downloadFile(String fileName,  HttpServletResponse response);


}
