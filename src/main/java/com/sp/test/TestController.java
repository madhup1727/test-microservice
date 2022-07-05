package com.sp.test;

import java.util.Date;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class TestController {
	
	@GetMapping("/api/test")
	public String getCurrentDateTime() {
		return "The Date is " + new Date();
	}

}
