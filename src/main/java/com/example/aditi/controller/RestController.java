package com.example.aditi.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import com.example.aditi.model.Employee;
import com.example.aditi.service.EmpService;


@org.springframework.web.bind.annotation.RestController
public class RestController {

	@Autowired
	private EmpService es;
	@GetMapping("/")
	public String hello()
	{
		return "this is homepage";
	}
	
	@GetMapping("/saveuser")
	public String saveUser(@RequestParam int id,@RequestParam String username,@RequestParam String fname,@RequestParam String lname,@RequestParam int age,@RequestParam String password, @RequestParam String dept)
	{	
		Employee e=new Employee(id,username,fname,lname,age,password,dept);
		es.saveMydata(e);
		return "User Saved";
	}
}
