package cn.mesie.service;

import cn.mesie.model.Internlog;

import java.util.List;

/**
 * Created by 28/03/2018 8:55 PM
 *
 * @author: mesie
 */
public interface IInternlogService {

    int addInternlog(Internlog internlog);

    List<Internlog> selectAllInternlog();

    Internlog selectInternlogById(Integer id);

    void updateInterLog(String id,String content,String title);

}
