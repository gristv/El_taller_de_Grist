<%@ include file="/WEB-INF/jsp/include.jsp" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="es"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="es"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="es"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="es"> <!--<![endif]-->
<head>
<head>

	<!-- Basic Page Needs
  ================================================== -->
	<meta charset="iso-8859-1">
	<title><fmt:message key="title"/></title>
	<meta name="description" content="Taller spring">
	<meta name="author" content="Daniel Santo Tomás">

	<!-- Mobile Specific Metas
  ================================================== -->
	<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

	<!-- CSS
  ================================================== -->
	<link rel="stylesheet" type="text/css" href="css/base.css" />
	<link rel="stylesheet" type="text/css" href="css/layout.css" />
	<link rel="stylesheet" type="text/css" href="css/skeleton.css" />
	<link rel="stylesheet" type="text/css" href="css/shCoreEclipse.css" />
	<link rel="stylesheet" type="text/css" href="css/shThemeEclipse.css" />
	<style type="text/css">
		h1{color:#0078f3;}
		p{margin-bottom:0;}
		hr{margin-bottom:10px;}
		#articulo{font-size: 10px;}
		#codigo{width: 80%;font-size: 12px;font-family: "Lucida Console", Courier, monospace;}
		#formulario{background-color:#eeeff0;padding-top:20px;}
		.container{margin-bottom:40px;}
		.error { color:#f30027; }
	</style>
	
	<!-- JS
  ================================================== -->
	<script src="js/shCore.js" type="text/javascript"></script>
	<script src="js/shBrushJScript.js" type="text/javascript"></script>
	<script src="js/shBrushJava.js" type="text/javascript"></script>
	<script type="text/javascript">
   			SyntaxHighlighter.all();
	</script>	
	
	<!--[if lt IE 9]>
		<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
	<![endif]-->

	<!-- Favicons
	================================================== 
	<link rel="shortcut icon" href="images/favicon.ico">
	<link rel="apple-touch-icon" href="images/apple-touch-icon.png">
	<link rel="apple-touch-icon" sizes="72x72" href="images/apple-touch-icon-72x72.png">
	<link rel="apple-touch-icon" sizes="114x114" href="images/apple-touch-icon-114x114.png">-->

</head>
<body>
	<!-- Primary Page Layout
	================================================== -->
	<div class="container">
	
		<!-- Cabecera
		================================================== -->
		<div class="sixteen columns">
			<h1 class="remove-bottom" style="margin-top: 40px"><fmt:message key="saveproducto.heading"/></h1>
			<a id="articulo" href="" target="">version 1.0</a>
			<hr />
		</div>
		
		<div class="sixteen columns">
			<a href="<c:url value="hello.htm"/>">Home</a>
			<hr />
		</div>
		<!-- Fin Cabecera
		================================================== -->
		
		<!-- Body
		================================================== -->
		<div id="formulario" class="offset-by-one twelve columns">
			<form:form action="saveProduct.htm">
			    <form:hidden path="id"/>
				<div class="two columns">
					<h5>Descripcion</h5>
				</div>
				<div class="two columns">
					<form:input path="descripcion"/>
				</div>
				<div class="seven columns">
					<form:errors path="descripcion" cssClass="error"/>
				</div>
				<br class="clear"/>
				<div class="two columns">
					<h5>Precio</h5>
				</div>
				<div class="two columns">
					<form:input path="precio"/>
				</div>
				<div class="seven columns">
					<form:errors path="precio" cssClass="error"/>
				</div>
				<br class="clear"/>
				<div class="offset-by-one three columns">
					<input type="submit" align="center" value="Execute">
				</div>
			</form:form>
		</div>	
		<!-- Fin Body
		================================================== -->
	</div>
	<!-- Primary Page Layout
	================================================== -->			
  </body>
</html>

