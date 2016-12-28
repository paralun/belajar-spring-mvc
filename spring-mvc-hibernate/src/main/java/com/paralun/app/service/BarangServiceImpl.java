/*
 * Copyright (c) 2016 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.service;

import com.paralun.app.dao.BarangDao;
import com.paralun.app.model.Barang;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

@Service
@Transactional(readOnly = false)
public class BarangServiceImpl implements BarangService {
    
    @Autowired
    private BarangDao dao;

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void saveOrUpdate(Barang barang) {
        dao.saveOrUpdate(barang);
    }

    @Override
    @Transactional(readOnly = false, propagation = Propagation.REQUIRED)
    public void delete(Barang barang) {
        dao.delete(barang);
    }

    @Override
    public Barang findBarang(int id) {
        return dao.findBarang(id);
    }

    @Override
    public List<Barang> findAllBarang() {
        return dao.findAllBarang();
    }
}
