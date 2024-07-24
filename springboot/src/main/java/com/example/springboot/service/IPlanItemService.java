package com.example.springboot.service;

import com.example.springboot.entity.PlanItem;
import com.baomidou.mybatisplus.extension.service.IService;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author 
 * @since 2022-05-03
 */
public interface IPlanItemService extends IService<PlanItem> {


    List<Map> month(String username);
}
