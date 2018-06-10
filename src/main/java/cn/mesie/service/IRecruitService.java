package cn.mesie.service;

import cn.mesie.model.Recruit;
import java.util.List;

/**
 * Created by 21/03/2018 10:58 PM
 *
 * @author: mesie
 */
public interface IRecruitService {

    List<Recruit> selectRecruit();

    List<Recruit> selectAllRecruit();

    List<Recruit> selectRecruitById(Integer id);
}
