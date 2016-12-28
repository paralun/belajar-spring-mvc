/*
 * Copyright (c) 2016 | James Kusmambang
 * Source : https://github.com/paralun
 */
package com.paralun.app.model;

import java.io.Serializable;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Min;
import org.hibernate.validator.constraints.NotEmpty;

@Entity
@Table(name = "t_barang")
public class Barang implements Serializable {
    
    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Integer id;
    
    @Column(name = "kode_brg", unique = true, nullable = false, length = 10)
    @NotEmpty
    private String kodeBrg;
    
    @Column(name = "nama_brg", length = 50)
    @NotEmpty
    private String namaBrg;
    
    @Column(name = "kategori")
    private String kategori;
    
    @Column(name = "harga_brg")
    @Min(value = 0)
    private Long harga;
    
    @Column(name = "stok_brg")
    @Min(value = 1)
    private Integer stok;

    public Barang() {
    }

    public Barang(String kodeBrg, String namaBrg, String kategori, Long harga, Integer stok) {
        this.kodeBrg = kodeBrg;
        this.namaBrg = namaBrg;
        this.kategori = kategori;
        this.harga = harga;
        this.stok = stok;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getKodeBrg() {
        return kodeBrg;
    }

    public void setKodeBrg(String kodeBrg) {
        this.kodeBrg = kodeBrg;
    }

    public String getNamaBrg() {
        return namaBrg;
    }

    public void setNamaBrg(String namaBrg) {
        this.namaBrg = namaBrg;
    }

    public String getKategori() {
        return kategori;
    }

    public void setKategori(String kategori) {
        this.kategori = kategori;
    }

    public Long getHarga() {
        return harga;
    }

    public void setHarga(Long harga) {
        this.harga = harga;
    }

    public Integer getStok() {
        return stok;
    }

    public void setStok(Integer stok) {
        this.stok = stok;
    }
}
