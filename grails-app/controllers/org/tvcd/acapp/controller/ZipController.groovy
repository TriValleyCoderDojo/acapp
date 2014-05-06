package org.tvcd.acapp.controller

import grails.converters.JSON
//import grails.converters.deep.JSON
import org.tvcd.acapp.domain.RestaurantDTO
import org.tvcd.acapp.domain.Review
import org.tvcd.acapp.domain.ReviewDTO
import org.tvcd.acapp.domain.SearchResultsDTO
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
	
	/*
	 * This method is called by the AJAX call from the map.  It can have two parameters
	 *   1) checkbox indicating use current location (mylocation)
	 *   2) zip code to use in map results (zipcode)
	 * It will return the data that gets returned to the map.  
	 */
	def getMapData() {
		
		def currLocation = params.mylocation
		def boolean geoSim = false;
		def tZip
		def centerLat
		def centerLong
		def zoom
		
		if (currLocation.equals("false")) {
			tZip = params.zipcode
			zoom = 13
		}
		else {
			//FIXME: this is where we are statically defining a geolocation
			geoSim = true
			centerLat = "37.80013";
			centerLong = "-122.2717";
			tZip = "94607"
			// want the geolocation to have a tighter zoom
			zoom = 19
		}
		
		// make a service call to get all of the restaurants in the zip code of interest
		def restaurantList = restaurantService.findZipCodes(tZip)
		
		// step thru all the restaurants and format for what the map is expecting
		// only want to send the data that the map can use, don't want to send everything
		def SearchResultsDTO resultsDTO = new SearchResultsDTO()
		resultsDTO.restaurants = []
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
			// make sure these have a value to display
			if (restaurant.phone == null || restaurant.phone.empty){
				restaurantDTO.phone = "Unknown"
			}
			else {
				restaurantDTO.phone = restaurant.phone
			}
			if (restaurant.url == null || restaurant.url.empty){
				restaurantDTO.url = "Unknown"
			}
			else {
				restaurantDTO.url = restaurant.url
			}
			def reviewList = []
			if (restaurant.reviews != null && restaurant.reviews.size() > 0){
				// add the review data
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
				// create placeholder review data
				def reviewDTO = createEmptyReviews("Google")
				reviewList << reviewDTO
				reviewDTO = createEmptyReviews("Yelp")
				reviewList << reviewDTO
			}
			restaurantDTO.reviews = []
			for (review in reviewList){
				restaurantDTO.reviews << review
			}
			resultsDTO.restaurants << restaurantDTO
		}
		
		resultsDTO.zoom = zoom
		if (geoSim){
			resultsDTO.centerLatitude = centerLat
			resultsDTO.centerLongitude = centerLong
		}
		else {
			def RestaurantDTO restaurantDTO = resultsDTO.restaurants[0]
			resultsDTO.centerLatitude = restaurantDTO.latitude
			resultsDTO.centerLongitude = restaurantDTO.longitude
		}
		
		JSON.use('deep')
		render resultsDTO as JSON
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
