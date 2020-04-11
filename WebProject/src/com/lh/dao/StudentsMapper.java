package com.lh.dao;

import java.util.List;

import com.lh.entity.Dongtai;
import com.lh.entity.FenyeStu;
import com.lh.entity.Fenyedt;
import com.lh.entity.Students;
import com.lh.entity.Users;

public interface StudentsMapper {
List<Students> selectAll(FenyeStu fenyeStu);
Integer selectNum(FenyeStu fenyeStu);
Integer deleteStu(Integer sid);
List<Users> selectU();
Integer insertStu(Students students);
Integer updateStu(Students students);
List<Students> sssssss(List<Integer> list);
Users selectUExecl(Integer uid);
List<Students> selectFenpeik(FenyeStu fenyeStu);
Integer selectFenpei(FenyeStu fenyeStu);
List<Users> selectUU();
Integer updateFenpei(Students students);
Integer insertDT(Dongtai dongtai);
List<Dongtai> selectDT(Dongtai dongtai);
List<Dongtai> selectDDTT(Integer zxsid);
Integer updateDt(Dongtai dongtai);
List<Students> selectyijianfenpei();
}
