package cn.mesie.dao;

import cn.mesie.model.Jobapply;
import cn.mesie.model.Resume;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("jobDao")
public interface IJopDao {

    List<Jobapply> selectAllJop();

    Jobapply selectOneJob(@Param("stuid")int stuid,@Param("recruitid")int recruitid);

    int addJobApply(Jobapply jobapply);

}
