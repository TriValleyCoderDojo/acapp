package org.tvcd.acapp.controller

import grails.converters.JSON
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
		
		def restList = restaurantService.findZipCodes(tZip)
		def retList = []
		for (r in restList){
			def nextList = []
			nextList << r.name
			nextList << r.latitude
			nextList << r.longitude
			nextList << r.id
			retList << nextList
		} 
		
		render retList as JSON
	}
}
