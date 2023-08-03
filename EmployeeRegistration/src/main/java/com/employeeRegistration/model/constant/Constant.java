package com.employeeRegistration.model.constant;

/**
 * This class defines constant values for database configuration.
 * It provides values for database URL, username, password, and driver class name.
 * Modify these constants as needed for your specific database configuration.
 * <p>
 * Note: We have to keep sensitive information like passwords in a more secure way,
 * such as using environment variables or encryption, especially in production environments.
 * </p>
 * @Author ChankitSharma
 */
public class Constant {

	public static final String DB_URL = "jdbc:mysql://localhost:3306/registration";
	public static final String DB_USERNAME = "root";
	public static final String DB_PASSWORD = "test";
	public static final String DB_CLASSFORNAME = "com.mysql.cj.jdbc.Driver";

}