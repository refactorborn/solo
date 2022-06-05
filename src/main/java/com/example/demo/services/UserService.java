package com.example.demo.services;

import java.util.Optional;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;

import com.example.demo.models.LoginUser;
import com.example.demo.models.User;
import com.example.demo.repositories.UserRepository;

@Service
public class UserService {
	@Autowired
	private UserRepository userRepo;
	
	public User register(User newUser, BindingResult result) {
		
		Optional<User> potentialUser = userRepo.findByEmail(newUser.getEmail());
		if (potentialUser.isPresent()) {
			result.rejectValue("email", "email", "User already exists");
		}
		
		
		if(!newUser.getPassword().equals(newUser.getConfirm())) {
		    result.rejectValue("confirm", "Matches", "The Confirm Password must match Password!");
		}
		
		if(result.hasErrors()) {
		    // Exit the method and go back to the controller 
		    // to handle the response
		    return null;
		}
		
		String hashed = BCrypt.hashpw(newUser.getPassword(), BCrypt.gensalt());
		newUser.setPassword(hashed);
		
		newUser = userRepo.save(newUser);
		System.out.println("New user created with ID: " + newUser.getId());

		return newUser;
	}
	
	public User Login(LoginUser newLogin, BindingResult result) {
		
    	Optional<User> userLookUp = userRepo.findByEmail(newLogin.getEmail());
    	if (!userLookUp.isPresent()) {
    		result.rejectValue("email", "MissingAccount", "No account found.");
    		return null;
    	}
    	// User exists, retrieve user from DB
    	User user = userLookUp.get();
        
        // Reject if BCrypt password match fails
    	if(!BCrypt.checkpw(newLogin.getPassword(), user.getPassword())) {
    	    result.rejectValue("password", "Matches", "Invalid Password!");
    	}
    	
        // Return null if result has errors
    	if(result.hasErrors()) {
    		return null;
    	}
    	
        // Otherwise, return the user object
        return user;
       
	}
	
	public User findByEmail(String email) {
		
		Optional<User> result = userRepo.findByEmail(email);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	
	public User findById(Long id) {
		
		Optional<User> result = userRepo.findById(id);
		if(result.isPresent()) {
			return result.get();
		}
		
		return null;
	}
	
	

}
