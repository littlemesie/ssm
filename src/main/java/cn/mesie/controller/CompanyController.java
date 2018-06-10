package cn.mesie.controller;

import cn.mesie.model.Company;
import cn.mesie.model.Evaluation;
import cn.mesie.model.Student;
import cn.mesie.service.ICompanyService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/com")
public class CompanyController {

    @Resource
    private ICompanyService companyService;

    /**
     * 显示所有的公司信息
     *
     * @param model
     * @return
     */
    @RequestMapping(value = {"/showCom"}, method = RequestMethod.GET)
    public String showRecruitinfo(Model model) {
        List<Company> companys = companyService.selectAllCompany();
        model.addAttribute("companys", companys);
        return "company/showCom";
    }

    /**
     * 公司详情页
     *
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = {"/showComDetail"}, method = RequestMethod.GET)
    public String showNewsDetail(@RequestParam(required = true) Integer id, Model model) {
        Company company = companyService.selectComById(id);
        System.out.println(company.getCompanyName());
        model.addAttribute("company", company);
        return "company/showComDetail";
    }

    /**
     * 添加公司页面
     * @param model
     * @return
     */
    @RequestMapping(value = {"/addCom"}, method = RequestMethod.GET)
    public String addCom(Model model){
        return "company/addCom";
    }

    /**
     * 增加用人单位
     * @param map
     * @param model
     * @return
     */
    @RequestMapping(value = "/addComp.do",method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> addComp(@RequestBody Map<String,String> map,Model model) {
        Company company=new Company();
        company.setCompany_name(map.get("company_name"));
        company.setAddr(map.get("addr"));
        company.setContactor(map.get("contactor"));
        company.setPhone(map.get("phone"));
        company.setUrl(map.get("url"));
        Integer insert =companyService.addCom(company);
        Map<String, Object> result = new HashMap<>();
        return result;
    }

    /**
     * 显示对公司的评价
     * @param id
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/showEval",method = RequestMethod.GET)
    public String selfintro(@RequestParam(required = true)Integer id,Model model,HttpSession httpSession){
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        Evaluation evaluation=companyService.selectEval(stuid,id);
        if (evaluation==null){
            Evaluation eva=new Evaluation();
            eva.setStuid(stuid);
            eva.setComid(id);
            eva.setEvaluate("");
            Integer insert=companyService.addEval(eva);
            Evaluation evaluation1=companyService.selectEval(stuid,id);
            model.addAttribute("evaluation",evaluation1);
        }
        else {
            model.addAttribute("evaluation",evaluation);
        }
        return "company/showEval";
    }

    /**
     * 修改对用人单位的评价
     * @param stuid
     * @param comid
     * @return
     */
    @RequestMapping(value = "/modifyEval.do",method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> modifyStuinfo(@RequestParam(required = true) String evaluate,
                                      @RequestParam(required = true) Integer stuid, @RequestParam(required = true)Integer comid) {

        Evaluation eva=new Evaluation();
        eva.setStuid(stuid);
        eva.setComid(comid);
        eva.setEvaluate(evaluate);
        companyService.modifyEval(eva);
        Map<String, Object> result = new HashMap<>();
        result.put("msg","succ");
        return result;
    }


}