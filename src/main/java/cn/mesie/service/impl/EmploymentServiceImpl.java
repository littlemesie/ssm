package cn.mesie.service.impl;

import cn.mesie.dao.IEmploymentDao;
import cn.mesie.model.Employment;
import cn.mesie.service.IEmploymentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 28/03/2018 8:58 PM
 *
 * @author: mesie
 */
@Service("employmentService")
public class EmploymentServiceImpl implements IEmploymentService {

    @Resource(name = "employmentDao")
    IEmploymentDao employmentDao;

    @Override
    public int addEmployment(Employment employment) {
        return employmentDao.addEmployment(employment);
    }

    @Override
    public List<Employment> selectAllEmployment() {
        return employmentDao.selectAllEmployment();
    }

    @Override
    public Employment selectEmploymentById(Integer id) {
        return employmentDao.selectEmploymentById(id);
    }

    @Override
    public Integer selectLastEmpByStuid(Integer stuid) {
        return employmentDao.selectLastEmpByStuid(stuid);
    }

    @Override
    public void updateValid(Integer id) {
        employmentDao.updateValid(id);
    }
}
