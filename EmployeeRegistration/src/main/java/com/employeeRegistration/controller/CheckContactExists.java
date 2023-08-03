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
 * This servlet handles the checking of contact number availability.
 * It receives a contact number parameter via POST request and responds with
 * "exists" if the contact number is already associated with an account,
 * or "available" if it's not.
 * 
 * @Author ChankitSharma
 */

@WebServlet("/checkContactExists")
public class CheckContactExists extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CheckContactExists() {
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

	 /**
     * Handles POST requests to check the availability of a contact number.
     * It receives a contact number parameter from the request and uses the EmployeeDao
     * implementation to check if the contact number already exists in the database.
     * Sends a response indicating whether the contact number is "exists" or "available".
     */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String contact = request.getParameter("contact");
		EmployeeDao service = new EmployeeDaoImpl();
		service.connectionDB();
		if (service.isContactExists(contact)) {
			response.getWriter().write("exists");
		} else {
			response.getWriter().write("available");
		}
	}

}