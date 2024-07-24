package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import java.io.Serializable;
import java.math.BigDecimal;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
import lombok.Getter;
import lombok.Setter;

/**
 * <p>
 * 
 * </p>
 *
 * @author 
 * @since 2022-05-03
 */
@Getter
@Setter
@TableName("plan_item")
@ApiModel(value = "PlanItem对象", description = "")
public class PlanItem implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("计划id")
    private Integer planId;

    @ApiModelProperty("金额")
    private BigDecimal money;

    @ApiModelProperty("累计金额")
    private BigDecimal total;

    @ApiModelProperty("日期")
    private String date;

    @ApiModelProperty("创建人")
    private String user;


}
