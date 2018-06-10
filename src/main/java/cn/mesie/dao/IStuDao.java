package cn.mesie.dao;
import cn.mesie.model.Student;
import cn.mesie.model.Teacher;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("stuDao")
public interface IStuDao {

    Student selectStu(@Param("stuid")String stuid,@Param("password") String password);

    Student selectStuinfo(@Param("stuid")int stuid);

    String selectTeaname(@Param("teaid")int teaid);

    List<Teacher> selectAllTeacher();

    void modifyPapeState(@Param("stuid")int stuid);

    void modifyAdviState(@Param("stuid")int stuid);

    void modifyStuinfo(@Param("stuid")String stuid,@Param("email")String email,@Param("mobilephone")String mobilephone,
                       @Param("qq")String qq,@Param("wechat")String wechat);

    void modifyPwd(@Param("stuid")String stuid,@Param("newpwd")String newpwd);


    void updateSelfInfo(@Param("stuid")String stuid,@Param("selfintro")String selfintro,@Param("selfintroplain")String selfintroplain);

    int updateState(@Param("stuid") int stuid,@Param("state") int state);

}
