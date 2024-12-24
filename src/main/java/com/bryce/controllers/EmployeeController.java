package com.bryce.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.bryce.model.Employee;
import com.bryce.repositories.EmployeeRepository;
import com.bryce.services.IEmployeeService;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/")
public class EmployeeController {
    
    @Autowired
    private IEmployeeService commonService;
    @Autowired
    private EmployeeRepository empRepository;
    
    @GetMapping("/oom")
    public String triggerOOM(Model model) {
        List<byte[]> memoryFill = new ArrayList<>();
        try {
            while (true) {
                memoryFill.add(new byte[1024 * 1024]); // 分配 1MB 內存
            }
        } catch (OutOfMemoryError e) {
            model.addAttribute("errorMessage", "OutOfMemoryError triggered: " + e.getMessage());
        }
        return "oom";
    }
    
    @GetMapping("/count")
    public String count(HttpSession session, Model model) {
        Integer count = (Integer) session.getAttribute("count");
        if (count == null) {
            count = 0;
        }
        count++;
        session.setAttribute("count", count);
        model.addAttribute("count", count);
        return "count";
    }

    @GetMapping("/list")
    public String getAll(Model model) {
        List<Employee> entityList = empRepository.findAll();
        model.addAttribute("entityList", entityList);
        return "list";
    }

    @PostMapping("/insert")
    public String save(Employee emp) {
        empRepository.save(emp);
        return "redirect:/list";
    }

    @PostMapping("/update/{id}")
    public String update(Employee emp, @PathVariable(name = "id") long id, Model model) {
        try {
            Employee entity = empRepository.getOne(id);
            if (entity != null) {
                entity.setName(emp.getName());
                entity.setEmail(emp.getEmail());
                entity.setMobile(emp.getMobile());
                empRepository.save(entity);
            }
        } catch (NullPointerException e) {
            System.err.println(e.getMessage());
        }
        return "redirect:/list";
    }

    @GetMapping("/delete/{id}")
    public String delete(@PathVariable(name = "id") long id, Model model) {
        Employee entity = empRepository.getOne(id);
        empRepository.delete(entity);
        return "redirect:/list";
    }
}
