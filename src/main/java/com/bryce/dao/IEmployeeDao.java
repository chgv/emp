package com.bryce.dao;

import java.util.List;

import com.bryce.model.Employee;

public interface IEmployeeDao {

	public List<Employee> findEmployeeByDate(String date1);

}
