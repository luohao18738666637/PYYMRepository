package com.lh.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.lh.dao.DataMapper;
import com.lh.entity.Data;
import com.lh.entity.FenyeData;


@Service
public class DataServiceImp implements DataService {

	@Resource
	private DataMapper dataMapper;
	@Resource
	private FenyeData fenyeData;
	
	@Override
	public FenyeData selectdataAll(FenyeData fenyeData) {
		List<Data> list =dataMapper.selectData(fenyeData);
		Integer total =dataMapper.selectDatacount(fenyeData);
		fenyeData.setRows(list);
		fenyeData.setTotal(total);
		return fenyeData;
	}

	@Override
	public List<Data> selectdatabySid(Integer sid) {
	
		return dataMapper.selectDatabySid(sid);
	}

	@Override
	public Integer deletedatabyId(Integer dataid) {
	
		return dataMapper.deleteDatabyId(dataid);
	}

	@Override
	public Integer insertData(Data data) {
		
		return dataMapper.insertData(data);
	}



}
