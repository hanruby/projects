package com.eatifying.server.service;

import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.eatifying.commons.domain.Employee;
import com.eatifying.dao.EmployeeMapper;
import com.mysql.jdbc.Connection;
import com.mysql.jdbc.Statement;

@Service
public class EmployeeService {

	@Autowired
	private EmployeeMapper employeeMapper;

	// public void setEmployeeMapper(EmployeeMapper employeeMapper) {
	// this.employeeMapper = employeeMapper;
	// }

	// public void setEmployeeMapper(EmployeeMapper employeeMapper) {
	// this.employeeMapper = employeeMapper;
	// }

	public List<Employee> getEmployeeList() {
		System.out.println("In service");
		System.out.println("EmployeeMapper : " + employeeMapper);
		List<Employee> employee = employeeMapper.getEmployeeList();

		for (Employee emp : employee) {
			System.out.println(emp.getFirstName());
		}

		return employeeMapper.getEmployeeList();
	}

	public void getEmployeeList1() {
		System.out.println("In service");
		System.out.println("EmployeeMapper : " + employeeMapper);
		List<Employee> employee = employeeMapper.getEmployeeList();

		for (Employee emp : employee) {
			System.out.println(emp.getFirstName());
		}

	}

	public void getEmployee() {
		String dbtime;
		String dbUrl = "jdbc:mysql://localhost:3306/test";
		String dbClass = "com.mysql.jdbc.Driver";
		String query = "Select * FROM employee";

		try {

			Class.forName("com.mysql.jdbc.Driver");
			Connection con = (Connection) DriverManager.getConnection(dbUrl);
			Statement stmt = (Statement) con.createStatement();
			ResultSet rs = stmt.executeQuery(query);

			while (rs.next()) {
				dbtime = rs.getString(1);
				System.out.println(dbtime);
				String name = rs.getString(2);
				System.out.println(name);
			} // end while

			con.close();
		} // end try

		catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		catch (SQLException e) {
			e.printStackTrace();
		}

	}
}
