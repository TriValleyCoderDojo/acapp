<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>List Zip Codes</title>
	</head>
	<body>
		<table>
			<tr><th>Zip Code</th><th>City</th><th>State</th></tr>
			<g:each in="${zipList}" var="zip">
			<tr><td>${zip.zip}</td><td>${zip.city}</td><td>${zip.state}</td></tr>
			</g:each>
		</table>
	</body>
</html>