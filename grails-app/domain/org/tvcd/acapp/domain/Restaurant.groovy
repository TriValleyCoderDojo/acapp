package org.tvcd.acapp.domain

class Restaurant {
	
	String name
	String address
	String city
	String state
	String zip
	Float latitude
	Float longitude
	Integer greenCnt
	Integer yellowCnt
	Integer redCnt
	//Integer yelpRating
	//Integer yelpDollars
	String currGrade
	String phone
	String url
	
	static hasMany = [ inspections : Inspection, reviews : Review ]
	
    static constraints = {
    }
}
