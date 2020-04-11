package com.lh.dao;

import java.util.List;

import com.lh.entity.Data;
import com.lh.entity.FenyeData;

public interface DataMapper {
	/**
	 * 	
	 * @param fneyeData
	 * @return
	 */
List<Data> selectData(FenyeData fneyeData);
/**
 * 
 * @param fneyeData
 * @return
 */
Integer selectDatacount(FenyeData fneyeData);
/**
 * 
 * @param sid
 * @return
 */
List<Data> selectDatabySid(Integer sid);
/**
 * 
 * @param data
 * @return
 */
Integer insertData(Data data);
/**
 * 
 * @param dataid
 * @return
 */
Integer deleteDatabyId(Integer dataid);




}
