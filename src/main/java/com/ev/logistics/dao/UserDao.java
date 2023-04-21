package com.ev.logistics.dao;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.ev.logistics.entity.User;
import org.apache.ibatis.annotations.Mapper;


@Mapper
public interface UserDao extends BaseMapper<User> {
}
