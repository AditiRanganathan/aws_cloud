package com.example.aditi.servlets;

import java.io.IOException;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;

import com.example.aditi.controller.MainController;
import com.example.aditi.model.Employee;
import com.example.aditi.service.EmpService;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/signInServlet")
public class SignInServlet extends HttpServlet {
	
	
	@Autowired
	private EmpService service;

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException
	{
		String name=req.getParameter("username");
		String password=req.getParameter("password");
		System.out.println("hi aditi");

		Optional<Employee> opt= service.login(name,password);
		RequestDispatcher rd1=req.getRequestDispatcher("WEB-INF/view/homepage.jsp");
		RequestDispatcher rd2=req.getRequestDispatcher("WEB-INF/view/AuthFailure.jsp");
		if(opt.isPresent()) {
			req.setAttribute("mode", "MODE_HOME");

			rd1.forward(req, res);
		
		}
		
		else {
			rd2.forward(req, res);
		}
	}
	
}
