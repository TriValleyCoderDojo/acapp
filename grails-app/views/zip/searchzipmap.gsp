<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Zip Code Search Map</title>
		<g:javascript library="jquery"/>
		<script src="https://maps.googleapis.com/maps/api/js?v=3.11&sensor=false" type="text/javascript"></script>
		<r:layoutResources/>
		<g:javascript>
		function callAjax(zipcode){
			//alert("Enter callAjax with " + zipcode)
			$.ajax({
				url:"${g.createLink(controller:'zip',action:'getMapData')}",
				type:"post",
				data: { 'zipcode' : + zipcode },
				dataType: "json",
				success: function(response) {
					//alert(response)
					if (response.length == 0){
						return;
					}
					var map = new google.maps.Map(document.getElementById('map'), {
						zoom: 13,
						center: new google.maps.LatLng(response[0].latitude, response[0].longitude),
						mapTypeId: google.maps.MapTypeId.ROADMAP
					});
					
					var marker, i, currGrade;
					for (var i in response) {
						currGrade = response[i].currGrade;
						if (currGrade == "G" || currGrade == "" || currGrade == " "){ 
								marker = new google.maps.Marker({
								position: new google.maps.LatLng(response[i].latitude, response[i].longitude),
								map: map,
								icon: 'http://localhost:8080/acapp/images/green_marker2.png'
							});
						}
						if (currGrade == "R"){ 
								marker = new google.maps.Marker({
								position: new google.maps.LatLng(response[i].latitude, response[i].longitude),
								map: map,
								icon: 'http://localhost:8080/acapp/images/red_marker.png'
							});
						}
						if (currGrade == "Y"){ 
								marker = new google.maps.Marker({
								position: new google.maps.LatLng(response[i].latitude, response[i].longitude),
								map: map,
								icon: 'http://localhost:8080/acapp/images/yellow_marker.png'
							});
						}
						
						
						google.maps.event.addListener(marker, 'click', (function(marker, i) {
							var infowindow = new google.maps.InfoWindow();
							var contentString = 
								'<div id="content">'+
								'<h3>' + response[i].name + '</h3>' +
								'<p>Address: ' + response[i].address + '</p>' +
								'<p>' + response[i].city + ', ' + response[i].zip + '</p>' +
								'<p>Phone: TBD</p>' +
								'<p>Last Inspection: ' + response[i].currGrade +'</p>' +
								'<p>Google review: TBD</p>' +
								'<p>Yelp review: TBD</p>' +
								'</div>';
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
		<H4>Enter Zip Code</H4>
		<form name='mapForm'>
			<input type="text" id="formValueId" name="valueId"/>
			<input type="submit" value="Make Map" onclick="callAjax(this.form.valueId.value); return false;"/>
		</form>
		
		<div id="map" style="width: 800px; height:500px;"></div>
	</body>
</html>