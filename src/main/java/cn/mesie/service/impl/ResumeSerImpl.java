package cn.mesie.service.impl;

import cn.mesie.dao.IResumeDao;
import cn.mesie.model.Resume;
import cn.mesie.service.IResumeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("resumeService")
public class ResumeSerImpl implements IResumeService {

    @Resource(name = "resumeDao")
    private IResumeDao resumeDao;

    public List<Resume> selectAllRes(int stuid) {
        return resumeDao.selectAllRes(stuid);
    }

    public void deleteRes(int id) {
        resumeDao.deleteRes(id);
    }

    public Resume selectOneRes(int id) {
        return resumeDao.selectOneRes(id);
    }

    public void modifyRes(String id, String filename, String onlinecv, String comment) {
        resumeDao.modifyRes(id, filename, onlinecv, comment);
    }

    public int addRes(Resume resume) {
        return resumeDao.addRes(resume);
    }

}
