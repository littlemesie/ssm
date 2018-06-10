package cn.mesie.utils;

import com.fasterxml.jackson.databind.ObjectMapper;

/**
 * Created by 27/03/2018 8:15 PM
 * JsonUtils生成json数据和解析json数据
 * @author: mesie
 */
public class JsonUtils {

    static ObjectMapper objectMapper;

    /*
     * 解析json
     */
    public static <T> T fromJson(String content, Class<T> valueType) {
        if (objectMapper == null) {
            objectMapper = new ObjectMapper();
        }
        try {
            return objectMapper.readValue(content, valueType);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    /*
     * 生成json
     */
    public static String toJson(Object object) {
        if (objectMapper == null) {
            objectMapper = new ObjectMapper();
        }
        try {
            return objectMapper.writeValueAsString(object);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
