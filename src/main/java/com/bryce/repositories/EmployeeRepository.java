package com.bryce.repositories;

import org.springframework.data.jpa.repository.JpaRepository;

import com.bryce.model.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Long>{

}
