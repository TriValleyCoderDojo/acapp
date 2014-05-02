package org.tvcd.acapp.controller

class RestaurantController {
	
	def restaurantService

	def index() { }
	
	def getSpecific() {
		def restName = params.rest_name
		def restDetail = restaurantService.getByName(restName)
		[ restDetail:restDetail ]
	}
	
	def getDetail() {
		def Integer restId = Integer.valueOf(params.id)
		def restDetail = restaurantService.getById(restId)
		render(view:"/restaurant/getSpecific",  model: [restDetail: restDetail])
	}
	
}
