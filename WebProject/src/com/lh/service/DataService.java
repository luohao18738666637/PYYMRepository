package com.lh.service;

import java.util.List;

import com.lh.entity.Data;
import com.lh.entity.FenyeData;

public interface DataService {
FenyeData selectdataAll(FenyeData fenyeData);

List<Data> selectdatabySid(Integer sid);

Integer deletedatabyId(Integer dataid);
Integer insertData(Data data);


}
