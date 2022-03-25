package com.on.myown;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;



@SpringBootApplication
public class MyownApplication extends SpringBootServletInitializer{

	public static void main(String[] args) {
		SpringApplication.run(MyownApplication.class, args);
	}

}
