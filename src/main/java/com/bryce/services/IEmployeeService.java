package com.bryce.services;

import java.util.List;

import com.bryce.model.Employee;

public interface IEmployeeService {

	public List<Employee> findEmployeeByDate(String date1);

}
