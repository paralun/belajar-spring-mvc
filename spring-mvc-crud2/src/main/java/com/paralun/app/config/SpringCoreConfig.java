/*
 * Copyright (c) 2017 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.config;

import javax.sql.DataSource;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.jdbc.core.namedparam.NamedParameterJdbcTemplate;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.transaction.annotation.EnableTransactionManagement;

@Configuration
@EnableTransactionManagement
@ComponentScan(basePackages = "com.paralun.app")
@PropertySource(value = "classpath:jdbc.proprties")
public class SpringCoreConfig {
    
    @Autowired
    private Environment env;
    
    @Bean
    public DataSource dataSource() {
        DriverManagerDataSource source = new DriverManagerDataSource();
        source.setDriverClassName(env.getRequiredProperty("jdbc.driver"));
        source.setUrl(env.getRequiredProperty("jdbc.url"));
        source.setUsername(env.getRequiredProperty("jdbc.user"));
        source.setPassword(env.getRequiredProperty("jdbc.pass"));
        return source;
    }
    
    @Bean
    @Autowired
    public NamedParameterJdbcTemplate jdbcTemplate(DataSource dataSource) {
        return new NamedParameterJdbcTemplate(dataSource);
    }
    
    @Bean
    @Autowired
    public DataSourceTransactionManager transactionManager(DataSource source) {
        DataSourceTransactionManager trx = new DataSourceTransactionManager(source);
        return trx;
    }
}
