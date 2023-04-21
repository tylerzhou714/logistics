package com.ev.logistics.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import javax.servlet.http.HttpSession;


@Controller
public class IndexController {

    @GetMapping({"/"})
    public String index(Model model, HttpSession session) {
        return "login";
    }

    @GetMapping({"/index"})
    public String index2(Model model, HttpSession session) {
        return "index";
    }

}
