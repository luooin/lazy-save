package com.example.springboot.service.impl;

import com.example.springboot.entity.Plan;
import com.example.springboot.mapper.PlanMapper;
import com.example.springboot.service.IPlanService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 
 * @since 2022-05-03
 */
@Service
public class PlanServiceImpl extends ServiceImpl<PlanMapper, Plan> implements IPlanService {

}
