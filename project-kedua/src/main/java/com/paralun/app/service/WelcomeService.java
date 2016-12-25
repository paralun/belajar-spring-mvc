/*
 * Copyright (c) 2016 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.service;

import org.springframework.stereotype.Service;

@Service
public class WelcomeService {
    
    public String getMsg(String nama) {
        return "Hallo " + nama;
    }
    
    public String getTitle() {
        return "Belajar Spring MVC";
    }
}
