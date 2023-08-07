package com.resourceblocker.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.resourceblocker.entity.Reservation;

public interface ReservationRepo extends JpaRepository<Reservation, Integer> {

	@Query("from com.resourceblocker.entity.Reservation where res.id like ?1 ")
	Reservation reservation(Integer rid);

}
