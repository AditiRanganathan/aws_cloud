package com.example.aditi.repository;

import java.util.Optional;

import org.springframework.data.repository.CrudRepository;

import com.example.aditi.model.Employee;

public interface EmpRepo extends CrudRepository<Employee,Integer>{
 Optional<Employee> findByUsernameAndPassword(String username, String password);
}
