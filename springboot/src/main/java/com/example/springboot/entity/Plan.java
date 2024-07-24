package com.example.springboot.entity;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
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
@ApiModel(value = "Plan对象", description = "")
public class Plan implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("计划名称")
    private String name;

    @ApiModelProperty("周期")
    private Integer duration;

    @ApiModelProperty("总金额")
    private BigDecimal total;

    @ApiModelProperty("每日存入金额")
    private BigDecimal money;

    @ApiModelProperty("已存入金额")
    private BigDecimal moneyIn;

    @ApiModelProperty("剩余金额")
    private BigDecimal remain;

    @ApiModelProperty("创建人")
    private String user;

    @ApiModelProperty("创建日期")
    private String time;

    @ApiModelProperty("图片")
    private String img;


}
