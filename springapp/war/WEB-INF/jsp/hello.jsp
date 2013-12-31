<%@ include file="/WEB-INF/jsp/include.jsp" %>
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
		h1,h2,h3,h4,h5{color:#0078f3;}
		p{margin-bottom:0;}
		hr{margin-bottom:10px;}
		#articulo{font-size: 10px;}
		#codigo{width: 80%;font-size: 12px;}
		#formulario{background-color:#eeeff0;padding-top:20px;}
		.container{margin-bottom:40px;}
		.error { color:#f30027; }
		/** Tratamiento de botonoes como links */
		button {
    		overflow: visible;
    		width: auto;
		}
		button.link {
		    font-family: "Verdana" sans-serif;
		    font-size: 0.8em;
		    text-align: left;
		    color: blue;
		    background: none;
		    margin: 0;
		    padding: 0;
		    border: none;
		    cursor: pointer;
		    
		    -moz-user-select: text;
		 
		    /** override all your button styles here if there are any others */
		}
		button.link span {
		    text-decoration: underline;
		}
		button.link:hover span,
		button.link:focus span {
		    color: black;
		}
		/** Fin tratamineto de botones como link*/
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

</head>
<body>
	<!-- Primary Page Layout
	================================================== -->
	<div class="container">
	
		<!-- Cabecera
		================================================== -->
		<div class="sixteen columns">
			<h1 class="remove-bottom" style="margin-top: 40px"><fmt:message key="list.heading"/></h1>
			<a id="articulo" href="" target="">version 1.0</a>
			<hr />
		</div>
		
		<div class="sixteen columns">
			<a href="<c:url value="cargaNewProducto.htm"/>">New Product</a>
			<hr />
		</div>
		<!-- Fin Cabecera
		================================================== -->
		
		<!-- Body
		================================================== -->
		
		<div class="six columns">
			<h3>Enlaces</h3>
			<br><a href="http://www.davidmarco.es/spring-mvc" target="_blank">Curso spring</a>
			<br><a href="enlaces.htm">Enlaces</a>
			<br><a href="diferencias.htm">Diferencia entre applicationContext.xml y dispatcher-servlet.xml</a>
		</div>	

		<div class="offset-by-one eigth columns">
			<h3>Products</h3>
			<hr/>
			<h4><fmt:message key="greeting"/> <c:out value="${model.now}"/></h4>
			<hr/>
			<c:forEach items="${model.products}" var="prod">
				<div class="five columns">
					<form action="cargaProducto.htm" method="post" name="formulario" id="formalario">
						<input id="secretValue" name="secretValue" type="hidden" value="<c:out value="${prod.id}"/>"/>
						<button type="submit" class="link"><span><c:out value="${prod.description}"/></span></button>
					</form>
				</div>
				<div class="offset-by-one one columns">
					<i>$<c:out value="${prod.price}"/></i>
				</div>
				<br class="clear" /> 
			</c:forEach>
   			<hr/>
		</div>
		<!-- Fin Body
		================================================== -->
	</div>
	<!-- Primary Page Layout
	================================================== -->			
  </body>
</html>
    	
