package org.tvcd.acapp.service

import org.tvcd.acapp.domain.Restaurant
import org.tvcd.acapp.domain.Inspection
import grails.transaction.Transactional

@Transactional
class RestaurantService {

	def List<Restaurant> listZipCodes() {
		def restList = Restaurant.list().unique{ it.zip }
		restList.sort{ it.zip }
	}
	
	def List<Restaurant> findZipCodes(String zipcode) {
		def restList = Restaurant.findAllByZip(zipcode)
		restList
	}
	
	def Restaurant getByName(String name) {
		def result = Restaurant.findByName(name)
		result
	}
	
	def Restaurant getById(Integer myId) {
		def result = Restaurant.get(myId)
		result
	}
	
	def void updateRestaurant(Restaurant restaurant) {
		restaurant.save(flush:true)
		if(restaurant.hasErrors()){
			println '=========== ERROR! ============'
			println restaurant.errors
		}
	}
	
	
	def void processGrades(){
		
		def List<Restaurant> restaurants = Restaurant.list()
		for (restaurant in restaurants) {
			println "Working on restaurant " + restaurant.name
			// get the most current grade
			def List<Inspection> sortedInspect = restaurant.inspections.sort { it.date }.reverse()
			def String myCurrGrade = ""
			if (sortedInspect.size() > 0){
				myCurrGrade = getWorstGrade(sortedInspect)
			}
			restaurant.currGrade = myCurrGrade
			
			// count the total number of different grades
			int greenGrades = 0
			int yellowGrades = 0
			int redGrades = 0
			for(inspection in sortedInspect){
				if (inspection.grade.equals("G") ){
					greenGrades++
				}
				if (inspection.grade.equals("Y") ){
					yellowGrades++
				}
				if (inspection.grade.equals("R") ){
					redGrades++
				}
			}
			restaurant.greenCnt = greenGrades
			restaurant.yellowCnt = yellowGrades
			restaurant.redCnt = redGrades
			// defensive programming to make sure these are not null
			if (restaurant.yelpRating == null){
				restaurant.yelpRating = 0;
			}
			if (restaurant.yelpDollars == null){
				restaurant.yelpDollars = 0;
			}
			
			updateRestaurant(restaurant)
		}
		
	}
	
	def String getWorstGrade(List<Inspection> sortedInspect) {
		// need to find the worst grade from the set of most recent inspections
		Date mostCurrDate = sortedInspect.get(0).date
		String worstGrade = ""
		for(inspection in sortedInspect){
			if (inspection.date.time < mostCurrDate.time){
				break;
			}
			if (gradeToNum(inspection.grade) > gradeToNum(worstGrade) ){
				worstGrade = inspection.grade
			}
		}
		return worstGrade
	}
	
	def int gradeToNum(String grade){
		if (grade.equals("G")){
			return 1;
		}
		if (grade.equals("Y")){
			return 2;
		}
		if (grade.equals("R")){
			return 3;
		}
		return 0;
	}
	
	def String numToGrade(int num){
		if (num == 1){
			return "G";
		}
		if (num == 2){
			return "Y";
		}
		if (num == 3){
			return "R";
		}
		return ""
	}
	
}
