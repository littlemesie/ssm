package cn.mesie.service;

import cn.mesie.model.Internship;


import java.util.List;

/**
 * Created by 26/03/2018 8:34 PM
 *
 * @author: mesie
 */
public interface IInternshipService {

    int addInternship(Internship internship);

    List<Internship> selectAllInternship();

    Internship selectInternshipById(Integer id);

    Integer selectInteByStuidState(Integer stuid);

    Integer updateState(Integer id,Integer state);

}
