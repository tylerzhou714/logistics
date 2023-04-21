package com.ev.logistics.entity;

import com.baomidou.mybatisplus.annotation.TableId;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;



@Data
@AllArgsConstructor
@NoArgsConstructor
public class Position {

    @TableId
    private Integer id;
    private String locker;
    private Integer status;

}
