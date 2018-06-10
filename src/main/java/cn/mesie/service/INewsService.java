package cn.mesie.service;

import cn.mesie.model.News;

import java.util.List;

/**
 * Created by 21/03/2018 7:33 PM
 *
 * @author: mesie
 */
public interface INewsService {

    List<News> selectNews();
    List<News> selectAllNews();
    News selectNewById(Integer id);
}
