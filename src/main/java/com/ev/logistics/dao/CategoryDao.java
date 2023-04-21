package com.ev.logistics.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ev.logistics.entity.Category;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface CategoryDao extends BaseMapper<Category> {
}
