package org.tvcd.acapp.controller

import grails.converters.JSON
import org.tvcd.acapp.domain.RestaurantDTO
import org.tvcd.acapp.domain.Review
import org.tvcd.acapp.domain.ReviewDTO
import org.tvcd.acapp.domain.ZipCodeDTO
import org.tvcd.acapp.service.RestaurantService

class ZipController {
	
	def restaurantService

	def index() {
	}
	
	def listzips() {
		
		def zipList = restaurantService.listZipCodes()
		[ zipList:zipList ]
		
	}
	
	def searchziplist() {
		def restList = restaurantService.findZipCodes(params.query)
		[ restList:restList ]
	}
	
	
	def searchzipmap() {
	}
	
	
	def getMapData() {
		
		def tZip = params.zipcode
		def restaurantList = restaurantService.findZipCodes(tZip)
		//render restList  as JSON
		def resultList = []
		for (restaurant in restaurantList){
			def dto = new RestaurantDTO()
			dto.id = restaurant.id
			dto.name = restaurant.name
			dto.address = restaurant.address
			dto.city = restaurant.city
			dto.state = restaurant.state
			dto.zip = restaurant.zip
			dto.latitude = restaurant.latitude
			dto.longitude = restaurant.longitude
			dto.currGrade = restaurant.currGrade
			dto.phone = restaurant.phone
			dto.url = restaurant.url
			def reviewList = []
			for (review in restaurant.reviews){
				def reviewDTO = new ReviewDTO()
				reviewDTO.reviewType = review.reviewType
				reviewDTO.rating = review.rating
				reviewDTO.dollarRating = review.dollarRating
				reviewDTO.cuisine = review.cuisine
				reviewDTO.url = review.url
				reviewList << reviewDTO
			}
			dto.reviews = reviewList
			resultList << dto
		}
		render resultList  as JSON
	}
	
}
