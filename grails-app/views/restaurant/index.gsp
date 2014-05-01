<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main"/>
		<title>Restaurant Search</title>
	</head>
	<style>
	H1 {
	"font-family: Arial"
	
	}
	
	p {
	"font-family: Arial"
	}
	
	label {
	"font-family: Arial"
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
		<div class="body">
			<br>
			<H1>Welcome to Restaurant Search Page</H1>
			<br>
			<g:form action="getSpecific" method="GET" >
				<div class="dialog">
					<table>
						<tbody>
							<tr><label>Search for a specific restaurant by name</label></tr>
							<tr class="prop">
								<td valign="top" class="name">
									<label>Restaurant Name</label>
								</td>
								<td valign="top" class="value">
									<g:textField name="rest_name" value=""/>
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<g:submitButton name="getSpecificSubmit" value="Submit" />
			</g:form>
		</div>
	</body>
</html>


