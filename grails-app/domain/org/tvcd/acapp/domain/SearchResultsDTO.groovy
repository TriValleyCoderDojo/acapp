package org.tvcd.acapp.domain

class SearchResultsDTO {
	
	String centerLatitude
	String centerLongitude
	Integer zoom
	
	static hasMany = [ restaurants : RestaurantDTO ]
	static mapWith = "none"

}
