package cn.mesie.controller;

import cn.mesie.model.Jobapply;
import cn.mesie.model.Resume;
import cn.mesie.service.IJobService;
import cn.mesie.service.IResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

@Controller
@RequestMapping("/job")
public class JobController {

    @Resource
    private IJobService jobService;

    @Resource
    private IResumeService resumeService;

    /**
     * 显示所有求职信息
     * @param model
     * @return
     */
    @RequestMapping(value = {"/showJob"},method = RequestMethod.GET)
    public String showJob(Model model){
        List<Jobapply> jobapplyList=jobService.selectAllJop();
        model.addAttribute("jobapplyList",jobapplyList);
        return "job/showJob";
    }

    /**
     * 显示所有简历信息
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = {"/showResume"},method = RequestMethod.GET)
    public String showResume(Model model,HttpSession httpSession){
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        List<Resume> resumes=resumeService.selectAllRes(stuid);
        model.addAttribute("resumes",resumes);
        return "job/showResume";
    }

    /**
     * 显示简历详情页
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = {"/showResumeDetail"},method = RequestMethod.GET)
    public String showResumeDetail(@RequestParam(required = true) Integer id,HttpServletRequest request, Model model){
        Resume resume=resumeService.selectOneRes(id);
        if(resume.getType() == 1){
            String path = "upload/" + resume.getFilename();
            //resumePDF
            model.addAttribute("resume",path);
            return "job/previewPDF";
        }else {
            model.addAttribute("resume",resume);
            return "job/showResumeDetail";
        }

    }


    /**
     * 上传简历
     * @param file
     * @param request
     * @param httpSession
     * @return
     * @throws Exception
     */
    @RequestMapping(value = "/uploadResume.do",method = RequestMethod.POST)
    public String uploadResume(@RequestParam("file") MultipartFile file, HttpServletRequest request,HttpSession httpSession,Model model) throws Exception{
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        Properties props=System.getProperties();
        String osName = props.getProperty("os.name");
        //如果文件不为空，写入上传路径
        if(!file.isEmpty()) {
            //上传文件路径
            String path = "";
            /*if("Mac OS X".equals(osName)){
                String path1 = this.getClass().getClassLoader().getResource("/").getPath();
                String[] strArray = path1.split("/");
                for(int i = 0;i< strArray.length;i++){
                    if("target".equals(strArray[i])){
                        break;
                    }else {
                        path = path + strArray[i] + "/";
                    }
                }
                path = path + "src/main/webapp/static/upload";
            }else {
                path = request.getSession().getServletContext().getRealPath("upload");
            }*/
            path = request.getSession().getServletContext().getRealPath("upload");
           //上传文件名
            String filename = file.getOriginalFilename();
            System.out.println(filename);
            File filepath = new File(path,filename);
            //判断路径是否存在，如果不存在就创建一个
            if (!filepath.getParentFile().exists()) {
                filepath.getParentFile().mkdirs();
            }
            //将上传文件保存到一个目标文件当中
            file.transferTo(new File(path + File.separator + filename));
            Resume resume=new Resume();
            resume.setStuid(stuid);
            resume.setFilename(filename);
            resume.setOnlinecv("");
            resume.setComment("");
            resume.setType(1);
            int result=resumeService.addRes(resume);

//            model.addAttribute("msg","succ");
            return "redirect:/job/showResume";
        } else {
//            model.addAttribute("msg","filed");
            return "job/showResume";
        }
    }
    /**
     * 修改简历
     * @param id
     * @param filename
     * @param onlinecv
     * @param comment
     * @return
     */
    @RequestMapping(value = "/modifyResume.do",method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> modifyResume(@RequestParam(required = true) Integer id,@RequestParam(required = true) String filename, @RequestParam(required = true)
            String onlinecv, @RequestParam(required = true) String comment) {

        resumeService.modifyRes(id.toString(),filename,onlinecv,comment);
        Map<String, Object> result = new HashMap<>();
        result.put("msg","succ");
        return result;
    }


    /**
     * 删除简历
     * @param id
     * @return
     */
    @RequestMapping(value = "/deleteResume.do",method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> deleteResume(@RequestParam(required = true) Integer id) {
        System.out.println(id);
        resumeService.deleteRes(id);
        Map<String, Object> result = new HashMap<>();
        result.put("msg","succ");
        return result;
    }

    /**
     * 增加简历
     * @param filename
     * @param onlinecv
     * @param comment
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/addRes.do",method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> addRes(@RequestParam(required = true) String filename, @RequestParam(required = true) String onlinecv,
                                @RequestParam(required = true) String comment,HttpSession httpSession) {
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        Resume res=new Resume();
        res.setStuid(stuid);
        res.setFilename(filename);
        res.setOnlinecv(onlinecv);
        res.setComment(comment);
        res.setType(2);
        Integer insert=resumeService.addRes(res);
        System.out.println(insert);
        Map<String, Object> result = new HashMap<>();
        result.put("msg",insert);
        return result;
    }

    /**
     * 选择简历
     * @param id
     * @param comid
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = {"/selectRes"},method = RequestMethod.GET)
    public String selectRes(@RequestParam(required = true) Integer id,@RequestParam(required = true) Integer comid,Model model,HttpSession httpSession){
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        List<Resume> resumes=resumeService.selectAllRes(stuid);
        model.addAttribute("resumes",resumes);
        model.addAttribute("recid",id);
        model.addAttribute("comid",comid);
        return "job/selectRes";
    }

    @RequestMapping(value = "/addJobApply.do",method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> addRes(@RequestParam(required = true) Integer resId, @RequestParam(required = true) Integer recid,
                               @RequestParam(required = true) Integer comid,HttpSession httpSession) {
        Map<String, Object> result = new HashMap<>();
        Integer stuid=(Integer) httpSession.getAttribute("stuid");
        Jobapply jobapply=jobService.selectOneJob(stuid,recid);
        if (jobapply==null){
            Jobapply newjob=new Jobapply();
            newjob.setStuid(stuid);
            newjob.setResumeid(resId);
            newjob.setRecruitid(recid);
            newjob.setComid(comid);
            newjob.setStatus(1);
            Integer insert=jobService.addJobApply(newjob);
            result.put("msg",insert);
        }
        else{
            result.put("msg",0);
        }
        return result;
    }
}
