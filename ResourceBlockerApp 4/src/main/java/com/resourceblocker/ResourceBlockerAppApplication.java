package com.resourceblocker;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication(scanBasePackages = "com.resourceblocker")
public class ResourceBlockerAppApplication {

	public static void main(String[] args) {
		SpringApplication.run(ResourceBlockerAppApplication.class, args);
	}
}
