package com.resourceblocker.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
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
@RequestMapping("admin/")
public class ResourceController {

	// for resource
	@Autowired
	private ResourceService rs;

	// for reservation
	@Autowired
	private ReservationService rv;

	@Autowired
	private UserService uv;

	@GetMapping("/")
	public String adminDashboard(HttpSession session) {
		String username = (String) session.getAttribute("u");
		System.out.println(username);
		User user = uv.getUserByUsername(username);
		System.out.println(user.getUserType() + " same same na");
		if ("admin".equalsIgnoreCase(user.getUserType())) {
			return "admin";
		} else {
			return "loginagain"; // Redirect unauthorized users to login page
		}
	}

	// add resources page
	@GetMapping("/insert")
	public String add(Model m, HttpSession s) {

		String msg = "Add Resource";
		m.addAttribute("msg", msg);
		if (s.getAttribute("u") == null) {
			m.addAttribute("s", true);
			return "loginagain";

		}
		return "insert";

	}

	@PostMapping("/addresource")
	public String saveResource(@ModelAttribute("res") Resources res, Model m, HttpSession s) {
		System.out.println("seeee");
		System.out.println(res);
		if (res.getCapacity() <= 0) {
			m.addAttribute("capacityError", "Capacity must be greater than 0.");
			return "add_resource_page";
		}

		rs.saveResource(res);

		boolean msg = true;
		m.addAttribute("msg", msg);
		return "admin";
	}

	// view all resources
	@GetMapping("/view")
	public String view(Model model, HttpSession s) {
		System.out.println("view");

		List<Resources> lists = rs.getResource();
		System.out.println(lists);
		model.addAttribute("resource", lists);
		if (s.getAttribute("u") == null) {

			model.addAttribute("s", true);
			return "loginagain";
		}
		return "view";
	}

	// posting update id here
	@GetMapping("/update")
	public String resUpdate(@RequestParam Integer rid, Model m) {

		System.out.println("updating");

		Resources r = rs.getById(rid);
		System.out.println(r);
		System.out.println(r);

		if (r != null) {
			m.addAttribute("res", r);
			return "insert";
		}
		boolean msg = true;
		m.addAttribute("msg", msg);
		return "view";

	}

	// delete posting
	@GetMapping("/delete")
	public String resDelete(@RequestParam int rid) {
		System.out.println("deleting");
		Reservation res = rv.findByres(rid);

		System.out.println("working");

		rs.deleteById(rid);
		return "redirect:./view";

	}

	@GetMapping("/reservation")
	public String reservation(Model m, HttpSession s) {

		List<Reservation> reservationlist = rv.get();
		m.addAttribute("reservationlist", reservationlist);
		System.out.println(reservationlist);

		if (s.getAttribute("u") == null) {

			m.addAttribute("s", true);
			return "loginagain";
		}
		return "reservation";

	}

	// approve employee reservation and redirect same page
	@GetMapping("/approve")
	public String choice(@RequestParam Integer resid) {

		Reservation res = rv.getById(resid);
		res.setStatus("Approved");
		rv.save(res);

		return "redirect:./reservation";

	}

	// reject employee reservation here and redirect the same page
	@GetMapping("/reject")
	public String choice2(@RequestParam Integer resid) {

		Reservation res = rv.getById(resid);
		res.setStatus("Rejected");
		rv.save(res);
		return "redirect:./reservation";

	}

	@GetMapping("/export-reservations")
	public void exportReservationsToExcel(HttpServletResponse response) throws IOException {
		// Retrieve the list of reservations from the ReservationService
		List<Reservation> reservations = rv.get();

		// Create a new workbook and sheet
		Workbook workbook = new XSSFWorkbook();
		Sheet sheet = workbook.createSheet("Reservations");

		// Create the header row
		Row headerRow = sheet.createRow(0);
		headerRow.createCell(0).setCellValue("Reservation ID");
		headerRow.createCell(1).setCellValue("User ID");
		headerRow.createCell(2).setCellValue("Resource ID");
		headerRow.createCell(3).setCellValue("Start Date");
		headerRow.createCell(4).setCellValue("Duration");
		headerRow.createCell(5).setCellValue("Status");

		int rowNum = 1;
		for (Reservation reservation : reservations) {
			Row row = sheet.createRow(rowNum++);
			row.createCell(0).setCellValue(reservation.getResid());
			row.createCell(1).setCellValue(reservation.getUser().getSl_no());
			row.createCell(2).setCellValue(reservation.getRes().getRid());
			row.createCell(3).setCellValue(reservation.getStartDate().toString());
			row.createCell(4).setCellValue(reservation.getDuration());
			row.createCell(5).setCellValue(reservation.getStatus());
		}

		response.setContentType("application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");
		response.setHeader("Content-Disposition", "attachment; filename=reservations.xlsx");

		workbook.write(response.getOutputStream());
		workbook.close();
	}

}
