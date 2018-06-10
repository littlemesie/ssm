package cn.mesie.service;

import cn.mesie.model.Employment;

import java.util.List;

/**
 * Created by 28/03/2018 8:57 PM
 *
 * @author: mesie
 */
public interface IEmploymentService {
    int addEmployment(Employment employment);

    List<Employment> selectAllEmployment();

    Employment selectEmploymentById(Integer id);

    Integer selectLastEmpByStuid(Integer stuid);

    void updateValid(Integer id);

}
