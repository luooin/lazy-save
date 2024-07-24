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
 * @since 2022-05-02
 */
@Getter
@Setter
@ApiModel(value = "Consumption对象", description = "")
public class Consumption implements Serializable {

    private static final long serialVersionUID = 1L;

    @TableId(value = "id", type = IdType.AUTO)
    private Integer id;

    @ApiModelProperty("消费项目")
    private String name;

    @ApiModelProperty("消费金额")
    private BigDecimal money;

    @ApiModelProperty("分类")
    private String category;

    @ApiModelProperty("备注")
    private String remark;

    @ApiModelProperty("图片")
    private String img;

    @ApiModelProperty("消费人")
    private String user;

    @ApiModelProperty("消费时间")
    private String time;


}
