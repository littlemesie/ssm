package cn.mesie.utils;

/**
 * Created by 27/03/2018 8:18 PM
 *  定义状态码
 * @author: mesie
 */
public class StatusCode {

    public static String CODE_SUCCESS = "ok";          //访问成功

    public static String CODE_ERROR = "0001";          //访问错误

    public static String CODE_ERROR_PARAMETER = "0002";//参数错误

    public static String CODE_ERROR_PROGRAM = "0003";  //程序异常

    public static String CODE_ERROR_NO_LOGIN_OR_TIMEOUT = "0004";  //未登录或登录超时,请重新登录

    public static String CODE_ERROR_EXIST_OPERATION = "0005";      //已操作
}
