<!DOCTYPE html>rest
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
			<tr><th>Name</th><th>Address</th><th>City</th><th>Health Rating</th></tr>
			<g:each in="${restList}" var="r">
			<g:set var="myid" value="${r.id}" />
			<tr>
				<td><a href="${createLink(action: 'getDetail', controller: 'restaurant', params:[id:myid])}" target="_blank">${r.name}</a></td>
				<td>${r.address}</td><td>${r.city}</td><td>${r.currGrade}</td>
			</tr>
			</g:each>
		</table>
	</body>
</html>