package com.ev.logistics.service;

import com.baomidou.mybatisplus.extension.service.IService;
import com.ev.logistics.entity.Post;

import java.util.Date;
import java.util.List;


public interface PostService extends IService<Post> {
    List<Post> findByUserId(Integer id);

    Post findById(Integer id);

    void updatePostStatusTo1(Integer id, Date date);

    List<Post> findPostBySearch(Post post);

    List<Post> findAllPost();

    List<Post> findPostByStatus12();

    void updatePostStatusTo2(Integer id, Date date);

    Post findByNum(String num);

    void updatePostStatusTo3(Integer id, Date date);
}
