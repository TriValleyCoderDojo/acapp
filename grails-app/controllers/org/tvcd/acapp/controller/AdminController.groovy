package org.tvcd.acapp.controller

import java.util.List;

import org.tvcd.acapp.domain.Restaurant
import org.tvcd.acapp.domain.Inspection

class AdminController {
	
	def restaurantService
	
	def index() { }
	
	def createCurrGrades() {
		
		restaurantService.processGrades();
		
		
		render (view:'index.gsp')
	}
}
