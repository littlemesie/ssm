package cn.mesie.dao;

import cn.mesie.model.Recruit;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 21/03/2018 10:54 PM
 *
 * @author: mesie
 */
@Repository("recruitDao")
public interface IRecruitDao {
    /**
     * 查询一起招聘信息
     * @return
     */
    List<Recruit> selectRecruit();

    List<Recruit> selectAllRecruit();

    List<Recruit> selectRecruitById(@Param("id") Integer id);
}
