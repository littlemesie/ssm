package cn.mesie.dao;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

@Repository("collegeDao")
public interface ICollegeDao {

    String selectUni(@Param("universityid")int universityid);

    String selectIns(@Param("instituid")int instituid);

    String selectDep(@Param("departmentid")int departmentid);

    String selectMaj(@Param("majorid")int majorid);

    String selectCla(@Param("classid")int classid);

}
