package com.example.springboot.mapper;

import com.example.springboot.entity.PlanItem;
import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;
import java.util.Map;

/**
 * <p>
 *  Mapper 接口
 * </p>
 *
 * @author 
 * @since 2022-05-03
 */
public interface PlanItemMapper extends BaseMapper<PlanItem> {

    @Select("select sum(money) value, left(date, 7) name from plan_item where user = #{username} group by left(date, 7)")
    List<Map> month(String username);

}
