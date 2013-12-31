<%@ include file="/WEB-INF/jsp/include.jsp" %>
<!DOCTYPE html>
<!--[if lt IE 7 ]><html class="ie ie6" lang="es"> <![endif]-->
<!--[if IE 7 ]><html class="ie ie7" lang="es"> <![endif]-->
<!--[if IE 8 ]><html class="ie ie8" lang="es"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="es"> <!--<![endif]-->
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
	<script src="js/shBrushJScript.js"type="text/javascript"/></script>
	<script src="js/shBrushJava.js"type="text/javascript"/></script>
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
			<h1 class="remove-bottom" style="margin-top: 40px">Diferencia entre applicationContext.xml y dispatcher-servlet.xml</h1>
			<a id="articulo" href="http://www.programacionj2ee.com/diferencia-applicationcontext-dispatcher-servlet/" target="_blank">version 1.0</a>
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
		<div class="sixteen column">
			<p>Aunque ambos archivos xml conviven en el mismo directorio, y aparentemente tienen una configuración muy parecida de sus schemas y sirven para lo mismo, configurar beans que sean creados en el despliegue de la aplicación, existen diferencias fundamentales muy fáciles de comprender.</p>
			<h3>applicationContext.xml</h4>
			<p>Documento donde ContextLoaderListener va a buscar la declaración de beans para desplegarlos en el root ServletContext (padre) de la aplicación. Podemos modificar la nomenclatura estándar del archivo donde ContextLoaderListener buscará la declaración de beans utilizando &lt;context-param /&gt; en el web.xml.</p>
			<div id="codigo" class="offset-by-one ten columns">		
				<pre class="brush: java; highlight:[1,3,5];">
					<context-param>
					    <param-name>contextConfigLocation</param-name>
					    <param-value>/WEB-INF/applicationContext.xml</param-value>
					</context-param>
				</pre>
			</div>
			<br class="clear" />
			<p>También podríamos separar mediante comas la configuración en varios archivos para lograr una mejor mantenibilidad.</p>
			<div id="codigo" class="offset-by-one ten columns">		
				<pre class="brush: java; highlight:[1,3,5,7]">
					<context-param>
					    <param-name>contextConfigLocation</param-name>
					    /WEB-INF/context/myContext.xml,
					    /WEB-INF/context/myDAO.xml,
					    /WEB-INF/context/mySecurity.xml
					</context-param>
				</pre>
			</div>
			<br class="clear" />
			<p>Incluso podemos utilizar Ant expressions.</p>
			<div id="codigo" class="offset-by-one ten columns">		
				<pre class="brush: java; highlight:[1,3,5]">
					<context-param>
					    <param-name>contextConfigLocation</param-name>
					    /WEB-INF/context/*.xml
					</context-param>
				</pre>
			</div>
			<br class="clear" />
			<h3>dispatcher-servlet.xml</h4>
			<p>Documento donde DispatcherServlet va a buscar la declaración de beans de los que tiene dependencia directa para su funcionamiento, estos beans NO serán creados en el root ServletContext (padre) de la aplicación, se crearán en un contexto de aplicación hijo propio para cada servlet de una aplicación creada con Spring.</p>
			<p>Esta diferencia es fundamental para resolver la Inyección de Dependencias, puesto que el ámbito de visibilidad solo tiene un camino (hijo &lt; padre), de tal manera que un bean creado en el root ServletContext, no puede resolver una dependencia de otro bean creado en el Contexto de un Servlet (como por ejemplo DispatcherServlet), pero esto si es posible al revés.</p>
			<p>Podemos modificar la nomenclatura estándar del archivo donde DispatcherServlet buscará la declaración de beans utilizando &lt;init-param /&gt; dentro de &lt;servlet />&gt;	en el web.xml.</p>
			<div id="codigo" class="offset-by-one ten columns">		
				<pre class="brush: java; highlight:[1,3,5,7,9]">
					<servlet>
					    <servlet-name>springmvc</servlet-name>
					   	<servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>
					    <init-param>
					    	<param-name>namespace</param-name>
					        <param-value>spring/mvc/springmvc</param-value>
					    </init-param>
					 </servlet>
				</pre>
			</div>
			<br class="clear" />
			<p>De esta forma nuestro archivo xml de configuración quedaría dentro de WEB-INF/spring/mvc/ con el nombre myspringmvc-servlet.xml</p>
		</div>
		<!-- Fin Body
		================================================== -->		
	</div>
	<!-- Primary Page Layout
	================================================== -->
</body>
</html>



