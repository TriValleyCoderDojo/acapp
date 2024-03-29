package org.tvcd.acapp.domain

class ReviewDTO {
	
	String reviewType
	Float rating
	Integer dollarRating
	String cuisine
	String url
	
	static belongsTo = [ restaurant : RestaurantDTO ] 
	static mapWith = "none"
}
