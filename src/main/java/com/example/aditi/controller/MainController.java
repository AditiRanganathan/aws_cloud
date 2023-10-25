package com.example.aditi.controller;

import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import jakarta.servlet.http.Cookie;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;

import com.example.aditi.model.Employee;
import com.example.aditi.service.EmpService;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;


@Controller
public class MainController {
	@Autowired
    private ServletContext servletContext;
	@Autowired
	private EmpService es;
	
	@RequestMapping("/home")
	public String home(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "homepage";
	}
	
	@RequestMapping("/register")
	public String register(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_REGISTER");
		return "homepage";
	}
	
	@RequestMapping("/login")
	public String loginUser(HttpServletRequest request) {
		request.setAttribute("mode", "MODE_LOGIN");
		
		return "homepage";
		
	}
	
	@PostMapping("/save-user")
	public String registerUser(@ModelAttribute Employee emp, BindingResult bindingResult, HttpServletRequest request) {
		es.saveMydata(emp);
		request.setAttribute("mode", "MODE_LOGIN");
		return "homepage";
	}
	
	@GetMapping("/show-users")
	public String showAllUsers(HttpServletRequest request) {
		request.setAttribute("users", es.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "homepage";
	}
	
	@RequestMapping("/delete-user")
	public String deleteMyUser(@RequestParam int id, HttpServletRequest request) {
		es.deleteUser(id);
		request.setAttribute("users", es.showAllUsers());
		request.setAttribute("mode", "ALL_USERS");
		return "homepage";
	}
	
	@RequestMapping("/edit-user")
	public String editUser(@RequestParam int id,HttpServletRequest request) {
		;
		request.setAttribute("user", es.editUser(id));
		request.setAttribute("mode", "MODE_UPDATE");
		return "homepage";
	}
	

}
