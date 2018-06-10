package cn.mesie.controller;

import cn.mesie.model.News;
import cn.mesie.model.Recruit;
import cn.mesie.model.Resume;
import cn.mesie.service.INewsService;
import cn.mesie.service.IRecruitService;
import cn.mesie.service.IResumeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.List;

@Controller
@RequestMapping("/index")
public class IndexController {

    @Resource
    private INewsService newsService;
    @Resource
    private IRecruitService recruitService;
    @Resource
    private IResumeService resumeService;

    /**
     * 首页
     * @param model
     * @param httpSession
     * @return
     */
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public String index(Model model, HttpSession httpSession) {
        System.out.println(httpSession.getAttribute("name"));
        String stuName = (String) httpSession.getAttribute("name");
        List<News> news = newsService.selectNews();
        List<Recruit> recruits = recruitService.selectRecruit();
        model.addAttribute("name", stuName);
        model.addAttribute("news",news);
        model.addAttribute("recruits",recruits);
        return "index/index";
    }

    /**
     * 新闻详情页
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = {"/showNewsDetail"},method = RequestMethod.GET)
    public String showNewsDetail(@RequestParam(required = true) Integer id,Model model){
        News news = newsService.selectNewById(id);
        model.addAttribute("news",news);
        return "index/showNewsDetail";
    }

    /**
     * 招聘信息详情页
     * @param id
     * @param model
     * @return
     */
    @RequestMapping(value = {"/showRecrDetail"},method = RequestMethod.GET)
    public String showRecrDetail(@RequestParam(required = true) Integer id,Model model){
        List<Recruit> recruit = recruitService.selectRecruitById(id);
        model.addAttribute("recruit",recruit);
        return "index/showRecrDetail";
    }

    /**
     * 显示所有的通知信息
     * @param model
     * @return
     */
    @RequestMapping(value = {"/showNews"},method = RequestMethod.GET)
    public String showNews(Model model){
        List<News> news = newsService.selectAllNews();
        model.addAttribute("news",news);
        return "index/showNews";
    }

    /**
     * 现实所有招聘信息
     * @param model
     * @return
     */
    @RequestMapping(value = {"/showRecruitinfo"},method = RequestMethod.GET)
    public String showRecruitinfo(Model model,HttpSession httpSession){
        List<Recruit> recruits = recruitService.selectAllRecruit();
        model.addAttribute("recruits",recruits);
        return "index/showRecruitinfo";
    }

}