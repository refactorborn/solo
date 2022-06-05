package com.example.demo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.example.demo.models.LoginUser;
import com.example.demo.models.User;
import com.example.demo.services.ShowService;
import com.example.demo.services.UserService;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@Autowired
	private ShowService showService;


	
	
	@RequestMapping("/")
	public String home (Model model) {
        model.addAttribute("newUser", new User());
        model.addAttribute("newLogin", new LoginUser());
	return "Login.jsp";
	}
	
	
	@PostMapping("/register")
    public String register(@Valid @ModelAttribute("newUser") User newUser, 
            BindingResult result, Model model, HttpSession session) {
		
		
		User user = userService.register(newUser, result);
		
		if(result.hasErrors()) {
			model.addAttribute("newLogin", new LoginUser());
			return "Login.jsp";
		}
		
		session.setAttribute("userID", user.getId());
		
		return "redirect:/dashboard";
	}


	
	@PostMapping("/login")
	public String user (@Valid @ModelAttribute("newLogin") LoginUser newLogin, BindingResult result, Model model,Long id, HttpSession session ) {
		
	    
        if(result.hasErrors()) {
            model.addAttribute("newUser", new User());
            return "Login.jsp";
        }
        
       User user =  userService.Login(newLogin, result);
        session.setAttribute("userId", user.getId());
//        why
        
//        userService.Login(newLogin, result);
//        session.setAttribute("userId", userService.findById(id));
        

        return "redirect:/dashboard";
		
	}
	
	@RequestMapping("/dashboard" )
	public String dash(Model model, HttpSession session ) {
		
		if(session.getAttribute("userId") == null) {
    		return "redirect:/";
		}

    	model.addAttribute("user", userService.findById((Long)session.getAttribute("userId")));
    	model.addAttribute("shows", showService.getAll());
		return "home.jsp";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
}