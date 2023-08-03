package com.employeeRegistration.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.employeeRegistration.model.EmployeeDao;
import com.employeeRegistration.model.EmployeeDaoImpl;

/**
 * This servlet handles the checking of username availability. It receives a
 * username parameter via POST request and responds with "exists" if the
 * username is already taken, or "available" if it's not.
 * 
 * @Author ChankitSharma
 */

@WebServlet("/checkUsernameServlet")
public class CheckUsernameServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckUsernameServlet() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

	/**
	 * Handles POST requests to check the availability of a username. It receives a
	 * username parameter from the request and uses the EmployeeDao implementation
	 * to check if the username already exists in the database. Sends a response
	 * indicating whether the username is "exists" or "available".
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		EmployeeDao service = new EmployeeDaoImpl();
		service.connectionDB();
		if (service.isUserNameExists(username)) {
			response.getWriter().write("exists");
		} else {
			response.getWriter().write("available");
		}
	}

}