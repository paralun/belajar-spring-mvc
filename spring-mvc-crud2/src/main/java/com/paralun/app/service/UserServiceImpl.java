/*
 * Copyright (c) 2017 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.service;

import com.paralun.app.dao.UserDao;
import com.paralun.app.model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional
public class UserServiceImpl implements UserService {
    
    @Autowired
    private UserDao dao;

    @Override
    public void saveOrUpdate(User user) {
        
        if(user.getId() == null) {
            dao.save(user);
        }else{
            dao.update(user);
        }
        
    }

    @Override
    public void delete(Integer id) {
        dao.delete(id);
    }

    @Override
    public User findById(Integer id) {
        return dao.findById(id);
    }

    @Override
    public List<User> findAll() {
        return dao.findAll();
    }
    
}
