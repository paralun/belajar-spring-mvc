/*
 * Copyright (c) 2017 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.controller;

import com.paralun.app.model.User;
import com.paralun.app.service.UserService;
import com.paralun.app.validation.UserFormValidation;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class UserController {

    @Autowired
    UserFormValidation userFormValidation;

    @Autowired
    private UserService service;

    @InitBinder
    protected void initBinder(WebDataBinder binder) {
        binder.setValidator(userFormValidation);
    }

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String index(Model model) {
        return "redirect:/user/list";
    }

    @RequestMapping(value = "/user/list", method = RequestMethod.GET)
    public String findAllUser(Model model) {
        model.addAttribute("users", service.findAll());
        return "list-user";
    }

    @RequestMapping(value = "/user/add", method = RequestMethod.POST)
    public String saveOrUpdate(@ModelAttribute("userForm") @Validated User user,
            BindingResult result, Model model, final RedirectAttributes ra) {

        if (result.hasErrors()) {
            populateDefaultModel(model);
            return "user-form";
        } else {
            ra.addFlashAttribute("css", "success");
            if (user.isNew()) {
                ra.addFlashAttribute("msg", "User added successfully!");
            } else {
                ra.addFlashAttribute("msg", "User updated successfully!");
            }

            service.saveOrUpdate(user);
            return "redirect:/user/list";
        }
    }

    @RequestMapping(value = "/user/delete/{id}", method = RequestMethod.GET)
    public String deleteUser(@PathVariable("id") Integer id, final RedirectAttributes ra) {
        service.delete(id);
        ra.addFlashAttribute("css", "success");
        ra.addFlashAttribute("msg", "User is deleted!");
        return "redirect:/user/list";
    }

    @RequestMapping(value = "/user/add", method = RequestMethod.GET)
    public String addUser(Model model) {
        model.addAttribute("userForm", new User());
        populateDefaultModel(model);
        return "user-form";
    }

    @RequestMapping(value = "/user/edit/{id}", method = RequestMethod.GET)
    public String editUser(@PathVariable("id") Integer id, Model model) {
        User user = service.findById(id);
        model.addAttribute("userForm", user);
        populateDefaultModel(model);
        return "user-form";
    }

    @RequestMapping(value = "/user/find/{id}", method = RequestMethod.GET)
    public String showUser(@PathVariable("id") Integer id, Model model) {
        User user = service.findById(id);
        if (user == null) {
            model.addAttribute("css", "danger");
            model.addAttribute("msg", "User not found");
        }

        model.addAttribute("user", user);
        return "detail-user";
    }

    private void populateDefaultModel(Model model) {
        List<String> frameworksList = new ArrayList<>();
        frameworksList.add("Spring MVC");
        frameworksList.add("Struts 2");
        frameworksList.add("JSF 2");
        frameworksList.add("GWT");
        frameworksList.add("Play");
        frameworksList.add("Apache Wicket");
        model.addAttribute("frameworkList", frameworksList);

        Map<String, String> skill = new LinkedHashMap<>();
        skill.put("Hibernate", "Hibernate");
        skill.put("Spring", "Spring");
        skill.put("Struts", "Struts");
        skill.put("Groovy", "Groovy");
        skill.put("Grails", "Grails");
        model.addAttribute("javaSkillList", skill);

        List<Integer> numbers = new ArrayList<>();
        numbers.add(1);
        numbers.add(2);
        numbers.add(3);
        numbers.add(4);
        numbers.add(5);
        model.addAttribute("numberList", numbers);

        Map<String, String> country = new LinkedHashMap<>();
        country.put("US", "United Stated");
        country.put("CN", "China");
        country.put("SG", "Singapore");
        country.put("MY", "Malaysia");
        model.addAttribute("countryList", country);
    }
}
