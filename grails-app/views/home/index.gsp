<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Home Page</title>
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
			<H1>Eats by Me</H1>
			<br>
			<p>
			Welcome to the Eats by Me service.  This service will allow you get useful information about restaurants in Alameda County.  
			It includes information from the Alameda County Health inspectors and Yelp reviews.  You will be able to search 
			by zip or by name.  
			
			</p>
		</div>
	</body>
</html>