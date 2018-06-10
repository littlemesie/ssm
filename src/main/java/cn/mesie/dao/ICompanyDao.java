package cn.mesie.dao;

import cn.mesie.model.Company;
import cn.mesie.model.Evaluation;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
/**
 * Created by 23/03/2018 8:14 PM
 *
 * @author: mesie
 */
@Repository("companyDao")
public interface ICompanyDao {

    //查询所有的公司
    List<Company> selectAllCompany();

    Company selectComById(@Param("id")Integer id);

    int addCom(Company company);

    Evaluation selectEval(@Param("stuid")Integer stuid,@Param("comid")Integer comid);

    int addEval(Evaluation evaluation);

    void modifyEval(Evaluation evaluation);
}
