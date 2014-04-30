package org.tvcd.acapp.controller

class RestaurantController {
	
	def restaurantService

	def index() { }
	
	def getSpecific() {
		def restName = params.rest_name
		def restDetail = restaurantService.getByName(restName)
		[ restDetail:restDetail ]
	}
}
