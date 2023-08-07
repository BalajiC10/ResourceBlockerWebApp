package com.resourceblocker.controller;

import java.time.LocalDate;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.resourceblocker.entity.Reservation;
import com.resourceblocker.entity.Resources;
import com.resourceblocker.entity.User;
import com.resourceblocker.service.ReservationService;
import com.resourceblocker.service.ResourceService;
import com.resourceblocker.service.UserService;

@Controller
@RequestMapping("/employeeDashboard")
public class EmployeeController {

	// for resource
	@Autowired
	private ResourceService rs;

	// for reservation
	@Autowired
	private ReservationService rv;

	// for reservation
	@Autowired
	private UserService uv;

	@GetMapping("/")
	public String employeeDashboard(HttpSession session) {
		String username = (String) session.getAttribute("u");
		User user = uv.getUserByUsername(username);
		System.out.println("user:" + user);
		System.out.println(user.getUserType());
		System.out.println("enddd");
		if ("employee".equalsIgnoreCase(user.getUserType())) {
			return "employeeDashboard";
		} else {
			return "loginagain"; // Redirect unauthorized users to login page
		}
	}

	// view all resources
	@GetMapping("/viewResources")
	public String view(Model model, HttpSession s) {
		System.out.println("ve");

		List<Resources> lists = rs.getResource();
		System.out.println(lists);
		model.addAttribute("resource", lists);
		if (s.getAttribute("u") == null) {

			model.addAttribute("s", true);
			return "loginagain";
		}
		return "viewResources";
	}

	@GetMapping("/viewReservations")
	public String showReservation(Model model, HttpSession session) {
		if (session.getAttribute("u") == null) {
			System.out.println("not");
			model.addAttribute("s", true);
			return "loginagain";
		}

		List<Reservation> reservationlist = rv.get();
		model.addAttribute("reservationlist", reservationlist);
		System.out.println("working");
		// System.out.println(reservationlist);

		return "viewReservations";
	}

	@GetMapping("/bookResource")
	public String showBookResourcePage() {
		return "bookResource"; // Assuming "bookResource.jsp" is the name of your JSP file
	}

	@PostMapping("/bookResource")
	public String bookResource(@RequestParam("startDate") String startDate, @RequestParam("duration") Integer duration,
			@RequestParam("resid") Integer resid, Model model, HttpSession session) {
		// Check if the user is authenticated before doing anything else
		if (session.getAttribute("u") == null) {
			model.addAttribute("s", true);
			return "loginagain"; // Redirect to the login page or show an appropriate message
		}

		String Username = (String) session.getAttribute("u");
		System.out.println("working....tadaa");
		// System.out.println(Username);
		User user = uv.getUserByUsername(Username);

		System.out.println(user);

		// Fetch the Resource object using the resid and check if it exists
		Resources resource = rs.findResourceById(resid);
		if (resource == null) {
			model.addAttribute("message", "Resource not found!");
			return "bookResource"; // Redirect back to the bookResource page with an error message
		}

		// Check if the resource has enough capacity for the booking
		if (resource.getCapacity() <= 0) {
			model.addAttribute("message", "Resource is fully booked!");
			return "bookResource"; // Redirect back to the bookResource page with an error message
		}

		// Create a new Reservation object and set its properties
		Reservation reservation = new Reservation();
		reservation.setStartDate(LocalDate.parse(startDate));
		reservation.setDuration(duration);
		reservation.setRes(resource);
		reservation.setUser(user);
		reservation.setCancelStatus("Booked");
		System.out.println("belowww");
		System.out.println(user.getSl_no());

		// Set the user's sl_no as their userid in the Reservation object
		// rs.setUserid(userId);

		// Save the reservation with default status "pending"
		rv.saveReservation(reservation);

		// Update the resource's capacity and save it
		resource.setCapacity(resource.getCapacity() - 1);
		rs.saveResource(resource);

		// Add success message to the model
		model.addAttribute("message", "Resource booked successfully!");

		// Redirect back to the bookResource page with a success message
		return "bookResource";
	}

	@GetMapping("/cancelReservation")
	public String cancelReservation(@RequestParam Integer resid) {
		Reservation reservation = rv.getById(resid);
		System.out.println("cancelling");
		reservation.setCancelStatus("Cancelled"); // Set cancel status
		rv.save(reservation);
		return "redirect:./viewReservations";
	}

}
