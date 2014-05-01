<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Home Page</title>
	</head>
	<style>
	a {
	font-family:"Arial";
	margin: 5px;
	}
	</style>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLinkTo(dir:'')}">Home</a></a></li>
				<li><a href="${createLink(uri:'/zip/index.gsp')}">By Zip Code</a></li>
				<li><a href="${createLink(uri:'/restaurant/index.gsp')}">By Name</a></li>
			</ul>
		</div>
		<div>
			<H1>Eats by Me</H1>
			<br>
			<p id="a">
			Eats by Me is a local app for managing your local restaurants. 
			It locates nearby eateries by zipcode, city or name for Alameda County. It mixes together health inspector reports, crime reports and Yelp ratings to provide meaningful advice in a easily readable fashion. 
			Much of the county's data is already provided to the public on data.acgov.org, but it is often in a unreadable or awkward table or map. Eats by Me processes this data and presents it to you. 
			It can be used to locate a place to eat anywhere in Alameda and it tells a user if the restaurant is hygenic, located in a stable neighborhood and what other consumers thought about it. Eats by Me was coded in MySQL, Groovy with Grails, and Javascript.  
			
			</p>
		</div>
	</body>
</html>