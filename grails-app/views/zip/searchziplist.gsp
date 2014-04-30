<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Search Results by Zip Code</title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLinkTo(dir:'')}">Home</a></a></li>
				<li><a href="${createLink(uri:'/zip/index.gsp')}">By Zip Code</a></li>
				<li><a href="${createLink(uri:'/restaurant/index.gsp')}">By Name</a></li>
			</ul>
		</div>
		<table>
			<tr><th>Name</th><th>Longitude</th><th>Latitude</th></tr>
			<g:each in="${restList}" var="r">
			<tr><td>${r.name}</td><td>${r.latitude}</td><td>${r.longitude}</td></tr>
			</g:each>
		</table>
	</body>
</html>cleaned