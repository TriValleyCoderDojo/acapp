<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Zip Code Search</title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLinkTo(dir:'')}">Home</a></a></li>
				<li><a href="${createLink(uri:'/zip/index.gsp')}">By Zip Code</a></li>
				<li><a href="${createLink(uri:'/restaurant/index.gsp')}">By Name</a></li>
			</ul>
		</div>
		<div class="body">
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
		</div>
	</body>
</html>