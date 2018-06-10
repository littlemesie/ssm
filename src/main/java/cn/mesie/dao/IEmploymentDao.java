package cn.mesie.dao;

import cn.mesie.model.Employment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 28/03/2018 8:54 PM
 *
 * @author: mesie
 */
@Repository("employmentDao")
public interface IEmploymentDao {

    int addEmployment(Employment employment);

    List<Employment> selectAllEmployment();

    Employment selectEmploymentById(@Param("id") Integer id);

    Integer selectLastEmpByStuid(@Param("stuid") Integer stuid);

    void updateValid(@Param("id") Integer id);

}
