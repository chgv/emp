package com.bryce.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bryce.dao.IEmployeeDao;
import com.bryce.model.Employee;

@Service("commonService")
public class EmployeeService implements IEmployeeService{

	@Autowired
	private IEmployeeDao employeeDao;

	public List<Employee> findEmployeeByDate(String date) {
		return employeeDao.findEmployeeByDate(date);
	}

}
