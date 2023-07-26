package com.employeeRegistration.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.Statement;

import com.employeeRegistration.model.constant.Constant;

/**
 * This class is an implementation of the EmployeeDao class and extends the Constant class to access static variables.
 * 
 * @author ChankitSharma
 */
public class EmployeeDaoImpl extends Constant implements EmployeeDao {

	private Connection connection;
	private Statement statement;

	@Override
	public void connectionDB() {

		try {
			Class.forName(DB_CLASSFORNAME);
			connection = DriverManager.getConnection(DB_URL,DB_USERNAME,DB_PASSWORD);
			statement = connection.createStatement();
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}

	@Override
	public void saveRegistration(String firstname, String lastname, String username, String password, String address,
			String contact) {

		try {
			statement.executeUpdate("insert into employee values('" + firstname + "','" + lastname + "','" + username
					+ "','" + password + "','" + address + "','" + contact + "')");
		} catch (Exception exception) {
			exception.printStackTrace();
		}
	}

}