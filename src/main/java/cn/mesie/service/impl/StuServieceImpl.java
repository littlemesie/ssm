package cn.mesie.service.impl;

import cn.mesie.dao.IStuDao;
import cn.mesie.model.Student;
import cn.mesie.model.Teacher;
import cn.mesie.service.IStuService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;


@Service("stuService")
public class StuServieceImpl implements IStuService {

    @Resource(name = "stuDao")
    private IStuDao stuDao;

    @Override
    public List<Teacher> selectAllTeacher() {
        return stuDao.selectAllTeacher();
    }

    public Student selectStu(String stuid, String password) {
        return this.stuDao.selectStu(stuid, password);
    }

    public Student selectStuinfo(int stuid) {
        return this.stuDao.selectStuinfo(stuid);
    }

    public String selectTeaname(int teaid) {
        return this.stuDao.selectTeaname(teaid);
    }

    public void modifyPapeState(int stuid) {
        this.stuDao.modifyPapeState(stuid);
    }

    public void modifyAdviState(int stuid) {
        this.stuDao.modifyAdviState(stuid);
    }

    public void modifyStuinfo(String stuid, String email, String mobilephone, String qq, String wechat) {
        this.stuDao.modifyStuinfo(stuid, email, mobilephone, qq, wechat);
    }

    public void modifyPwd(String stuid, String newpwd) {
        this.stuDao.modifyPwd(stuid, newpwd);
    }

    @Override
    public void updateSelfInfo(String stuid, String selfintro, String selfintroplain) {
        this.stuDao.updateSelfInfo(stuid,selfintro,selfintroplain);
    }

    @Override
    public int updateState(int stuid, int state) {
        return stuDao.updateState(stuid,state);
    }

}
