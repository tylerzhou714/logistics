package com.ev.logistics.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ev.logistics.entity.Position;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface PositionDao extends BaseMapper<Position> {
}
