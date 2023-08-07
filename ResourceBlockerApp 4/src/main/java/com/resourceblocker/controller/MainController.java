package com.resourceblocker.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.resourceblocker.entity.User;
import com.resourceblocker.service.UserService;

@Controller
@RequestMapping("/")
public class MainController {

	@Autowired
	private UserService userservice;

	// home page
	@GetMapping("/home")
	public String home() {
		System.out.println("Home Page....");
		return "home";
	}

	// login
	@GetMapping("/login")
	public String login() {
		System.out.println("login Page....");
		return "login";
	}

	@GetMapping("/register")
	public String showRegistrationForm() {
		return "register"; // Your registration JSP page
	}

	@PostMapping("/register")
	public String register(@ModelAttribute User user) {
		user.setRole(user.getUserType());
		userservice.saveUser(user);
		return "redirect:/login";
	}

	// login to admin page
	@GetMapping("/login1")
	public String admin() {
		System.out.println("admin Page....");
		return "redirect:/admin/";
	}

	@PostMapping("/login1")
	public String checkRole(@ModelAttribute User user, @RequestParam("userType") String userType, Model m,
			HttpSession session) {
		User checkUser = userservice.checkuser(user.getUsername(), user.getPassword());
		System.out.println("login1 is okay");

		if (checkUser != null) {
			System.out.println(checkUser.getRole());
			System.out.println(user.getUserType());

			// Set the userType to the checkUser object
			checkUser.setUserType(userType);

			if ("admin".equalsIgnoreCase(userType) && "admin".equalsIgnoreCase(checkUser.getRole())) {
				session.setAttribute("u", user.getUsername());
				System.out.println("vishay");
				return "redirect:/admin/";
			} else if ("user".equalsIgnoreCase(userType) && "user".equalsIgnoreCase(checkUser.getRole())) {
				session.setAttribute("u", user.getUsername());
				return "redirect:/employeeDashboard/";
			} else {
				String msg = "Invalid user type or role.";
				m.addAttribute("msg", msg);
				return "login";
			}
		} else {
			String msg = "Invalid credentials.";
			m.addAttribute("msg", msg);
			return "login";
		}
	}

	// logout from session and exit to home page
	@GetMapping("/logout")
	// @RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session = request.getSession();
		session.invalidate();
		return "home";
	}

	// Change password form
	@GetMapping("/changepass")
	public String changePasswordForm() {
		return "changepass";
	}

	@PostMapping("/changepass")
	public String changePassword(@RequestParam("oldpass") String oldPassword,
			@RequestParam("newpass") String newPassword, @RequestParam("confirmpass") String confirmPassword,
			HttpSession session, Model model) {

		String username = (String) session.getAttribute("u");
		User user = userservice.checkuser(username, oldPassword);

		if (user != null) {
			if (oldPassword.equals(newPassword)) {
				model.addAttribute("errorMsg", "Old and new passwords cannot be the same!");
				return "changepass";
			} else if (!newPassword.equals(confirmPassword)) {
				model.addAttribute("errorMsg", "New password and confirm password do not match!");
				return "changepass";
			} else {
				// Update the password
				user.setPassword(newPassword);
				userservice.saveUser(user);

				model.addAttribute("successMsg", "Password changed successfully!");
				return "changepass";
			}
		} else {
			model.addAttribute("errorMsg", "Invalid old password!");
			return "changepass";
		}
	}

	// Change password form
	@GetMapping("/changepass1")
	public String changePasswordForm1() {
		return "changepass1";
	}

	@PostMapping("/changepass1")
	public String changePassword1(@RequestParam("oldpass") String oldPassword,
			@RequestParam("newpass") String newPassword, @RequestParam("confirmpass") String confirmPassword,
			HttpSession session, Model model) {

		String username = (String) session.getAttribute("u");
		User user = userservice.checkuser(username, oldPassword);

		if (user != null) {
			if (oldPassword.equals(newPassword)) {
				model.addAttribute("errorMsg", "Old and new passwords cannot be the same!");
				return "changepass1";
			} else if (!newPassword.equals(confirmPassword)) {
				model.addAttribute("errorMsg", "New password and confirm password do not match!");
				return "changepass1";
			} else {
				// Update the password
				user.setPassword(newPassword);
				userservice.saveUser(user);

				model.addAttribute("successMsg", "Password changed successfully!");
				return "changepass1";
			}
		} else {
			model.addAttribute("errorMsg", "Invalid old password!");
			return "changepass1";
		}
	}

}
