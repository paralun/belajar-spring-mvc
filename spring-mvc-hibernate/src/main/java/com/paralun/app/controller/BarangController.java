/*
 * Copyright (c) 2016 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.controller;

import com.paralun.app.model.Barang;
import com.paralun.app.service.BarangService;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class BarangController {
    
    @Autowired
    private BarangService service;
    
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        return "redirect:/barang/list";
    }
    
    @RequestMapping(value = "/barang/list")
    public String showAllBarang(Model model) {
        model.addAttribute("barang", service.findAllBarang());
        return "list-barang";
    }
    
    @RequestMapping(value = "/barang/edit/{id}", method = RequestMethod.GET)
    public String showBarang(@PathVariable("id") int id, Model model) {
        Barang barang = service.findBarang(id);
        model.addAttribute("barang", barang);
        return "barang-form";
    }
    
    @RequestMapping(value = "/barang/add", method = RequestMethod.GET)
    public String addBarang(Model model) {
        model.addAttribute("barang", new Barang());
        return "barang-form";
    }
    
    @RequestMapping(value = "/barang/add", method = RequestMethod.POST)
    public String saveOrUpdate(@ModelAttribute("barang") @Valid Barang barang, 
            BindingResult result, Model model) {
        if(result.hasErrors()) {
            return "barang-form";
        }else {
            service.saveOrUpdate(barang);
            model.addAttribute("css", "success");
            model.addAttribute("msg", "Barang added successfully");
            return "redirect:/barang/list";
        }
    }
    
    @RequestMapping(value = "/barang/delete/{id}")
    public String deleteBarang(@PathVariable("id") int id, Model model) {
        Barang barang = service.findBarang(id);
        if(barang == null) {
            model.addAttribute("css", "danger");
            model.addAttribute("msq", "Barang not found");
        }else {
            service.delete(barang);
            model.addAttribute("css", "success");
            model.addAttribute("msg", "Barang berhasil di hapus");
        }
        
        return "redirect:/barang/list";
    }
}
