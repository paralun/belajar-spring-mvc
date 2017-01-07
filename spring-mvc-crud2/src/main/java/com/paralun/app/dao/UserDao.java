/*
 * Copyright (c) 2017 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.dao;

import com.paralun.app.model.User;
import java.util.List;

public interface UserDao {
    
    public void save(User user);
    public void update(User user);
    public void delete(Integer id);
    public User findById(Integer id);
    public List<User> findAll();
}
