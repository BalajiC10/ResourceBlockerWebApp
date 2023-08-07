package com.resourceblocker.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.resourceblocker.entity.User;

public interface UserRepo extends JpaRepository<User, Integer> {

	public List<User> findByusername(String username);

	@Query("from com.resourceblocker.entity.User where username=:username and password=:password")
	public User user(String username, String password);

}
