package com.ev.logistics.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;


@Data
@AllArgsConstructor
@NoArgsConstructor
public class Orders {

    @TableId
    private Integer id;
    private String num;
    private Integer status;
    private Date createTime;
    private Date updateTime;
    private String sendName;
    private Integer positionId;
    private Integer userId;

    private Position position;
    private User user;

}
