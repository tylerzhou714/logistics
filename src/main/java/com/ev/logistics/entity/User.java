package com.ev.logistics.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class User {

    @TableId
    private Integer id;
    private String username;
    private String password;
    private String name;
    private String avatar;
    private String phone;
    private String email;
    private Date createTime;
    private Integer role;

}
