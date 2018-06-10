package cn.mesie.service.impl;

import cn.mesie.dao.IInternshipDao;
import cn.mesie.model.Internship;
import cn.mesie.service.IInternshipService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 26/03/2018 8:35 PM
 *
 * @author: mesie
 */
@Service("internshipService")
public class InternshipServiceImpl implements IInternshipService{
    @Resource(name = "internshipDao")
    IInternshipDao internshipDao;
    @Override
    public int addInternship(Internship internship) {

        return internshipDao.addInternship(internship);
    }

    @Override
    public List<Internship> selectAllInternship() {
        return internshipDao.selectAllInternship();
    }

    @Override
    public Internship selectInternshipById(Integer id) {
        return internshipDao.selectInternshipById(id);
    }


    @Override
    public Integer selectInteByStuidState(Integer stuid) {
        return internshipDao.selectInteByStuidState(stuid);
    }

    @Override
    public Integer updateState(Integer id, Integer state) {
        return internshipDao.updateState(id,state);
    }
}
