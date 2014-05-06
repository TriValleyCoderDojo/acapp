<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Zip Code Search Map</title>
		<g:javascript library="jquery"/>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.11&sensor=false&libraries=visualization" type="text/javascript"></script>
		<r:layoutResources/>
		<g:javascript>
		var crime_api = "http://data.acgov.org/resource/2k95-y89t.json";
		var crime_data = null; 
		function callAjax(zipcode, usegeo){
		//	alert("Enter callAjax with " + zipcode + " and " + usegeo)
			// get the restaurant data from the local server
			$.ajax({
				url:"${g.createLink(controller:'zip',action:'getMapData')}",
				type:"post",
				data: { 'zipcode' : zipcode, 'mylocation' : usegeo },
				dataType: "json",
				success: function(response) {
					//alert(response)
					if (response.restaurants.length == 0){
						return;
					}
					
					// get the crime data from the socrata API endpoint
					$.ajax({
						url: "http://data.acgov.org/resource/2k95-y89t.json",
						type: "get",
						data: {'zip': zipcode},
						dataType: "json",
						success: function(res){
							//console.log(res);
							crime_data = res;
						}
					});
					
					// create the map
					var map = new google.maps.Map(document.getElementById('map'), {
						zoom: response.zoom,
						center: new google.maps.LatLng(response.centerLatitude, response.centerLongitude),
						mapTypeId: google.maps.MapTypeId.ROADMAP
					});
					
					
					// add crime data to the map
					var m;
					var heatmapData = [];	
					for (var i in crime_data){
						//heatmapData.push(new google.maps.LatLng(crime_data[i].location_1.latitude, crime_data[i].location_1.longitude));
							
						m = new google.maps.Marker({
							position: new google.maps.LatLng(crime_data[i].location_1.latitude, crime_data[i].location_1.longitude),
							map: map,
							icon: 'http://localhost:8080/acapp/images/icon_cry.gif'
						});
					}
					/*console.log(heatmapData);
					var pointArray = new google.maps.MVCArray(heatmapData);
					heatmap = new google.maps.visualization.HeatmapLayer({data:pointArray});
					heatmap.setMap(map);*/

					// add the restaurant data to the map
					var marker;
					if (response.zoom == 19){
						marker = new google.maps.Marker({
							position: new google.maps.LatLng(response.centerLatitude, response.centerLongitude),
							map: map
						});
						google.maps.event.addListener(marker, 'click', (function(marker, i) {
							return function() {
								infowindow.setContent('Current location');
								infowindow.open(map, marker);
							}
						})(marker, i));
					}
					var i, currGrade;
					for (var i in response.restaurants) {
						// first figure out which icon to show on the map
						currGrade = response.restaurants[i].currGrade;
						if (currGrade == "G" || currGrade == "" || currGrade == " "){ 
								marker = new google.maps.Marker({
								position: new google.maps.LatLng(response.restaurants[i].latitude, response.restaurants[i].longitude),
								map: map,
								icon: 'http://localhost:8080/acapp/images/green_marker2.png'
							});
						}
						if (currGrade == "R"){ 
								marker = new google.maps.Marker({
								position: new google.maps.LatLng(response.restaurants[i].latitude, response.restaurants[i].longitude),
								map: map,
								icon: 'http://localhost:8080/acapp/images/red_marker.png'
							});
						}
						if (currGrade == "Y"){ 
								marker = new google.maps.Marker({
								position: new google.maps.LatLng(response.restaurants[i].latitude, response.restaurants[i].longitude),
								map: map,
								icon: 'http://localhost:8080/acapp/images/yellow_marker.png'
							});
						}
						// now create the info windows for each 
						google.maps.event.addListener(marker, 'click', (function(marker, i) {
							var infowindow = new google.maps.InfoWindow();
							
							//var review1 = '<p><a href="' + response.restaurants[i].reviews[0].url + '" target="_blank">' + response.restaurants[i].reviews[0].reviewType  + '</a>' + ': Rating-';
							//if (response.restaurants[i].reviews[0].dollarRating == -1){
							//	review1 = review1 + 'Unknown, Dollars-Unknown';
							//}
							//else {
							//	review1 = review1 + response.restaurants[i].reviews[0].rating + ', Dollars-' + response.restaurants[i].reviews[0].dollarRating;
							//}
							//review1 = review1 + '</p>';
							//
							//var review2 = '<p><a href="' + response.restaurants[i].reviews[1].url + '" target="_blank">' + response.restaurants[i].reviews[1].reviewType  + '</a>' + ': Rating-';
							//if (response.restaurants[i].reviews[1].dollarRating == -1){
							//	review2 = review2 + 'Unknown, Dollars-Unknown';
							//}
							//else {
							//	review2 = review2 + response.restaurants[i].reviews[1].rating + ', Dollars-' + response.restaurants[i].reviews[1].dollarRating;
							//}
							//review2 = review2 + '</p>';
							
							var contentString = 
								'<div id="content">'+
								'<h3>' + response.restaurants[i].name + '</h3>' +
								'<p>Address: ' + response.restaurants[i].address + '</p>' +
								'<p>' + response.restaurants[i].city + ', ' + response.restaurants[i].zip + '</p>' +
								'<p>Phone: ' + response.restaurants[i].phone + '</p>' +
								'<p>Last Inspection: ' + response.restaurants[i].currGrade + 
									' <a href="http://localhost:8080/acapp/restaurant/getDetail?id=' + 
									response.restaurants[i].id + '" target="_blank">More info</a></p>';
							for (var j in response.restaurants[i].reviews) {
								var review = '<p>';
								if (response.restaurants[i].reviews[j].dollarRating == -1){
									review = review + response.restaurants[i].reviews[j].reviewType + ': Rating-TBD, Dollars-TBD';
								}
								else {
									review = review + '<a href="' + response.restaurants[i].reviews[j].url + 
										'" target="_blank">' + response.restaurants[i].reviews[j].reviewType  + '</a>' + ': Rating-' +
										response.restaurants[i].reviews[j].rating + ', Dollars-' + response.restaurants[i].reviews[j].dollarRating;
								}
								review = review + '</p>';
								contentString = contentString + review
							}
							//review1 + review2 + '</div>';
							contentString = contentString + '</div>';
							return function() {
								infowindow.setContent(contentString);
								infowindow.open(map, marker);
							}
						})(marker, i));
					}
				},
				error: function(xhr){
					alert(xhr.responseText);
				}
			});
		}
		</g:javascript>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLinkTo(dir:'')}">Home</a></a></li>
				<li><a href="${createLink(uri:'/zip/index.gsp')}">By Zip Code</a></li>
				<li><a href="${createLink(uri:'/restaurant/index.gsp')}">By Name</a></li>
			</ul>
		</div>
		<H4>Search By Zip Code or Current Location</H4>
		<br>
		<form name='mapForm'>
			<label>Zip Code: </label>
			<input type="text" id="formValueId" name="valueId"/>
			<br>
			<label>Use My Current Location</label>
			<input type="checkbox" id="mylocation" value="mylocation" name="mylocation">
			<br>
			<input type="submit" value="Make Map" onclick="callAjax(this.form.valueId.value, this.form.mylocation.checked); return false;"/>
		</form>
		
		<div id="map" style="width: 800px; height:500px;"></div>
	</body>
</html>
