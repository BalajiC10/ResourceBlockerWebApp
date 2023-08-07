package com.resourceblocker.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.resourceblocker.entity.Resources;
import com.resourceblocker.repository.ReservationRepo;
import com.resourceblocker.repository.ResourcesRepo;

@Service
public class ResourceService {

	@Autowired
	private ResourcesRepo res;

	@Autowired
	private ReservationRepo reservationRepository;

	public void saveResource(Resources resource) {
		res.save(resource);
	}

	public List<Resources> getResource() {
		return res.findAll();

	}

	public Resources getById(Integer id) {
		Optional<Resources> o = res.findById(id);
		if (o.isPresent()) {
			return o.get();
		}

		return null;

	}

	public void deleteById(Integer rid) {

		Optional<Resources> findById = res.findById(rid);
		if (findById.isPresent()) {
			res.deleteById(rid);
		}
	}

	public Resources findResourceById(Integer resourceId) {
		return res.findById(resourceId).orElse(null);
	}

	// Other autowired repositories and methods

}
