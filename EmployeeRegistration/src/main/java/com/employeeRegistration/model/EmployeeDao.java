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

	/**
	 * Checks if a username already exists in the database.
	 *
	 * @param username The username to check for existence.
	 * @return `true` if the username exists, `false` otherwise.
	 * @throws DataAccessException If there is an issue with the database connection or the query execution.
	 */
	public boolean isUserNameExists(String username);

	/**
	 * Checks if a contact number already exists in the database.
	 *
	 * @param contact The contact number to check for existence.
	 * @return `true` if the contact number exists, `false` otherwise.
	 * @throws DataAccessException If there is an issue with the database connection or the query execution.
	 */
	public boolean isContactExists(String contact);

}