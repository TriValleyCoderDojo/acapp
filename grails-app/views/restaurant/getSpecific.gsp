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
					</tbody>
				</table>
			</div>
		</div>
	</body>
</html>


