/*
 * Copyright (c) 2016 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.controller;

import com.paralun.app.service.WelcomeService;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class WelcomeController {
    
    private final WelcomeService service;

    @Autowired
    public WelcomeController(WelcomeService service) {
        this.service = service;
    }
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Map<String, Object> model) {
        model.put("title", service.getTitle());
        model.put("msg", service.getMsg("Bambang"));
        return "index";
    }
    
    @RequestMapping(value = "/hallo/{nama}", method = RequestMethod.GET)
    public ModelAndView hello(@PathVariable("nama") String nama) {
        ModelAndView model = new ModelAndView();
        model.setViewName("index");
        
        model.addObject("title", service.getTitle());
        model.addObject("msg", service.getMsg(nama));
        
        return model;
    }
}
