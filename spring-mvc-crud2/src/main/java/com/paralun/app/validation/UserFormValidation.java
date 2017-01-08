/*
 * Copyright (c) 2017 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.validation;

import com.paralun.app.model.User;
import com.paralun.app.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class UserFormValidation implements Validator {

    @Autowired
    @Qualifier("emailValidation")
    private EmailValidation emailValidation;
    
    @Autowired
    private UserService userService;

    @Override
    public boolean supports(Class<?> type) {
        return User.class.equals(type);
    }

    @Override
    public void validate(Object o, Errors errors) {
        User user = (User) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "NotEmpty.userForm.name");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "email", "NotEmpty.userForm.email");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "address", "NotEmpty.userForm.address");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmpty.userForm.password");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "confirmPassword", "NotEmpty.userForm.confirmPassword");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "sex", "NotEmpty.userForm.sex");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "country", "NotEmpty.userForm.country");

        if (!emailValidation.valid(user.getEmail())) {
            errors.rejectValue("email", "Pattern.userForm.email");
        }

        if (user.getNumber() == null || user.getNumber() <= 0) {
            errors.rejectValue("number", "NotEmpty.userForm.number");
        }

        if (user.getCountry().equalsIgnoreCase("none")) {
            errors.rejectValue("country", "NotEmpty.userForm.country");
        }

        if (!user.getPassword().equals(user.getConfirmPassword())) {
            errors.rejectValue("confirmPassword", "Diff.userform.confirmPassword");
        }

        if (user.getFramework() == null || user.getFramework().size() < 2) {
            errors.rejectValue("framework", "Valid.userForm.framework");
        }

        if (user.getSkill() == null || user.getSkill().size() < 3) {
            errors.rejectValue("skill", "Valid.userForm.skill");
        }
    }

}
