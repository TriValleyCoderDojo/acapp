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
	
	static hasMany = [ reviews : ReviewDTO ]
	static belongsTo = [ search : SearchResultsDTO ]
	static mapWith = "none"
	
}
