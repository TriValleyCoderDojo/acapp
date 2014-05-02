package org.tvcd.acapp.domain

class RestaurantDTO {
	
	Integer id
	String name
	String address
	String city
	String state
	String zip
	Float latitude
	Float longitude
	String currGrade
	String phone
	String url
	List<ReviewDTO> reviews
	
	static mapWith = "none"
	
}
