package com.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.Entity.TodoDetls;
import com.mysql.cj.protocol.Resultset;

public class TodoDAO {

	private Connection conn;

	public TodoDAO(Connection conn) {
		super();
		this.conn = conn;
	}

	public boolean addTodo(String name, String todo, String status) {

		boolean f = false;
		try {
			String sql = "insert into todos(Name,Todo,Status) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, name);
			ps.setString(2, todo);
			ps.setString(3, status);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}

	public List<TodoDetls> getTodo() {
		List<TodoDetls> list = new ArrayList<TodoDetls>();
		TodoDetls t = null;

		try {

			String sql = "select * from todos";
			PreparedStatement ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				t = new TodoDetls();
				t.setId(rs.getInt(1));
				t.setName(rs.getString(2));
				t.setTodo(rs.getString(3));
				t.setStatus(rs.getString(4));
				list.add(t);
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;

	}
	
	public TodoDetls getTodoById(int id) {
		
		TodoDetls t=null;
		
		try {
			String sql ="select * from todos where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				t=new TodoDetls();
				t.setId(rs.getInt(1));
				t.setName(rs.getString(2));
				t.setTodo(rs.getString(3));
				t.setStatus(rs.getString(4));
			}
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return t;
		
	}
	
	public boolean updateTodo(TodoDetls t) {
		boolean f=false;
		try {
			String sql ="update todos set Name=?,Todo=?,Status=? where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setString(1,t.getName());
			ps.setString(2,t.getTodo());
			ps.setString(3,t.getStatus());
			ps.setInt(4,t.getId());
			
			int i= ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
	public boolean deleteToso(int id) {
		
		boolean f=false;
		try {
			String sql = "delete from todos where id=?";
			PreparedStatement ps=conn.prepareStatement(sql);
			ps.setInt(1, id);
			
			int i = ps.executeUpdate();
			if(i==1) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
	public boolean addUser(String username, String password, String mobile) {

		boolean f = false;
		try {
			String sql = "insert into user(UserName,Password,Mobile) values(?,?,?)";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, username);
			ps.setString(2, password);
			ps.setString(3, mobile);

			int i = ps.executeUpdate();
			if (i == 1) {
				f = true;
			}

		} catch (Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	
public boolean getUserDtls(String username,String password) {
		
		boolean f=false;
		try {
			String sql = "SELECT * FROM user where username='"+username+"' and password='"+password+"'";
			PreparedStatement ps = conn.prepareStatement(sql);
			
            ResultSet rs = ps.executeQuery();
			
			while(rs.next()) {
				f=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return f;
		
	}
}
