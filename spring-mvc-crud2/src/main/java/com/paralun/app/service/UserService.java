/*
 * Copyright (c) 2017 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.service;

import com.paralun.app.model.User;
import java.util.List;

public interface UserService {
    
    public void saveOrUpdate(User user);
    public void delete(Integer id);
    public User findById(Integer id);
    public List<User> findAll();
}
