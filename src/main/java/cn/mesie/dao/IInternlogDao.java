package cn.mesie.dao;

import cn.mesie.model.Internlog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * Created by 28/03/2018 8:54 PM
 *
 * @author: mesie
 */
@Repository("internlogDao")
public interface IInternlogDao {

    int addInternlog(Internlog internlog);

    List<Internlog> selectAllInternlog();

    Internlog selectInternlogById(@Param("id") Integer id);

    void updateInterLog(@Param("id") String id,@Param("content") String content,@Param("title") String title);
}
