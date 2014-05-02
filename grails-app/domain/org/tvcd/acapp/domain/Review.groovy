package org.tvcd.acapp.domain

class Review {
	
	String reviewType
	Float rating
	Integer dollarRating
	String cuisine
	String url
	
	static belongsTo = [ restaurant : Restaurant ]
	
	static constraints = {
	}
}
