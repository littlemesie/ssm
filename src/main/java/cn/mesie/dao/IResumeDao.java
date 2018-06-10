package cn.mesie.dao;

import cn.mesie.model.Resume;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("resumeDao")
public interface IResumeDao {

    List<Resume> selectAllRes(@Param("stuid")int stuid);

    void deleteRes(@Param("id")int id);

    Resume selectOneRes(@Param("id")int id);

    void modifyRes(@Param("id")String id,@Param("filename")String filename,@Param("onlinecv")String onlinecv,@Param("comment")String comment);

    int addRes(Resume resume);

}
