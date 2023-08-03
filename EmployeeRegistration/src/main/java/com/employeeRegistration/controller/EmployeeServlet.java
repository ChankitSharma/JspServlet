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
 * This servlet handles employee registration and username/contact availability
 * checks. It interacts with the EmployeeDao interface to perform database
 * operations.
 * 
 * @Author ChankitSharma
 */
@WebServlet("/employeeRegistration")
public class EmployeeServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public EmployeeServlet() {
		super();
	}

	/**
	 * Handles GET requests to check the availability of a username and contact. It
	 * receives username and contact parameters and uses the EmployeeDao
	 * implementation to check if they already exist in the database. Sends a JSON
	 * response indicating whether the username and contact exist or not.
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String username = request.getParameter("username");
		String contact = request.getParameter("contact");
		EmployeeDao service = new EmployeeDaoImpl();
		service.connectionDB();

		boolean exists = service.isUserNameExists(username);
		boolean contactExist = service.isContactExists(contact);

		// Return JSON response indicating whether the username exists or not
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");
		response.getWriter().write("{\"exists\": " + exists + ", \"contactExist\": " + contactExist + "}");
	}

	/**
	 * Handles POST requests for employee registration. It receives registration
	 * details, checks if the username and contact already exist, and either
	 * forwards the user to an error page or saves the registration data to the
	 * database.
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String firstname = request.getParameter("firstname");
		String lastname = request.getParameter("lastname");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String address = request.getParameter("address");
		String contact = request.getParameter("contact");

		EmployeeDao service = new EmployeeDaoImpl();
		service.connectionDB();

		// Check if mobile number exists
		boolean contactExists = service.isContactExists(contact);
		boolean usernameExists = service.isUserNameExists(username);

		if (contactExists || usernameExists) {
			if (contactExists) {
				request.setAttribute("errorMessage", "*Mobile no is already exists");
			}
			if (usernameExists) {
				request.setAttribute("errorMessage1", "*Username is already exists");
			}
			request.getRequestDispatcher("employeeRegistration.jsp").forward(request, response);
		} else {
			service.saveRegistration(firstname, lastname, username, password, address, contact);
			request.setAttribute("contact", contact);
			request.setAttribute("username", username);
			request.getRequestDispatcher("WEB-INF/welcome.jsp").forward(request, response);
		}
	}

}