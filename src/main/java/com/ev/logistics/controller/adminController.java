package com.ev.logistics.controller;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.ev.logistics.entity.*;
import com.ev.logistics.service.*;
import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;


@Controller
public class adminController {

    @Autowired
    PostService postService;

    @Autowired
    CategoryService categoryService;

    @Autowired
    PositionService positionService;

    @Autowired
    OrdersService ordersService;

    @Autowired
    UserService userService;

    //寄件管理
    @GetMapping("/toAdminSend")
    public String toAdminSend(@RequestParam(required = false, defaultValue = "1", value = "pageNum") int pageNum, HttpSession session, Model model, RedirectAttributes attributes) {
        User userInfo = (User) session.getAttribute("user");
        if (userInfo != null) {
            PageHelper.startPage(pageNum, 6);
            List<Post> postList = postService.findAllPost();
            PageInfo<Post> pageInfo = new PageInfo<>(postList);
            model.addAttribute("postList", postList);
            model.addAttribute("pageInfo", pageInfo);
            List<Category> categoryList = categoryService.list();
            model.addAttribute("categoryList", categoryList);
            return "adminSend";
        } else {
            attributes.addFlashAttribute("message", "权限不足，请先登录");
            return "redirect:/toLogin";
        }
    }

    @GetMapping("adminSendPost/{id}")
    public String adminSendPost(@PathVariable Integer id) {
        postService.updatePostStatusTo1(id, new Date());
        return "redirect:/toAdminSend";
    }

    @PostMapping("/searchPost")
    public String searchPost(Post post, @RequestParam(required = false, defaultValue = "1", value = "pageNum") int pageNum, Model model) {
        PageHelper.startPage(pageNum, 6);
        List<Post> postList = postService.findPostBySearch(post);
        PageInfo<Post> pageInfo = new PageInfo<>(postList);
        List<Category> categoryList = categoryService.list();
        model.addAttribute("categoryList", categoryList);
        model.addAttribute("postList", postList);
        model.addAttribute("pageInfo", pageInfo);
        return "adminSend";
    }


    //收件管理
    @GetMapping("adminPickUpPost/{id}")
    public String adminPickUpPost(@PathVariable Integer id, Model model) {
        Post post = postService.findById(id);
        model.addAttribute("post", post);
        QueryWrapper<Position> status0 = new QueryWrapper<Position>().eq("status", 0);
        List<Position> positionList = positionService.list(status0);
        model.addAttribute("positionList", positionList);
        return "adminPickUp";
    }

//    @GetMapping("/toAdminPickUp")
//    public String toAdminPickUp(Model model, RedirectAttributes attributes, HttpSession session) {
//        User userInfo = (User) session.getAttribute("user");
//        if (userInfo != null) {
//            QueryWrapper<Position> status0 = new QueryWrapper<Position>().eq("status", 0);
//            List<Position> positionList = positionService.list(status0);
//            model.addAttribute("positionList", positionList);
//            return "adminPickUp";
//        } else {
//            attributes.addFlashAttribute("message", "权限不足，请先登录");
//            return "redirect:/toLogin";
//        }
//    }

    @PostMapping("/adminPickUpOrders")
    public String adminPickUpOrders(@RequestParam String num, @RequestParam String name, @RequestParam String sendName, @RequestParam Integer id, @RequestParam Integer positionId) {
        QueryWrapper<User> userName = new QueryWrapper<User>().eq("name", name);
        User user = userService.getOne(userName);
        Orders orders = new Orders();
        orders.setUserId(user.getId());
        orders.setSendName(sendName);
        orders.setPositionId(positionId);
        orders.setCreateTime(new Date());
        orders.setUpdateTime(new Date());
        orders.setNum(num);
        ordersService.save(orders);
        //柜子状态变为1
        Position position = positionService.getById(positionId);
        position.setStatus(1);
        positionService.updateById(position);
        //post状态变为2
        postService.updatePostStatusTo2(id, new Date());

        return "redirect:/toAdminSend";
    }

    //用户管理
    @GetMapping("/toAdminUser")
    public String toAdminUser(@RequestParam(required = false, defaultValue = "1", value = "pageNum") int pageNum, HttpSession session, Model model, RedirectAttributes attributes) {
        User userInfo = (User) session.getAttribute("user");
        if (userInfo != null) {
            PageHelper.startPage(pageNum, 6);
            List<User> userList = userService.list();
            PageInfo<User> pageInfo = new PageInfo<>(userList);
            model.addAttribute("userList", userList);
            model.addAttribute("pageInfo", pageInfo);
            return "adminUser";
        } else {
            attributes.addFlashAttribute("message", "权限不足，请先登录");
            return "redirect:/toLogin";
        }
    }

    @GetMapping("/adminUserTo1/{id}")
    public String adminUserTo1(@PathVariable Integer id, HttpSession session) {
        User user = userService.getById(id);
        user.setRole(1);
        userService.updateById(user);

        User userInfo = (User) session.getAttribute("user");
        if (id == userInfo.getId()) {
            session.setAttribute("user", user);
            return "index";
        }
        return "redirect:/toAdminUser";
    }

    @GetMapping("/adminUserTo0/{id}")
    public String adminUserTo0(@PathVariable Integer id) {
        User user = userService.getById(id);
        user.setRole(0);
        userService.updateById(user);
        return "redirect:/toAdminUser";
    }

}
