package com.example.demo.controllers;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;


import com.example.demo.models.Post;
import com.example.demo.models.Show;
import com.example.demo.models.User;
import com.example.demo.services.PostService;
import com.example.demo.services.ShowService;
import com.example.demo.services.UserService;

@Controller
public class MainController {
	@Autowired
	private UserService userService;
	@Autowired
	private PostService postService;
	@Autowired
	private ShowService showService;

	@RequestMapping("/create/post")
	public String ViewCreate (@ModelAttribute("newPost") Post newPost, Model model, HttpSession session) {
		model.addAttribute("user", userService.findById((Long)session.getAttribute("userId")));
    	model.addAttribute("shows", showService.getAll()); 
		return "Create.jsp";
	}
	
	@PostMapping("/post/new")
	public String add(@Valid @ModelAttribute("newPost") Post newPost, BindingResult result, HttpSession session, Model model) {
		
		if (result.hasErrors()) {
			model.addAttribute("shows", showService.getAll());
			return "Create.jsp";
		} else {
			Long id = (Long) session.getAttribute("userId");
			User user = userService.findById(id);
			newPost.setUser(user);
			this.postService.create(newPost);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping("/profile")
	public String profile (Model model, HttpSession session) {
		model.addAttribute("user", userService.findById((Long)session.getAttribute("userId")));
		model.addAttribute("shows", showService.getAll());
		model.addAttribute("posts", postService.getAll());
		return "Profile.jsp";
	}
	
	@RequestMapping("/show")
	public String show (@ModelAttribute("newShow") Show newShow) {
		return "CreateShow.jsp";
	}
	
	@PostMapping("/show/new")
	public String creation (@Valid @ModelAttribute("newShow") Show newShow, BindingResult result) {
		if (result.hasErrors()) {
			return "CreateShow.jsp";
		} else {
			this.showService.create(newShow);
			return "redirect:/dashboard";
		}
	}
	
	@GetMapping("/posts/{id}")
	public String thoughts(@PathVariable("id") Long id, Model model, @ModelAttribute("posts") Post post, HttpSession session) {
		Post onePost = postService.find(id);
		model.addAttribute("onePost", onePost);
		model.addAttribute("user", userService.findById((Long)session.getAttribute("userId")));
		return "ViewPost.jsp";
	}
	
	
	@RequestMapping("/post/edit/{id}")
	public String edit(@PathVariable("id") Long id, Model model, @ModelAttribute("posts") Post post, HttpSession session) {
		Post editPost = postService.find(id);
		model.addAttribute("user", userService.findById((Long)session.getAttribute("userId")));
		model.addAttribute("editPost", editPost);
		return "EditPost.jsp";
	}	
	
	@PostMapping("/post/edited/{id}")
	public String edited(@Valid @ModelAttribute("editPost")Post post, BindingResult result) {
		
		if (result.hasErrors()) {
			return "EditPost.jsp";
		}else {
			postService.update(post);
			return "redirect:/dashboard";
		}
	}
	
	@RequestMapping("/shows/{id}")
	public String viewAnime (@PathVariable("id") Long id, Model model, HttpSession session) {
		model.addAttribute("user", userService.findById((Long)session.getAttribute("userId")));
		model.addAttribute("shows", showService.find(id));
		model.addAttribute("posts", postService.getAll());

		
		
		return "AnimePage.jsp";
	}
	
	@RequestMapping("/delete/{id}")
	public String delete(@PathVariable("id") Long id) {
		postService.delete(id);
		return "redirect:/profile";
	}
}

