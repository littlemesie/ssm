package cn.mesie.dao;

import cn.mesie.model.Internship;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 26/03/2018 8:31 PM
 *
 * @author: mesie
 */
@Repository("internshipDao")
public interface IInternshipDao {

    //添加
    int addInternship(Internship internship);

    List<Internship> selectAllInternship();

    Internship selectInternshipById(@Param("id") Integer id);

    Integer selectInteByStuidState(@Param("stuid") Integer stuid);

    Integer updateState(@Param("id") Integer id,@Param("state") Integer state);

}
