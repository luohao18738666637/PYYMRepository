package com.lh.service;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lh.entity.FenyeUsers;
import com.lh.entity.Users;

public interface UsersMapperservice {
public int insertU(Users users);
public Integer denglu(Users users, HttpServletRequest request,HttpServletResponse response);
public Map<String,Object> select(FenyeUsers fneyeUsers);
}
