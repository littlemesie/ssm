package cn.mesie.controller;

import cn.mesie.model.*;
import cn.mesie.service.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

@Controller
@RequestMapping("/internship")
public class InternshipController {

    @Resource
    private ICompanyService companyService;
    @Resource
    private IInternshipService internshipService;
    @Resource
    private IInternlogService internlogService;
    @Resource
    private IEmploymentService employmentService;
    @Resource
    private IStuService stuService;
    /**
     * 显示所有实习就业页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/showInternship", method = RequestMethod.GET)
    public String showInternship(Model model,HttpSession httpSession){
        Integer stuid = (Integer) httpSession.getAttribute("stuid");
        Student student = stuService.selectStuinfo(stuid);
        List<Internship> internships = internshipService.selectAllInternship();
        model.addAttribute("student",student);
        model.addAttribute("internships",internships);
        return "internship/showInternship";
    }

    /**
     * 添加实习页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/addIntern", method = RequestMethod.GET)
    public String addIntern(Model model){
        List<Company> companies = companyService.selectAllCompany();
        model.addAttribute("companies",companies);
        return "internship/addIntern";
    }

    /**
     * 增加实习的操作
     * @param map
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/addShip.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addShip(@RequestBody Map<String,String> map, Model model,HttpSession httpSession){
        Internship internship = new Internship();
        Integer stuid = (Integer) httpSession.getAttribute("stuid");
        internship.setStuid(stuid);
        internship.setComid(Integer.parseInt(map.get("com_id")));
        internship.setPosition(map.get("position"));
        internship.setJobintro(map.get("job_intro"));
        internship.setJobcontent(map.get("job_content"));
        internship.setOutcome(map.get("outcome"));
        internship.setStarttime(map.get("start_time"));
        internship.setEndtime(map.get("end_time"));
        internship.setInstructor(map.get("instructor"));
        internship.setInstructorphone(map.get("phone"));
        int in = internshipService.addInternship(internship);
        int st = stuService.updateState(stuid,1);
        Map<String,Object> result = new HashMap<>();

        if(st!=0 && in!=0){
            result.put("msg","succ");
        }else {
            stuService.updateState(stuid,0);
            result.put("msg","filed");
        }

        return result;
    }

    /**
     * 实习变更修改
     * @param id
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/changeShip.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> changeShip(@RequestParam(required = true)String id, Model model,HttpSession httpSession){
        System.out.println("---------------"+id);
        Integer stuid = (Integer) httpSession.getAttribute("stuid");
        //修改学生实习状态
        int stuState = stuService.updateState(stuid,3);
        //修改实习为无效
        int shipState = internshipService.updateState(Integer.parseInt(id),4);

        Map<String,Object> result = new HashMap<>();
        if(shipState!=0 && stuState!=0){
            result.put("msg","succ");
        }else {
            stuService.updateState(stuid,2);
            internshipService.updateState(Integer.parseInt(id),2);
            result.put("msg","filed");
        }
        return result;
    }

    /**
     * 查看实习详情页
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = "/showInterShipDetail", method = RequestMethod.GET)
    public String showInterShipDetail(@RequestParam(required = true)Integer id,Model model){
        Internship internship = internshipService.selectInternshipById(id);
        model.addAttribute("internship",internship);
        return "internship/showInterShipDetail";
    }

    /**
     * 显示所有实习日志
     * @param model
     * @return
     */
    @RequestMapping(value = "/showInterLog", method = RequestMethod.GET)
    public String showInterLog(Model model){
        List<Internlog> internlogs = internlogService.selectAllInternlog();
        model.addAttribute("internlogs",internlogs);
        return "internship/showInterLog";
    }

    /**
     * 显示所有就业信息
     * @param model
     * @return
     */
    @RequestMapping(value = "/showEmploy", method = RequestMethod.GET)
    public String showEmploy(Model model){
        List<Employment> employments = employmentService.selectAllEmployment();
        model.addAttribute("employments",employments);
        return "internship/showEmploy";
    }

    /**
     * 添加就业页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/addEmploy", method = RequestMethod.GET)
    public String addEmploy(Model model){
        List<Company> companies = companyService.selectAllCompany();
        model.addAttribute("companies",companies);
        return "internship/addEmploy";
    }

    /**
     * 增加就业的操作
     * @param map
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/addEmp.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addEmp(@RequestBody Map<String,String> map, Model model,HttpSession httpSession){
        Employment employment = new Employment();
        Integer stuid = (Integer) httpSession.getAttribute("stuid");
        Integer interId=employmentService.selectLastEmpByStuid(stuid);
        employmentService.updateValid(interId);
        employment.setStuid(stuid);
        employment.setComid(Integer.parseInt(map.get("com_id")));
        employment.setSigndate(map.get("sign_date"));
        int i = employmentService.addEmployment(employment);
        Map<String,Object> result = new HashMap<>();
        if(i!=0){
            result.put("msg","succ");
        }else {
            result.put("msg","filed");
        }

        return result;
    }


    /**
     * 查看就业详情
     * @param id
     * @param model
     * @return
     */

    @RequestMapping(value = "/showEmployDetail", method = RequestMethod.GET)
    public String showEmployDetail(@RequestParam(required = true)Integer id,Model model){
        Company company = companyService.selectComById(id);
        model.addAttribute("company",company);
        return "internship/showEmployDetail";
    }

    /**
     *显示增加实习日志页面
     * @param model
     * @return
     */
    @RequestMapping(value = "/addInterLog", method = RequestMethod.GET)
    public String addInterLog(Model model){
        return "internship/addInterLog";
    }

    /**
     * 增加实习日志
     * @param content
     * @param title
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/addInterLog.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> addInterLogDo(@RequestParam(required = true)String content, @RequestParam(required = true)String title,
                                             Model model,HttpSession httpSession){
        Map<String,Object> result = new HashMap<>();
        Integer stuid = (Integer) httpSession.getAttribute("stuid");
        Integer comid=internshipService.selectInteByStuidState(stuid);
        if (comid==null){
            result.put("msg","failed");
        }
        else {
            Internlog internlog=new Internlog();
            SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd");
            String date=df.format(new Date());
            internlog.setStuid(stuid);
            internlog.setDate(date);
            internlog.setComid(comid);
            internlog.setContent(content);
            internlog.setTitle(title);
            Integer insert=internlogService.addInternlog(internlog);
            result.put("msg",insert);
        }
        return result;
    }


    @RequestMapping(value = "/showInterLogDetail", method = RequestMethod.GET)
    public String showInterLogDetail(@RequestParam(required = true)Integer id,Model model){
        Internlog internlog=internlogService.selectInternlogById(id);
        model.addAttribute("internlog",internlog);
        return "internship/showInterLogDetail";
    }

    @RequestMapping(value = "/modifyInterLog.do", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> modifyInterLog(@RequestParam(required = true)String id,@RequestParam(required = true)String content,
                                              @RequestParam(required = true)String title){
        internlogService.updateInterLog(id,content,title);
        Map<String,Object> result = new HashMap<>();
        result.put("msg","succ");
        return result;
    }

}
