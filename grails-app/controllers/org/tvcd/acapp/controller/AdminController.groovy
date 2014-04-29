package org.tvcd.acapp.controller

import java.util.List;

import org.tvcd.acapp.domain.Restaurant
import org.tvcd.acapp.domain.Inspection

class AdminController {
	
	def restaurantService
	
	def index() { }
	
	def createCurrGrades() {
		
		def List<Restaurant> restaurants = Restaurant.list()
		for (restaurant in restaurants) {
			// get the most current grade 
			def List<Inspection> sortedInspect = restaurant.inspections.sort { it.date }.reverse()
			def String myCurrGrade 
			if (sortedInspect.size() > 0){
				myCurrGrade = sortedInspect.get(0).grade
			}
			else {
				myCurrGrade = ""
			}
			restaurant.currGrade = myCurrGrade
			
			
			
			
		}
		
		
		render (view:'index.gsp')
	}
}
