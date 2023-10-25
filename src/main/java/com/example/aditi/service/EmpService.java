package com.example.aditi.service;
import org.springframework.util.StringUtils;
import java.util.List;
import java.util.Optional;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;
import java.util.ArrayList;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.example.aditi.model.Employee;
import com.example.aditi.repository.EmpRepo;
import jakarta.transaction.Transactional;
@Service
@Transactional
public class EmpService {
private final EmpRepo repo;
public EmpService(EmpRepo repo) {
this.repo = repo;
}
public void saveMydata(Employee e) {
repo.save(e);
}
public List<Employee> showAllUsers(){
List<Employee> users = new ArrayList<Employee>();
for(Employee user : repo.findAll()) {
users.add(user);
}
return users;
}
public void deleteUser(int id) {
repo.deleteById(id);
}
public Employee editUser(int id) {
return repo.findById(id).orElse(null);
}

public Optional<Employee> login(String username,String password) {
return repo.findByUsernameAndPassword(username, password);
}
}