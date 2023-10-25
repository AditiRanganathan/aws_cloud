package com.example.aditi.model;

//import org.springframework.web.multipart.MultipartFile;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import jakarta.persistence.Transient;

@Entity
@Table(name="empinfo")
public class Employee {
	@Id
//	@GeneratedValue(strategy = GenerationType.AUTO)
	private int id;
	private String username;
	@Column(name="firstname")
	private String fname;
	@Column(name="lastname")
	private String lname;
	private int age;
	private String password;
	@Column(name="Department")
	private String dept;
	private String testUsername;
   

	public Employee()
	{
		
	}
	public Employee(int id, String username, String fname, String lname, int age, String password, String dept) {
		super();
		this.id=id;
		this.username = username;
		this.fname = fname;
		this.lname = lname;
		this.age = age;
		this.password = password;
		this.dept = dept;
	}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getFname() {
		return fname;
	}
	public void setFname(String fname) {
		this.fname = fname;
	}
	public String getLname() {
		return lname;
	}
	public void setLname(String lname) {
		this.lname = lname;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getDept() {
		return dept;
	}
	public void setDept(String dept) {
		this.dept = dept;
	}

	@Override
	public String toString() {
		return "UserInfo [id=" + id + ", username=" + username + ", fname=" + fname + ", lname=" + lname + ", age="
				+ age + ", password=" + password + ", dept=" + dept + "]";
	}
}
