/*
 * Copyright (c) 2016 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.dao;

import com.paralun.app.model.Barang;
import java.util.List;

public interface BarangDao {
    
    public void saveOrUpdate(Barang barang);
    public void delete(Barang barang);
    public Barang findBarang(int id);
    public List<Barang> findAllBarang();
}
