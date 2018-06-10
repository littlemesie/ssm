package cn.mesie.service;

import cn.mesie.model.Jobapply;

import java.util.List;

public interface IJobService {

    List<Jobapply> selectAllJop();

    Jobapply selectOneJob(int stuid,int recruitid);

    int addJobApply(Jobapply jobapply);

}
