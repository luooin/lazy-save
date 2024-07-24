package com.example.springboot.service.impl;

import com.example.springboot.entity.Consumption;
import com.example.springboot.mapper.ConsumptionMapper;
import com.example.springboot.service.IConsumptionService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 
 * @since 2022-05-02
 */
@Service
public class ConsumptionServiceImpl extends ServiceImpl<ConsumptionMapper, Consumption> implements IConsumptionService {

}
