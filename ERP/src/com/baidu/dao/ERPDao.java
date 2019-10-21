package com.baidu.dao;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Repository;

import com.baidu.entity.Dept;
import com.baidu.entity.User;

@Repository(value="dao")
public class ERPDao {

	@Autowired
	JdbcTemplate jdbcT;
	
	/**
	 * 验证用户名和密码
	 */
	public User loginCheckDao(User user) {
		String sql = "select * from tbl_emp where username = '"+user.getUserName()+"' and pwd = '"+user.getPwd()+"'";
		RowMapper<User> row = new BeanPropertyRowMapper<User>(User.class);
		User user1 = jdbcT.queryForObject(sql, row);
		
		return user1;
	}
	/**
	 * 查询所有部门数据
	 */
	public List<Dept> findDeptList(String name ,String tele){
		StringBuilder str = new StringBuilder("select * from tbl_dept where ");
		if((name == null && tele == null) || ("".equals(name) && "".equals(tele))) {
			str.append(" 1 = 1");
		}else if(!"".equals(name) && "".equals(tele)) {
			str.append("name like '%");
			str.append(name);
			str.append("%'");
		}else if("".equals(name) && !"".equals(tele)) {
			str.append("tele like '%");
			str.append(tele);
			str.append("%'");
		}else if(!"".equals(name) && !"".equals(tele)) {
			str.append("name like '%");
			str.append(name);
			str.append("%'");
			str.append(" and ");
			str.append("tele like '%");
			str.append(tele);
			str.append("%'");
		}
		
		RowMapper<Dept> row = new BeanPropertyRowMapper<Dept>(Dept.class);
		List<Dept> list = jdbcT.query(str.toString(), row);
		return list;
	}
	/**
	 * 删除
	 * @param uuid
	 * @return
	 */
	public int deleteDeptByUuid(String uuid) {
		// TODO Auto-generated method stub
		String sql = "delete from tbl_dept where uuid = "+uuid;
		return  jdbcT.update(sql);
	}
	/**
	 * 添加
	 * @param name
	 * @param tele
	 * @return
	 */
	public int addDept(String name, String tele) {
		// TODO Auto-generated method stub
		String sql = "insert into tbl_dept(name,tele) values('"+name+"','"+tele+"')";
		return jdbcT.update(sql);
	}
	/**
	 * 根据uuid查询数据
	 * @param uuid
	 * @return
	 */
	public Dept findDeptByUuid(String uuid) {
		// TODO Auto-generated method stub
		String sql = "select * from tbl_dept where uuid = "+uuid;
		RowMapper<Dept> row = new BeanPropertyRowMapper<>(Dept.class);
		Dept dept = jdbcT.queryForObject(sql,row);
		return dept;
	}
	public int updateDept(String uuid, String name, String tele) {
		// TODO Auto-generated method stub
		String sql = "update tbl_dept set name = '"+name+"',tele = '"+tele+"' where uuid ="+uuid;
		return jdbcT.update(sql);
	}
	
}
