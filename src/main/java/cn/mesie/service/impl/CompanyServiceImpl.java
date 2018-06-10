package cn.mesie.service.impl;

import cn.mesie.dao.ICompanyDao;
import cn.mesie.model.Company;
import cn.mesie.model.Evaluation;
import cn.mesie.service.ICompanyService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * Created by 23/03/2018 8:17 PM
 *
 * @author: mesie
 */
@Service("companyService")
public class CompanyServiceImpl implements ICompanyService {

    @Resource(name = "companyDao")
    ICompanyDao companyDao;

    @Override
    public List<Company> selectAllCompany() {
        return companyDao.selectAllCompany();
    }

    public Company selectComById(Integer id) {
        return companyDao.selectComById(id);
    }

    public int addCom(Company company) {
        return companyDao.addCom(company);
    }

    public Evaluation selectEval(Integer stuid, Integer comid) {
        return companyDao.selectEval(stuid, comid);
    }

    public int addEval(Evaluation evaluation) {
        return companyDao.addEval(evaluation);
    }

    public void modifyEval(Evaluation evaluation) {
        companyDao.modifyEval(evaluation);
    }
}
