package org.tvcd.acapp.service

import org.tvcd.acapp.domain.Restaurant
import grails.transaction.Transactional

@Transactional
class RestaurantService {

	def List<Restaurant> listZipCodes() {
		def restList = Restaurant.list().unique{ it.zip }
		restList.sort{ it.zip }
	}
	
	def List<Restaurant> findZipCodes(String zipcode) {
		def restList = Restaurant.findAllByZip(zipcode)
		restList
	}
	
}
