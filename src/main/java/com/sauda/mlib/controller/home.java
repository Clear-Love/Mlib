/*
 * @Author: lmio
 * @Date: 2023-03-09 22:35:04
 * @LastEditTime: 2023-03-10 13:43:48
 * @FilePath: /mlib/src/main/java/com/sauda/mlib/controller/helloworld.java
 * @Description: 
 */
package com.sauda.mlib.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class home {
    @GetMapping("/")
    public String hello(Model model) {
        model.addAttribute("title", "Hello, World");
        return "home";
    }
}