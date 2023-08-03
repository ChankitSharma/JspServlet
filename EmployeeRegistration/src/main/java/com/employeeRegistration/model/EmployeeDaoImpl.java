package com.employeeRegistration.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.employeeRegistration.model.constant.Constant;

/**
 * This class is an implementation of the EmployeeDao class and extends the
 * Constant class to access static variables.
 * 
 * @author ChankitSharma
 */
public class EmployeeDaoImpl extends Constant implements EmployeeDao {

	private Connection connection;
	private PreparedStatement preparedStatement;

	@Override
	public void connectionDB() {
		try {
			Class.forName(DB_CLASSFORNAME);
			connection = DriverManager.getConnection(DB_URL, DB_USERNAME, DB_PASSWORD);
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}

	@Override
	public void saveRegistration(String firesultSettname, String lastname, String username, String password,
			String address, String contact) {
		try {
			String query = "INSERT INTO employee (firstname, lastname, username, password, address, contact) VALUES (?, ?, ?, ?, ?, ?)";
			preparedStatement = connection.prepareStatement(query);
			preparedStatement.setString(1, firesultSettname);
			preparedStatement.setString(2, lastname);
			preparedStatement.setString(3, username);
			preparedStatement.setString(4, password);
			preparedStatement.setString(5, address);
			preparedStatement.setString(6, contact);

			preparedStatement.executeUpdate();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}

	@Override
	public boolean isUserNameExists(String username) {
		try {
			String checkQuery = "SELECT username FROM employee WHERE username = ?";
			preparedStatement = connection.prepareStatement(checkQuery);
			preparedStatement.setString(1, username);
			ResultSet resultSet = preparedStatement.executeQuery();
			return resultSet.next();
		} catch (Exception exception) {
			exception.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean isContactExists(String contact) {
		try {
			String checkQuery = "SELECT contact FROM employee WHERE contact = ?";
			preparedStatement = connection.prepareStatement(checkQuery);
			preparedStatement.setString(1, contact);
			ResultSet resultSet = preparedStatement.executeQuery();
			return resultSet.next();
		} catch (Exception exception) {
			exception.printStackTrace();
			return false;
		}
	}

}