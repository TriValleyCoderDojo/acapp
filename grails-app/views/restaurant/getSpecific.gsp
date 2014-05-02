<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Restaurant Search</title>
	</head>
	<body>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLinkTo(dir:'')}">Home</a></a></li>
				<li><a href="${createLink(uri:'/zip/index.gsp')}">Search by Zip Code</a></li>
				<li><a href="${createLink(uri:'/restaurant/index.gsp')}">By Name</a></li>
			</ul>
		</div>
		<div class="body">
			<div class="table">
				<table>
					<tbody>
						<tr>
							<td>Name:</td>
							<td>${restDetail.name}</td>
						</tr>
						<tr>
							<td>Address:</td>
							<td>${restDetail.address}</td>
						</tr>
						<tr>
							<td>Zipcode:</td>
							<td>${restDetail.zip}</td>
						</tr>
						<tr>
							<td>Health Rating:</td>
							<td>${restDetail.currGrade}</td>
						</tr>
						<tr>
							<td>Health Rating:</td>
							<td>${restDetail.currGrade}</td>
						</tr>
						<tr>
							<td>Number of Health Violations:</td>
							<td>${restDetail.redCnt}</td>
						</tr>
						<tr>
							<td>Number of Health Warnings:</td>
							<td>${restDetail.yellowCnt}</td>
						</tr>
					</tbody>
				</table>
			</div>
			<h2>Reviews</h2>
			<div class="table">
				<table>
					<tr><th>Source</th><th>Rating</th></tr>
					<g:each var="review" in="${restDetail.reviews}">
					<tr><td>${review.reviewType}</td><td>${review.rating}</td></tr>
					</g:each>
				</table>
			</div>
			<h2>Inspections</h2>
			<div class="table">
				<table>
					<tr><th>Date</th><th>Grade</th><th>Description</th></tr>
					<g:each var="inspection" in="${restDetail.inspections}">
					<tr>
						<td><g:formatDate format="yyyy-MM-dd" date="${inspection.date}"/></td>
						<td>${inspection.grade}</td><td>${inspection.description}</td>
					</tr>
					</g:each>
				</table>
			</div>
			
		</div>
	</body>
</html>


