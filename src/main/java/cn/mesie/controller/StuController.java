package cn.mesie.controller;
import javax.servlet.http.HttpServletRequest;
import cn.mesie.model.Student;
import cn.mesie.service.IStuService;
import cn.mesie.utils.JsonUtils;
import cn.mesie.utils.ListObject;
import cn.mesie.utils.ResponseUtils;
import cn.mesie.utils.StatusCode;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("/stu")
//@CrossOrigin(origins = "*", maxAge = 3600)
public class StuController {

    @Resource
    private IStuService stuService;

    @RequestMapping(value = "/test",method = RequestMethod.GET)
    public String test() {
        return "test/test";

    }

    /**
     * 接口测试
     * @param stuid
     * @param request
     * @param response
     */
    @RequestMapping(value = "/findById",method = RequestMethod.GET)
    public void findById(@RequestParam(required = true) String stuid, HttpServletRequest request, HttpServletResponse response) {
        Integer id = Integer.parseInt(stuid);
        Student stu = stuService.selectStuinfo(id);
        List<Student> list = new ArrayList<>();
        list.add(stu);
        ListObject listObject = new ListObject();
        listObject.setItems(list);
        listObject.setCode(StatusCode.CODE_SUCCESS);
        listObject.setMsg("访问成功");
        ResponseUtils.renderJson(response, JsonUtils.toJson(listObject));
    }

    /**
     * post接口提交测试
     * @param stuid
     * @param password
     * @param response
     */
    @RequestMapping(method = RequestMethod.POST,value = "/testLogin")
    public void testLogin(@RequestParam(required = true) String stuid, @RequestParam(required = true)
            String password, HttpServletResponse response){
        Student stu=this.stuService.selectStu(stuid, password);
        List<Student> list = new ArrayList<>();
        list.add(stu);
        ListObject listObject = new ListObject();
        listObject.setItems(list);
        listObject.setCode(StatusCode.CODE_SUCCESS);
        listObject.setMsg("访问成功");
        ResponseUtils.renderJson(response, JsonUtils.toJson(listObject));
    }
}
