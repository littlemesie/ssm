package cn.mesie.service.impl;

import cn.mesie.dao.IRecruitDao;
import cn.mesie.model.Recruit;
import cn.mesie.service.IRecruitService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 21/03/2018 10:59 PM
 *
 * @author: mesie
 */
@Service("recruitService")
public class RecruitServiceImpl implements IRecruitService{

    @Resource(name ="recruitDao")
    private IRecruitDao recruitDao;
    @Override
    public List<Recruit> selectRecruit() {

        return recruitDao.selectRecruit();
    }

    @Override
    public List<Recruit> selectAllRecruit() {
        return recruitDao.selectAllRecruit();
    }

    @Override
    public List<Recruit> selectRecruitById(Integer id) {
        return recruitDao.selectRecruitById(id);
    }
}
