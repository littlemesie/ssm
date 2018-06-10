package cn.mesie.service.impl;

import cn.mesie.dao.INewsDao;
import cn.mesie.model.News;
import cn.mesie.service.INewsService;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 21/03/2018 7:34 PM
 *
 * @author: mesie
 */
@Service("newsService")
public class NewsServiceImpl implements INewsService{

    @Resource(name ="newsDao")
    private INewsDao newsDao;

    @Override
    public List<News> selectNews() {
        return newsDao.selectNews();
    }

    @Override
    public List<News> selectAllNews() {
        return newsDao.selectAllNews();
    }

    @Override
    public News selectNewById(Integer id) {
        return newsDao.selectNewById(id);
    }
}
