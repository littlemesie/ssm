package cn.mesie.model;

import java.util.Date;

/**
 * Created by 27/03/2018 7:37 PM
 * 数据响应类
 * @author: mesie
 */
public class Json {
    /**响应状态码*/
    private String code;
    /**响应状态描述*/
    private String msg;
    /**时间戳*/
    private Long time = new Date().getTime();

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public Long getTime() {
        return time;
    }

    public void setTime(Long time) {
        this.time = time;
    }



}
