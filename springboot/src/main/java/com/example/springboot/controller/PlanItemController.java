package com.example.springboot.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.poi.excel.ExcelUtil;
import cn.hutool.poi.excel.ExcelReader;
import cn.hutool.poi.excel.ExcelWriter;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletOutputStream;
import java.math.BigDecimal;
import java.net.URLEncoder;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.springboot.entity.Plan;
import com.example.springboot.service.IPlanService;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import java.io.InputStream;
import java.util.List;
import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.example.springboot.common.Result;
import org.springframework.web.multipart.MultipartFile;
import com.example.springboot.entity.User;
import com.example.springboot.utils.TokenUtils;

import com.example.springboot.service.IPlanItemService;
import com.example.springboot.entity.PlanItem;

import org.springframework.web.bind.annotation.RestController;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author 
 * @since 2022-05-03
 */
@RestController
@RequestMapping("/planItem")
public class PlanItemController {

    @Resource
    private IPlanItemService planItemService;

    @Resource
    private IPlanService planService;

    private final String now = DateUtil.now();

    // 新增或者更新
    @PostMapping
    public Result save(@RequestBody PlanItem planItem) {
        Plan plan = planService.getById(planItem.getPlanId());
        if (planItem.getId() == null) {
            planItem.setDate(DateUtil.today());
            planItem.setUser(TokenUtils.getCurrentUser().getUsername());
            BigDecimal moneyIn = plan.getMoneyIn().add(plan.getMoney());
            planItem.setTotal(moneyIn);

            plan.setMoneyIn(moneyIn);
            plan.setRemain(plan.getTotal().subtract(moneyIn));
            planService.updateById(plan);
        }
        planItemService.saveOrUpdate(planItem);
        return Result.success();
    }

    @DeleteMapping("/{id}")
    public Result delete(@PathVariable Integer id) {
        planItemService.removeById(id);
        return Result.success();
    }

    @PostMapping("/del/batch")
    public Result deleteBatch(@RequestBody List<Integer> ids) {
        planItemService.removeByIds(ids);
        return Result.success();
    }

    @GetMapping("/month")
    public Result findAllMonth() {
        User currentUser = TokenUtils.getCurrentUser();
        return Result.success(planItemService.month(currentUser.getUsername()));
    }

    @GetMapping
    public Result findAll() {
        return Result.success(planItemService.list());
    }

    @GetMapping("/{id}")
    public Result findOne(@PathVariable Integer id) {
        return Result.success(planItemService.getById(id));
    }

    @GetMapping("/page")
    public Result findPage(@RequestParam(defaultValue = "") String name,
                           @RequestParam Integer pageNum,
                           @RequestParam Integer pageSize) {
        QueryWrapper<PlanItem> queryWrapper = new QueryWrapper<>();
        queryWrapper.orderByDesc("id");
        if (!"".equals(name)) {
            queryWrapper.like("name", name);
        }
//        User currentUser = TokenUtils.getCurrentUser();
//        if (currentUser.getRole().equals("ROLE_USER")) {
//            queryWrapper.eq("user", currentUser.getUsername());
//        }
        return Result.success(planItemService.page(new Page<>(pageNum, pageSize), queryWrapper));
    }

    @GetMapping("/page/front")
    public Result findPagefront(@RequestParam(defaultValue = "") Integer planId) {
        QueryWrapper<PlanItem> queryWrapper = new QueryWrapper<>();
//        queryWrapper.orderByDesc("id");
        queryWrapper.eq("plan_id", planId);
        User currentUser = TokenUtils.getCurrentUser();
        queryWrapper.eq("user", currentUser.getUsername());
        return Result.success(planItemService.list(queryWrapper));
    }

    /**
    * 导出接口
    */
    @GetMapping("/export")
    public void export(HttpServletResponse response) throws Exception {
        // 从数据库查询出所有的数据
        List<PlanItem> list = planItemService.list();
        // 在内存操作，写出到浏览器
        ExcelWriter writer = ExcelUtil.getWriter(true);

        // 一次性写出list内的对象到excel，使用默认样式，强制输出标题
        writer.write(list, true);

        // 设置浏览器响应的格式
        response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet;charset=utf-8");
        String fileName = URLEncoder.encode("PlanItem信息表", "UTF-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + fileName + ".xlsx");

        ServletOutputStream out = response.getOutputStream();
        writer.flush(out, true);
        out.close();
        writer.close();

        }

    /**
     * excel 导入
     * @param file
     * @throws Exception
     */
    @PostMapping("/import")
    public Result imp(MultipartFile file) throws Exception {
        InputStream inputStream = file.getInputStream();
        ExcelReader reader = ExcelUtil.getReader(inputStream);
        // 通过 javabean的方式读取Excel内的对象，但是要求表头必须是英文，跟javabean的属性要对应起来
        List<PlanItem> list = reader.readAll(PlanItem.class);

        planItemService.saveBatch(list);
        return Result.success();
    }

    private User getUser() {
        return TokenUtils.getCurrentUser();
    }

}

