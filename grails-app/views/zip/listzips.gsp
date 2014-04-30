<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>List Zip Codes</title>
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
			<tr><th>Zip Code</th><th>City</th><th>State</th></tr>
			<g:each in="${zipList}" var="zip">
			<tr><td>${zip.zip}</td><td>${zip.city}</td><td>${zip.state}</td></tr>
			</g:each>
		</table>
	</body>
</html>