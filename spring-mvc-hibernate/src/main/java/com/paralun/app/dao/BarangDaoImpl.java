/*
 * Copyright (c) 2016 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.dao;

import com.paralun.app.model.Barang;
import java.util.List;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BarangDaoImpl implements BarangDao {
    
    @Autowired
    private SessionFactory sessionFactory;

    @Override
    public void saveOrUpdate(Barang barang) {
        sessionFactory.getCurrentSession().saveOrUpdate(barang);
    }

    @Override
    public void delete(Barang barang) {
        sessionFactory.getCurrentSession().delete(barang);
    }

    @Override
    public Barang findBarang(int id) {
        return (Barang) sessionFactory.getCurrentSession()
                .createQuery("from Barang where id = :id")
                .setParameter("id", id);
    }

    @Override
    public List<Barang> findAllBarang() {
        return sessionFactory.getCurrentSession()
                .createQuery("from Barang")
                .list();
    }
}
