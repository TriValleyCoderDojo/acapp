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
			<div class="dialog">
				<table>
					<tbody>
						<tr class="prop">
							<td valign="top" class="name">Name:</td>
							<td valign="top" class="value">${restDetail.name}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">Address:</td>
							<td valign="top" class="value">${restDetail.address}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">Zipcode:</td>
							<td valign="top" class="value">${restDetail.zip}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">Health Rating:</td>
							<td valign="top" class="value">${restDetail.currGrade}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">Number of Health Violations:</td>
							<td valign="top" class="value">${restDetail.redCnt}</td>
						</tr>
						<tr class="prop">
							<td valign="top" class="name">Number of Health Warnings:</td>
							<td valign="top" class="value">${restDetail.yellowCnt}</td>
						</tr>

					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>


