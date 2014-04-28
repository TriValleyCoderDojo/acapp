<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Zip Code Search</title>
	</head>
	<body>
		<br>
		<H1>Welcome to Zip Code Search Landing page</H1>
		<br>
		<a href="${createLink(uri:'/zip/listzips.gsp')}">List All Zip Codes</a>
		<br>
		<a href="${createLink(uri:'/zip/searchzipmap.gsp')}">Map of Restaurants in Zip Code</a>
		<br>
		<H1>Table List of Restaurants in Zip Code</H1>
		<g:form action="searchziplist" method="GET">
			<g:textField name="query" value=""/>
			<g:submitButton name="listresult" value="Get List" />
		</g:form>
		<br>
	</body>
</html>