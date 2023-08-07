package com.resourceblocker.entity;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "Users")
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private Integer sl_no;
	private String name;
	private String email;
	private String username;
	private String password;
	private String role;

	// New field for user type
	private String userType; // Add this field

	public User() {

	}

	public Integer getSl_no() {
		return sl_no;
	}

	public void setSl_no(Integer sl_no) {
		this.sl_no = sl_no;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRole() {
		return role;
	}

	public void setRole(String role) {
		this.role = role;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public User(Integer sl_no, String name, String email, String username, String password, String role,
			String userType) {
		super();
		this.sl_no = sl_no;
		this.name = name;
		this.email = email;
		this.username = username;
		this.password = password;
		this.role = role;
		this.userType = userType;
	}

	@Override
	public String toString() {
		return "User [sl_no=" + sl_no + ", name=" + name + ", email=" + email + ", username=" + username + ", password="
				+ password + ", role=" + role + "]";
	}

}
