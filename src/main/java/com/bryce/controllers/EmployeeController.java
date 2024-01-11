package com.bryce.controllers;

import java.util.List;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.bryce.model.Employee;
import com.bryce.repositories.EmployeeRepository;
import com.bryce.services.IEmployeeService;

@RestController
@RequestMapping("/")
public class EmployeeController {
private static final Logger logger = LoggerFactory.getLogger(EmployeeController.class);
    
    @Value("${logging.file.name}")
    private String logFilePath;
    
	@Autowired
	private IEmployeeService commonService;
	@Autowired
	private EmployeeRepository empRepository;
	@GetMapping("/count")
    public ModelAndView count(HttpSession session, Model model) {
        Integer count = (Integer) session.getAttribute("count");
        if (count == null) {
            count = 0;
        }
        count++;
        session.setAttribute("count", count);
        model.addAttribute("count", count);
        return new ModelAndView("/count"); 
    }

	@GetMapping("/list")
	public ModelAndView getAll(Model model) {
		List<Employee> entityList = empRepository.findAll();
		model.addAttribute("entityList", entityList);
		return new ModelAndView("/list"); 
	}
	
	@PostMapping("/insert")
	public ModelAndView save(Employee emp) {
		empRepository.save(emp);
		return new ModelAndView("redirect:/list");
	}
	
	@PostMapping("/update/{id}")
	public ModelAndView update(Employee emp, @PathVariable(name = "id") long id, Model model) {
		try {
			Employee entity = empRepository.getOne(id);
			if (entity !=null) {
				entity.setName(emp.getName());
				entity.setEmail(emp.getEmail());
				entity.setMobile(emp.getMobile());
				empRepository.save(entity);
			}
		} catch (NullPointerException e) {
			System.err.println(e.getMessage());
		}
		return new ModelAndView("redirect:/list");
	}
	
	@GetMapping("/delete/{id}")
	public ModelAndView delete(@PathVariable(name = "id") long id, Model model) {
		Employee entity = empRepository.getOne(id);
		empRepository.delete(entity);
		return new ModelAndView("redirect:/list");
	}
}
