package cn.mesie.controller;

import cn.mesie.model.Student;
import cn.mesie.model.Teacher;
import cn.mesie.service.ICollegeService;
import cn.mesie.service.IStuService;
import cn.mesie.utils.JsonUtils;
import cn.mesie.utils.ResponseUtils;
import com.alibaba.fastjson.JSONObject;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.util.*;

@Controller
@RequestMapping("/stud")
public class StudentController {

    @Resource
    private IStuService stuService;

    @Resource
    private ICollegeService collegeService;

    /**
     * 展示个人信息
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/showStuInfo",method = RequestMethod.GET)
    public String showStuinfo (Model model,HttpSession httpSession){
        Map<String,Object> stumap = new HashMap<>();
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        Student stu=this.stuService.selectStuinfo(stuid);
        Integer universityid=stu.getUniversityid();
        String uniname=this.collegeService.selectUni(universityid);
        Integer instituid=stu.getInstituid();
        String insname=this.collegeService.selectIns(instituid);
        Integer departmentid=stu.getDepartmentid();
        String depname=this.collegeService.selectDep(departmentid);
        Integer majorid=stu.getMajorid();
        String majname=this.collegeService.selectMaj(majorid);
        Integer classid=stu.getClassid();
        String claname=this.collegeService.selectCla(classid);
        Integer paperadvisor=stu.getPaperadvisor();
        if (paperadvisor==0){
            stumap.put("papename","");
        }
        else if (paperadvisor==1){
            stumap.put("papename"," ");
        }
        else{
            String papename=this.stuService.selectTeaname(paperadvisor);
            stumap.put("papename",papename);
        }
        Integer internadvisor=stu.getInternadvisor();
        if (internadvisor==0){
            stumap.put("intename","");
        }
        else{
            String intename=this.stuService.selectTeaname(internadvisor);
            stumap.put("intename",intename);
        }
        stumap.put("uniname",uniname);
        stumap.put("insname",insname);
        stumap.put("depname",depname);
        stumap.put("majname",majname);
        stumap.put("claname",claname);
        model.addAttribute("stu",stu);
        model.addAttribute("stumap",stumap);
        return "student/showStuInfo";
    }

    /**
     * 展示教师列表
     * @param model
     * @return
     */
    @RequestMapping(value = "/chooseTea",method = RequestMethod.GET)
    public String chooseTea(@RequestParam(required = true)Integer teatype,Model model){
        List<Teacher> teachers=stuService.selectAllTeacher();
        System.out.println(teachers.get(0).getInstitution().getName());
        System.out.println(teachers.get(0).getDepartment().getName());
        model.addAttribute("teatype",teatype);
        model.addAttribute("teachers",teachers);
        return "student/chooseTea";
    }

    /**
     * 更改申请状态
     * @param model
     * @return
     */
    @RequestMapping(value = "/modifyPapeState",method = RequestMethod.GET)
    public String modifyPapeState( @RequestParam(required = true)Integer teatype,Model model,HttpSession httpSession){
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        if (teatype.equals(1)){
            this.stuService.modifyPapeState(stuid);
        }
        else{
            this.stuService.modifyAdviState(stuid);
        }
        return "redirect:/stud/showStuInfo";
    }

