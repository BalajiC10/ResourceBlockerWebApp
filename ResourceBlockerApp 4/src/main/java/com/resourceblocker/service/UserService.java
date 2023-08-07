package com.resourceblocker.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.resourceblocker.entity.User;
import com.resourceblocker.repository.UserRepo;

@Service
@Transactional
public class UserService {

	@Autowired
	private UserRepo userrepo;

	public void saveUser(User user) {
		userrepo.save(user);
	}

	public boolean findByuserName(String username) {

		List<User> findByusername = userrepo.findByusername(username);
		if (findByusername.size() == 0) {
			return true;
		}
		return false;

	}

	public User checkuser(String username, String password) {

		User us = userrepo.user(username, password);
		if (us != null) {
			return us;
		}
		return null;
	}

	public User getUserById(Integer id) {
		return userrepo.findById(id).get();
	}

	public User getUserByUsername(String username) {
		List<User> users = userrepo.findByusername(username);
		if (!users.isEmpty()) {
			return users.get(0); // Return the first user found
		}
		return null; // Return null if no user is found
	}

}
