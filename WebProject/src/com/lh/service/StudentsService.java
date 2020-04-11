package com.lh.service;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.lh.entity.FenyeStu;
import com.lh.entity.Students;

public interface StudentsService {
public Map<String,Object> select(FenyeStu fenyeStu);
public Integer delete(Integer sid);
public Integer insertStu(Students students);
public Integer updateStu(Students students);
public void daochuexcel(HttpServletRequest request, HttpServletResponse response, String sid) throws IOException;
public Map<String,Object> selectFenPei(FenyeStu fenyeStu);
}
