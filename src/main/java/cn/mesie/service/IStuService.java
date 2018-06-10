package cn.mesie.service;
import cn.mesie.model.Student;
import cn.mesie.model.Teacher;

import java.util.List;

public interface IStuService {

    Student selectStu(String stuid,String password);

    Student selectStuinfo(int stuid);

    String selectTeaname(int teaid);

    List<Teacher> selectAllTeacher();

    void modifyPapeState(int stuid);

    void modifyAdviState(int stuid);

    void modifyStuinfo(String stuid,String email,String mobilephone,String qq,String wechat);

    void modifyPwd(String stuid,String newpwd);

    void updateSelfInfo(String stuid,String selfintro,String selfintroplain);

    int updateState(int stuid,int state);

}
