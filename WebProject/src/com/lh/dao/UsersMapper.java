package com.lh.dao;

import java.util.List;

import com.lh.entity.FenyeUsers;
import com.lh.entity.Modules;
import com.lh.entity.Node;
import com.lh.entity.Roles;
import com.lh.entity.Userroles;
import com.lh.entity.Users;

public interface UsersMapper {
	/**
	 * ��������ѯ�û���Ϣ
	 * @param fenyeUsers
	 * @return
	 */
List<Users> selectUsers(FenyeUsers fenyeUsers);

/**
 * ��������ѯ�û���Ϣ������
 */
Integer selectcount(FenyeUsers fenyeUsers);
/**
 * �޸��û���Ϣ
 * @param users
 * @return
 */
Integer updateusers(Users users);

/**
 * ɾ���û���Ϣ
 * @param uid
 * @return
 */
Integer deleteusers(Integer uid);
/**
 * ����û���Ϣ
 * @param users
 * @return
 */
Integer insertusers(Users users);
/**
 * �����û����Ʋ�ѯ�û���Ϣ
 * 
 * 
 */
Users selectU(String uname);
/**
 *�����û�id��ѯ�������Ȼ����ʾ���ܹ������ģ�� 
 */


/**
 * ��ѯ���н�ɫ
 * @return
 */
List<Roles> selectRolesAll();
/**
 * ��ѯ���û��Ľ�ɫ
 */
List<Roles> selectUserRoles(String uid);
/**
 * �����û����һ����ɫ
 * @return
 */
Integer insertUserRoles(Userroles userroles);
/**
 * ɾ�����û���һ����ɫ
 * @return
 */
Integer deleteUserRoles(Userroles userroles);
/**
 * ��ѯ�����û����û������˺ţ�
 * @return
 */
List<Users> selectUserUname();
/**
 * �޸��û�����
 */
Integer updateUpassword(Users users);
/**
 * ��ѯ�û���Ӧ�Ľ�ɫid
 * 
 */
List<Userroles> selectByuid(Integer uid);
/**
 * ǩ��
 */
Integer updateQiantui(Users users);
/*
 * ǩ��
 */
Integer updateQiandao(Users users);
/*
 * 
 * ǩ��
 */
Integer qiantuiall(Integer qiandao);
/*
 * �Զ�����
 */
List<Userroles> selectzxsid();
/*
 * �����û���Ϣ
 */
Users selectWanshan(String uname);
/*
 * �����û�
 */
Integer updatesuoding(Users users);
/*
 * ��½����
 */
Integer updatecishu(Users users);
/*
 * ���Ƹ�����Ϣ
 */
Integer updategerenxx(Users users);
}

