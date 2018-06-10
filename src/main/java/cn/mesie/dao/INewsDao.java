package cn.mesie.dao;
import cn.mesie.model.News;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository("newsDao")
public interface INewsDao {

    /**
     * 查询新闻信息
     * @return
     */
    List<News> selectNews();

    List<News> selectAllNews();

    News selectNewById(@Param("id")Integer id);

}
