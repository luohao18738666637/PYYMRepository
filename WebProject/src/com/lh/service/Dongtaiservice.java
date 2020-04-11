package com.lh.service;

import java.util.List;
import java.util.Map;

import com.lh.entity.Dongtai;
import com.lh.entity.Fenyedt;

public interface Dongtaiservice {
public List<Dongtai> selectDT(Dongtai dongtai);
public Integer updateDT(Dongtai dongtai);
}