    /**
     * 修改学生信息
     * @param mobilephone
     * @param qq
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/modifyStuinfo.do",method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> modifyStuinfo(@RequestParam(required = true) String mobilephone, @RequestParam(required = true)
                    String qq, @RequestParam(required = true) String wechat,@RequestParam(required = true) String email,
                                      HttpSession httpSession) {
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        this.stuService.modifyStuinfo(stuid.toString(),email,mobilephone,qq,wechat);
        Map<String, Object> result = new HashMap<>();
        result.put("msg","succ");
        return result;
    }

    /**
     * 展示自我介绍信息
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/showSelfIntro",method = RequestMethod.GET)
    public String selfintro(Model model,HttpSession httpSession){
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        Student stu=this.stuService.selectStuinfo(stuid);
        model.addAttribute("stu",stu);
        return "student/showSelfIntro";
    }

    /**
     * 保存个人介绍修改
     * @param selfintroplain
     * @param selfintro
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/saveSelfInfo.do",method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> saveSelfInfo(@RequestParam(required = true)String selfintroplain,
                                      @RequestParam(required = true)String selfintro,HttpSession httpSession){
        System.out.println(selfintro);
        System.out.println(selfintroplain);
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        this.stuService.updateSelfInfo(stuid.toString(),selfintro,selfintroplain);
        Map<String, Object> result = new HashMap<>();
        result.put("msg","succ");
        return result;
    }

    @RequestMapping(value = "/uploadFile.do",method = RequestMethod.POST)
//    public String uploadFile(@RequestParam(required = true)Integer active,Model model,
//                             HttpServletRequest request,@Param("file") MultipartFile file) throws IOException {
    public void uploadFile(HttpServletRequest request, HttpServletResponse response, @Param("file") MultipartFile file) throws IOException {
        System.out.println("进入了");

//        String rootPath ="G:\\ssm\\src\\main\\webapp\\static\\images/";
        String rootPath=request.getSession().getServletContext().getRealPath("upload");
        System.out.println(rootPath);
        String filename = file.getOriginalFilename();
        System.out.println(filename);
        File filepath = new File(rootPath,filename);
        //判断路径是否存在，如果不存在就创建一个
        if (!filepath.getParentFile().exists()) {
            filepath.getParentFile().mkdirs();
        }
        //将上传文件保存到一个目标文件当中
        file.transferTo(new File(rootPath + File.separator + filename));
        String fileUrl ="/ssm/upload/" + filename;


//        String originalFilename = file.getOriginalFilename();
//        String newFileName = res+originalFilename.substring(originalFilename.lastIndexOf("."));
//        Calendar date = Calendar.getInstance();
//        File dateDirs = new File(date.get(Calendar.YEAR)
//                + File.separator + (date.get(Calendar.MONTH)+1));
//        File newFile = new File(rootPath+File.separator+dateDirs+File.separator+newFileName);
//        if(!newFile.getParentFile().exists()) {
//            //如果目标文件所在的目录不存在，则创建父目录
//            newFile.getParentFile().mkdirs();
//        }
//        System.out.println(newFile);
//        file.transferTo(newFile);
//        String fileUrl =  "/uploads/"+date.get(Calendar.YEAR)+ "/"+(date.get(Calendar.MONTH)+1)+ "/"+ newFileName;
        System.out.println(fileUrl);

        Map<String,Object> map = new HashMap<>();
        Map<String,Object> map2 = new HashMap<>();
        map.put("code",0);//0表示成功，1失败
        map.put("msg","");//提示消息
        map2.put("src",fileUrl);//图片url
        map2.put("title",filename);//图片名称，这个会显示在输入框里
        map.put("data",map2);
//        model.addAttribute("active",active);
//        System.out.println(new JSONObject(map).toString());
//        return new JSONObject(map).toString();
        String result = new JSONObject(map).toString();
        ResponseUtils.renderJson(response, JsonUtils.toJson(result));
        System.out.println(result);
        //return result;
    }

    /**
     * 展示修改密码页面
     * @param model
     * @return
     */
    @RequestMapping(value = {"/modifyPwd"},method = RequestMethod.GET)
    public String modifyPwd(Model model){
        return "student/modifyPwd";
    }

    /**
     *修改密码
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/modifyPwd.do",method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> modifyPwd(@RequestParam(required = true)String newpwd,
                             Model model,HttpSession httpSession){
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        this.stuService.modifyPwd(stuid.toString(),newpwd);
        Map<String, Object> result = new HashMap<>();
        result.put("msg","succ");
        return result;
    }
}