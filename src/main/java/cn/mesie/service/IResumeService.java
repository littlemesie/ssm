package cn.mesie.service;

import cn.mesie.model.Resume;

import java.util.List;

public interface IResumeService {

    List<Resume> selectAllRes(int stuid);

    void deleteRes(int id);

    Resume selectOneRes(int id);

    void modifyRes(String id,String filename,String onlinecv,String comment);

    int addRes(Resume resume);

}
