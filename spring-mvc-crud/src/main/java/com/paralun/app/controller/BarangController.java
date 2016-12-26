/*
 * Copyright (c) 2016 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.controller;

import com.paralun.app.model.Barang;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BarangController {
    
    private final Map<String, Barang> map = new HashMap<>();
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        return "redirect:/barangs";
    }
    
    @RequestMapping(value = "/barangs", method = RequestMethod.GET)
    public String findAll(Model model) {
        List<Barang> list = new ArrayList<>();
        list.addAll(map.values());
        
        model.addAttribute("barang", list);
        
        return "list";
    }
    
    @RequestMapping(value = "/barangs/{kode}")
    public String find(@PathVariable("kode") String kode, Model model) {
        Barang barang = map.get(kode);
        
        model.addAttribute("barang", barang);
        
        return "detail";
    }
    
    @RequestMapping(value = "/barang", method = RequestMethod.POST)
    public String saveOrUpdate(@ModelAttribute("barang") Barang barang) {
        
        map.put(barang.getKode(), barang);
        
        return "redirect:/barangs";
    }
    
    @RequestMapping(value = "/barang/{kode}/delete", method = RequestMethod.POST)
    public String delete(@PathVariable("kode") String kode) {
        
        map.remove(kode);
        
        return "redirect:/barangs";
    }
    
    @RequestMapping(value = "/barang/{kode}/update", method = RequestMethod.GET)
    public String showFormUpdate(@PathVariable("kode") String kode, Model model) {
        Barang barang = map.get(kode);
        
        model.addAttribute("barang", barang);
        
        return "barangform";
    }
    
    @RequestMapping(value = "/barang/add", method = RequestMethod.GET)
    public String showFormAdd(Model model) {
        
        model.addAttribute("barang", new Barang());
        return "barangform";
    }
    
}
