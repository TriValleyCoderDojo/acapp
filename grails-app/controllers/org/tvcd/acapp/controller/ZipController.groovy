package org.tvcd.acapp.controller

import grails.converters.JSON
//import grails.converters.deep.JSON
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
			def restaurantDTO = new RestaurantDTO()
			restaurantDTO.id = restaurant.id
			restaurantDTO.name = restaurant.name
			restaurantDTO.address = restaurant.address
			restaurantDTO.city = restaurant.city
			restaurantDTO.state = restaurant.state
			restaurantDTO.zip = restaurant.zip
			restaurantDTO.latitude = restaurant.latitude
			restaurantDTO.longitude = restaurant.longitude
			restaurantDTO.currGrade = restaurant.currGrade
			if (restaurant.phone == null || restaurant.phone.empty){
				restaurantDTO.phone = restaurant.phone
			}
			else {
				restaurantDTO.phone = "Unknown"
			}
			if (restaurant.url == null || restaurant.url.empty){
				restaurantDTO.url = restaurant.url
			}
			else {
				restaurantDTO.url = "Unknown"
			}
			def reviewList = []
			if (restaurant.reviews != null && restaurant.reviews.size() > 0){
				for (review in restaurant.reviews){
					def reviewDTO = new ReviewDTO()
					reviewDTO.reviewType = review.reviewType
					reviewDTO.rating = review.rating
					reviewDTO.dollarRating = review.dollarRating
					reviewDTO.cuisine = review.cuisine
					reviewDTO.url = review.url
					reviewList << reviewDTO
				}
			}
			else {
				def reviewDTO = createEmptyReviews("Google")
				reviewList << reviewDTO
				reviewDTO = createEmptyReviews("Yelp")
				reviewList << reviewDTO
			}
			restaurantDTO.reviews = []
			for (review in reviewList){
				restaurantDTO.reviews << review
			}
			//restaurantDTO.reviews = reviewList
			resultList << restaurantDTO
		}
		JSON.use('deep')
		def restJSON = resultList as JSON
		render resultList as JSON
	}
	
	def ReviewDTO createEmptyReviews(String type){
		def reviewDTO = new ReviewDTO()
		reviewDTO.reviewType = type
		reviewDTO.rating = -1.0
		reviewDTO.dollarRating = -1
		reviewDTO.cuisine = "Unknonwn"
		reviewDTO.url = "Unknonwn"
		return reviewDTO
	}
	
}
