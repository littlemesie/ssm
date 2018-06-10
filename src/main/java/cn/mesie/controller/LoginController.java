package cn.mesie.controller;

import cn.mesie.model.Student;
import cn.mesie.service.IStuService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("login")
public class LoginController {

    @Autowired
    private IStuService stuService;

    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public @ResponseBody
    Map<String, Object> login(@RequestParam(required = true) String stuid, @RequestParam(required = true)
            String password, Model model, HttpSession httpSession) {

        Map<String, Object> result = new HashMap<>();
        System.out.println("------------>>>>:" + "进来了");
        System.out.print(stuid);
        System.out.print(password);
        Student stu = this.stuService.selectStu(stuid, password);

        if (stu != null) {
            httpSession.setAttribute("stuid", stu.getStuid());
            httpSession.setAttribute("name", stu.getStuname());
            result.put("msg", "succ");
        } else {
            result.put("msg", "field");
        }
        return result;
    }
}
