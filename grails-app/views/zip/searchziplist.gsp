<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Search Results by Zip Code</title>
	</head>
	<body>
		<table>
			<tr><th>Name</th><th>Longitude</th><th>Latitude</th></tr>
			<g:each in="${restList}" var="r">
			<tr><td>${r.name}</td><td>${r.latitude}</td><td>${r.longitude}</td></tr>
			</g:each>
		</table>
	</body>
</html>