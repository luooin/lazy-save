package com.example.springboot.service.impl;

import com.example.springboot.entity.PlanItem;
import com.example.springboot.mapper.PlanItemMapper;
import com.example.springboot.service.IPlanItemService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;
import java.util.Map;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author 
 * @since 2022-05-03
 */
@Service
public class PlanItemServiceImpl extends ServiceImpl<PlanItemMapper, PlanItem> implements IPlanItemService {

    @Resource
    private PlanItemMapper planItemMapper;

    @Override
    public List<Map> month(String username) {
        return planItemMapper.month(username);
    }
}
