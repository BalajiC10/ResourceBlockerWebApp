package com.resourceblocker.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.resourceblocker.entity.Resources;

public interface ResourcesRepo extends JpaRepository<Resources, Integer> {

}
