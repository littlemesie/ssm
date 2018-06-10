package cn.mesie.service;

import cn.mesie.model.Company;
import cn.mesie.model.Evaluation;

import java.util.List;

/**
 * Created by 23/03/2018 8:16 PM
 *
 * @author: mesie
 */
public interface ICompanyService {

    List<Company> selectAllCompany();
    Company selectComById(Integer id);

    int addCom(Company company);

    Evaluation selectEval(Integer stuid, Integer comid);

    int addEval(Evaluation evaluation);

    void modifyEval(Evaluation evaluation);

}
