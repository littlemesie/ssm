package cn.mesie.service.impl;
import cn.mesie.dao.ICollegeDao;
import cn.mesie.service.ICollegeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service("collegeService")
public class CollegeSerImpl implements ICollegeService{

    @Resource(name = "collegeDao")
    private ICollegeDao collegeDao;

    public String selectUni(int universityid) {return this.collegeDao.selectUni(universityid);}

    public String selectIns(int instituid) {return this.collegeDao.selectIns(instituid);}

    public String selectDep(int departmentid) {return this.collegeDao.selectDep(departmentid);}

    public String selectMaj(int majorid) {return this.collegeDao.selectMaj(majorid);}

    public String selectCla(int classid) {return this.collegeDao.selectCla(classid);}

}
