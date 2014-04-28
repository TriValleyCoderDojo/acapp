package org.tvcd.acapp.domain

class Inspection {
	
	Date date
	String service
	String description
	String grade
	
	static belongsTo = [
		restaurant : Restaurant
	]
	
    static constraints = {
    }
}
