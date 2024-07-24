package com.example.springboot.mapper;

import com.example.springboot.entity.Consumption;
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
 * @since 2022-05-02
 */
public interface ConsumptionMapper extends BaseMapper<Consumption> {

    @Select("select sum(money) value, left(time, 7) name from consumption where user = #{username} group by left(time, 7)")
    List<Map> month(String username);

    @Select("select sum(money) value, category name from consumption where user = #{username} group by category")
    List<Map> category(String username);
}
