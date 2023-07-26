package com.employeeRegistration.model;

/**
 * This interface is adding another layer to secure our code.
 * 
 * @author ChankitSharma
 */
public interface EmployeeDao {

	/*
	 * Establishes a connection to the database. This method should be called before
	 * performing any database operations.
	 */
	public void connectionDB();

	/*
	 * Saves employee registration details to the database.
	 * 
	 * @param firstname The first name of the employee.
	 * @param lastname The last name of the employee.
	 * @param username The username of the employee.
	 * @param password The password of the employee.
	 * @param address The address of the employee.
	 * @param contact The contact number of the employee.
	 * @throws DataAccessException If there is an issue with the database connection
	 * or the data saving process.
	 */
	public void saveRegistration(String firstname, String lastname, String username, String password, String address,
			String contact);

}