package cn.mesie.service.impl;

import cn.mesie.dao.IJopDao;
import cn.mesie.model.Jobapply;
import cn.mesie.service.IJobService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

@Service("jobService")
public class JobServiceImpl implements IJobService {

    @Resource(name = "jobDao")
    private IJopDao jopDao;

    @Override
    public List<Jobapply> selectAllJop() {
        return jopDao.selectAllJop();
    }

    @Override
    public Jobapply selectOneJob(int stuid, int recruitid) {
        return jopDao.selectOneJob(stuid, recruitid);
    }

    @Override
    public int addJobApply(Jobapply jobapply) {
        return jopDao.addJobApply(jobapply);
    }
}
