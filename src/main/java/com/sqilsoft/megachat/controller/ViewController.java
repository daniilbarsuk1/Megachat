package com.sqilsoft.megachat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class ViewController {
    @RequestMapping("/")
    public String signup(){
        return "signup";
    }
    @GetMapping("/chat")
    public String chat(){
        return "chat";
    }
}
