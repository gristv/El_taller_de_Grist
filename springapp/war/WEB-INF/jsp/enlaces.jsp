<%@ include file="/WEB-INF/jsp/include.jsp" %>
<html>
	<head>
		<title>Enlaces</title>
		
		<!-- Configuración de SyntaxHighlighter para js y java-->
		<script src="js/shCore.js" type="text/javascript"></script>
		<script src="js/shBrushJScript.js"type="text/javascript"/></script>
		<script src="js/shBrushJava.js"type="text/javascript"/></script>
		<link rel="stylesheet" type="text/css" href="css/shCoreEclipse.css" />
		<link rel="stylesheet" type="text/css" href="css/shThemeEclipse.css" />
		<script type="text/javascript">
     			SyntaxHighlighter.all();
		</script>		
		<!-- Fin configuración de SyntaxHighlighter -->
		
		<style type="text/css">
			a:link {text-decoration:none; color: #000080;} /* Link no visitado*/
			a:visited {text-decoration:none; color:#008080} /*Link visitado*/
			a:active {text-decoration:none; color:#708090; background:#EEEEEE} /*Link activo*/
			a:hover {text-decoration:underline; color:#708090; background: #EEEEEE} /*Mause sobre el link*/
			#codigo{width: 80%;font-size: 12px;font-family: "Lucida Console", Courier, monospace;}
		</style>
		
	</head>
	<body>
		<div id="codigo">		
			<pre class="brush: js; toolbar: true;">
				/*
				 * Añadir contenido estático.
				 *
				 * La configuración de este plugin nos plantea el problema de añadir js y css a nuestra app.
				 * 
				 * En esta versión (2.5 Spring MVC), la solución más rápida para servir contenido estático
				 * (css, img o js) es colocar los recursos por encima de la carpeta 'WEB-INF' y debajo de la carpeta 'war' 
				 * e invocar los contenidos invocando la ruta física. 
				 *
				 * Si tenemos una estructura como la siguiente:
				 *
				 *	+ war
				 *		- js
				 * 			algo.js
				 *
				 * Podemos invocar el archivo de la siguente forma en la jsp 
				 *	
				 *		<script src="js/algo.js"type="text/javascript"/></script>
				 *
				 * Tomcat resolverá la ruta de la siguiente forma:
				 *
				 * 		http://host/application-path/js/algo.js
				 *
				 * No es necesario tocar el web.xml ni el servlet.xml
				 *
				 * Para versiones posteriores de Spring ver la documentación (mvc:resources)
				 * 
				 */
				
			    function foo()
			    {
			        if (counter == 10)
			            return;
			        // it works!
			    }
			</pre>
		</div>
		<br><a href="http://books.sonatype.com/mvnex-book/reference/index.html">Maven by Example</a>
		<br><a href="http://javalearning.wikispaces.com/sumario.curso1#maven">Curso Maven</a>
		<br><a href="http://spring.io/">Página Spring</a>
		<br><a href="http://hop2croft.wordpress.com/2011/09/10/ejemplo-basico-de-spring-mvc-con-maven/">Ejemplo básico de Spring MVC con Maven </a>
		<br><a href="http://www.davidmarco.es/tutoriales/spring-mvc-sbs/index.html">Curso spring</a>
		<br><a href="http://www.tutorialspoint.com/spring/index.htm">Spring Framework Tutorial [TurorialsPoint]</a>
		<br><a href="http://javalearning.wikispaces.com/spring.beans.factory">spring.beans.factory</a>
		<br><a href="http://www.springhispano.org/?q=node/222">Navegación de JSP en Spring</a>
		<br><a href="http://chuwiki.chuidiang.org/index.php?title=Controladores_con_anotaciones_en_Spring_MVC_Framework"> Controladores con anotaciones en Spring MVC Framework</a>
		<br><a href="http://www.springhispano.org/?q=node/2860">Acceso a datos con JDBC [Capitulo 13 Documentacion de Referencia v3.1]</a>
		<br><a href="http://introcs.cs.princeton.edu/java/11cheatsheet/">Chuleta java</a>
		<br><a href="http://javabeginnerstutorial.com/">Tutoriales java</a>
		<br><a href="http://www.tutorialspoint.com/sqlite/pdf/sqlite_java.pdf">Tutorial SQLite</a>
		<br><a href="http://www.davidmarco.es/archivo">Página de David de Marco</a>
		<br><a href="http://www.programacionj2ee.com/manual-de-spring/">Buen manual de Spring</a>
		<br><a href="http://docs.spring.io/spring/docs/3.2.x/spring-framework-reference/htmlsingle/#spring.tld.message">Referencia Spring messages</a>
		<br><a href="http://www.roseindia.net/tutorial/spring/spring3/web/spring-3-mvc-registration-example.html">Formulario Rose India</a>
		<br><a href="http://krams915.blogspot.com.es/2011/01/spring-mvc-3-hibernate-annotations.html">Otro manual de formularios. Lista con todos los  métodos</a>
		<br><a href="http://es.scribd.com/doc/20156448/Multi-Action-Controller-With-Validation">Tutorial validaciones multiaction</a>
		<br><a href="http://www.programacionj2ee.com/inyeccion-de-dependencias-en-spring/">Inyección de dependencias en Spring</a>
		<br><a href="http://programandoointentandolo.com/2013/05/inyeccion-de-dependencias-en-spring.html">Inyección de dependencias (simple y con annotatios)</a>
		<br><a href="http://www.mkyong.com/tutorials/spring-mvc-tutorials/">Tutoriales Mkyong</a>
		<br><a href="http://www.springbyexample.org/examples/index.html">Spring by Example</a>
		<br><hr><br>
		<a href="<c:url value="hello.htm"/>">Home</a>
		<br><hr>
		<br><a href="http://www.getskeleton.com/">Skeleton CSS</a>
		<br><a href="http://alexgorbatchev.com/SyntaxHighlighter">SyntaxHighlighter</a>
		<br><a href="http://www.colorschemedesigner.com/">Generador de paletas de colores</a>
		<br><hr>
		<br><a href="https://www.openshift.com/developers/tomcat">Opensshift</a>
		<br><a href="http://xmeele.wordpress.com/2013/03/27/guia-completa-de-openshift-de-red-hat-para-principiantes-windows/">Guia completa de OPENSHIFT de RED HAT para principiantes (Windows)</a>
		<br><a href="http://ebookbrowsee.net/">Buscador de libros pdf.</a>
		<br><a href="http://www.java2s.com/">Java2 >> Manuales y código</a>
	</body>
</html>