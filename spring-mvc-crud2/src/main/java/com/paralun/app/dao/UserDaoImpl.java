/*
 * Copyright (c) 2017 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.dao;

import com.paralun.app.model.User;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.core.namedparam.SqlParameterSource;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

@Repository
public class UserDaoImpl implements UserDao {

    @Autowired
    private NamedParameterJdbcTemplate template;

    @Override
    public void save(User user) {
        String sql = "INSERT INTO USERS(NAME, EMAIL, ADDRESS, PASSWORD, NEWSLETTER, "
                + "FRAMEWORK, SEX, NUMBER, COUNTRY, SKILL) "
                + "VALUES ( :name, :email, :address, :password, :newsletter, "
                + ":framework, :sex, :number, :country, :skill)";
        template.update(sql, parameterSource(user));
    }

    @Override
    public void update(User user) {
        String sql = "UPDATE USERS SET NAME=:name, EMAIL=:email, ADDRESS=:address, " 
                + "PASSWORD=:password, NEWSLETTER=:newsletter, FRAMEWORK=:framework, "
                + "SEX=:sex, NUMBER=:number, COUNTRY=:country, SKILL=:skill WHERE id=:id";
        template.update(sql, parameterSource(user));
    }

    @Override
    public void delete(Integer id) {
        String sql = "DELETE FROM users WHERE id = :id";
        template.update(sql, new MapSqlParameterSource("id", id));
    }

    @Override
    public User findById(Integer id) {
        String sql = "SELECT * FROM users WHERE id = :id";
        User user = template.queryForObject(sql, new MapSqlParameterSource("id", id), new UserMapper());
        return user;
    }

    @Override
    public List<User> findAll() {
        String sql = "SELECT * FROM users";
        List<User> users = template.query(sql, new UserMapper());
        return users;
    }

    private SqlParameterSource parameterSource(User user) {
        MapSqlParameterSource paramSource = new MapSqlParameterSource();
        paramSource.addValue("id", user.getId());
        paramSource.addValue("name", user.getName());
        paramSource.addValue("email", user.getEmail());
        paramSource.addValue("address", user.getAddress());
        paramSource.addValue("password", user.getPassword());
        paramSource.addValue("newsletter", user.isNewsletter());
        paramSource.addValue("framework", convertListToDelimitedString(user.getFramework()));
        paramSource.addValue("sex", user.getSex());
        paramSource.addValue("number", user.getNumber());
        paramSource.addValue("country", user.getCountry());
        paramSource.addValue("skill", convertListToDelimitedString(user.getSkill()));

        return paramSource;
    }

    private String convertListToDelimitedString(List<String> list) {
        String result = "";
        if (list != null) {
            result = StringUtils.arrayToCommaDelimitedString(list.toArray());
        }
        return result;
    }
}
