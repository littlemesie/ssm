package cn.mesie.service.impl;

import cn.mesie.dao.IInternlogDao;
import cn.mesie.model.Internlog;
import cn.mesie.service.IInternlogService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 28/03/2018 8:56 PM
 *
 * @author: mesie
 */
@Service("internlogService")
public class InternlogServiceImpl implements IInternlogService {

    @Resource(name = "internlogDao")
    IInternlogDao internlogDao;

    @Override
    public int addInternlog(Internlog internlog) {
        return internlogDao.addInternlog(internlog);
    }

    @Override
    public List<Internlog> selectAllInternlog() {
        return internlogDao.selectAllInternlog();
    }

    @Override
    public Internlog selectInternlogById(Integer id) {
        return internlogDao.selectInternlogById(id);
    }


    @Override
    public void updateInterLog(String id, String content, String title) {
        internlogDao.updateInterLog(id, content, title);
    }
}
