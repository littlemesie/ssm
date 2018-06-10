package cn.mesie.utils;

import cn.mesie.model.Json;

import java.util.List;

/**
 * Created by 27/03/2018 8:13 PM
 *
 * @author: mesie
 */
public class ListObject extends Json{
    /**列表对象*/
    private List<?> items;

    public List<?> getItems() {
        return items;
    }

    public void setItems(List<?> items) {
        this.items = items;
    }

}
