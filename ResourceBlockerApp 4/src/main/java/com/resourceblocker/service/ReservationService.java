package com.resourceblocker.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.resourceblocker.entity.Reservation;
import com.resourceblocker.repository.ReservationRepo;
import com.resourceblocker.repository.ResourcesRepo;

@Service
public class ReservationService {

	@Autowired
	private ReservationRepo reservationrepo;

	@Autowired
	private ResourcesRepo res;

	public List<Reservation> get() {
		return reservationrepo.findAll();
	}

	public String save(Reservation r) {
		Reservation rs = reservationrepo.save(r);
		return "";
	}

	public Reservation getById(Integer id) {
		Optional<Reservation> r = reservationrepo.findById(id);
		if (r.isPresent()) {
			return r.get();
		}
		return null;

	}

	public Reservation findByres(Integer rid) {
		return reservationrepo.reservation(rid);
	}

	public void saveReservation(Reservation reservation) {
		reservationrepo.save(reservation);
	}

}
