package com.lh.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lh.dao.StudentsMapper;
import com.lh.entity.Dongtai;
import com.lh.entity.Fenyedt;
@Service
public class DongtaiserviceImp implements Dongtaiservice{
	@Resource
	private StudentsMapper studentsMapper;
	@Override
	public List<Dongtai> selectDT(Dongtai dongtai) {
		// TODO Auto-generated method stub
		
		List<Dongtai> list=studentsMapper.selectDT(dongtai); 
	
		return list;
	}

	@Override
	public Integer updateDT(Dongtai dongtai) {
		// TODO Auto-generated method stub
		return studentsMapper.updateDt(dongtai);
	}

}
