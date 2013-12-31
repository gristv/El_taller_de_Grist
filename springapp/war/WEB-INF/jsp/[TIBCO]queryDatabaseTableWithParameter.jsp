<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"
	import="java.util.*" %>
	
<html>
	<head>
		<title>TIBCO Designer Tutorial - Query Database Table with Parameters - Xmarter TIBCO Training Center - TIBCO Tutorials - TIBCO Trainer</title>
		<meta name="Description" content="In this TIBCO tutorial, TIBCO Certified Trainer Jazon Samillano of Xmarter, Inc. shows you how to query data in a database table with a WHERE clause containing parameters using TIBCO Designer.">
		<meta name="Keywords" content="tibco, tibco architects, tibco consultants, tibco developers, tibco experts, tibco training, tibco tutorials, eai, businessworks, bw, enterprise message service, ems, general interface, gi, businessevents, business events, be, businessstudio, business studio">
		
		<style type="text/css">
			h1 { font-family: Arial, Verdana; font-size: 14pt; margin-top: 3; }
		</style>
	</head>
	<body leftmargin="0" topmargin="0">

		<table align="center">
			<tr>
				<td class="info">
					<h1 align="center">TIBCO Designer Tutorial - Query Database Table<br />with Parameters</h1>
					
					<br />
					
					This <b>TIBCO tutorial</b> shows you how to use <b>TIBCO Designer</b> to connect to a database and query a table with a WHERE clause containing a parameter.  Instead of just selecting all the records from the database table, we will select only the ones that meet a certain criteria.  The target audience are <b>TIBCO developers</b> or those interested in becoming one.<br /><br />

					The prerequisite to this tutorial is the tutorial titled <a href="tibco-designer-tutorial-query-database-table-text.jsp" target="_blank">TIBCO Designer Tutorial - Query Database Table</a>.  Make sure you complete that prerequisite before proceeding with this tutorial.<br /><br />
					
					In this tutorial, we will continue to use the <b>Oracle</b> database and the <b>BOOK</b> table in that database.  Instead of selecting all the book records like we did in the prerequisite tutorial, here we will only select the books published after the year 2000.  We will use a WHERE clause with a parameter in our SQL statement to accomplish this.

					Open up TIBCO Designer, and follow these steps:
					
					<ol>
					    <li>Open the existing project called <b>XmarterTIBCOTutorials</b>.</li>
					    <li>
					        In the GetBooks process definition, click on the <b>JDBC Query</b> activity.  Change the JDBC Query activity as follows:
					        
					        <ul>
					            <li>
					                In the <b>Configuration</b> tab of the activity:
					                
					                <ul>
					                    <li>
					                    	At the SQL Statement field, add a WHERE clause to the existing SQL statement.  The final statement should look like this:<br />
					                    	<font face="Courier New"><b>SELECT * FROM BOOK WHERE YEAR > ?</b></font><br />
					                    	
					                    	The <b>?</b> represents a parameter that can accept data passed into it.  You will notice on the right-hand side of the SQL Statement field that there is now a warning (an exclamation point).  This means that you must create a corresponding parameter element in the <b>Prepared Parameters</b> section.
					                    </li>
					                </ul>
					            </li>
					            <li>In the <b>Prepared Parameters</b> section, click on the plus button to add a new parameter.  Give the parameter the same name as the field.  For our case, name the parameter <b>YEAR</b>.</li>
					            <li>Go to the <b>Input</b> tab of the activity.  In the <b>Activity Input</b> section, expand the <b>jdbcQueryActivityInput</b> node, and you will notice that there is a <b>YEAR</b> element that is colored red.  This means that it is a required field that you must now fill out.  Type <b>2000</b> into the field.</li>
					            <li>Click on the <b>Fetch</b> button below.  This will fetch the resultSet structure of the SQL statement.</li>
					            <li>Click on the <b>Apply</b> button on the activity, and then save the project.</li>
					        </ul>
					    </li>
						<li>
							Validate the resource and make sure there are no errors before testing the process.
							<ul>
								<li>To do this, deselect all the activities by clicking on a white space inside the process definition. Then click on the <b>Validate Resource</b> button on the top section of TIBCO Designer.</li>
							</ul>
						</li>
						<li>
							Go to the <b>Tester</b> tab on the left-hand side of TIBCO Designer. Click on the <b>Start testing</b> button. In the dialog box that comes up, click on the <b>Load & Start Current</b> button.
							<ul>
								<li>The process should now execute.</li>
							</ul>
						</li>
					    <li>To check the output, click on the JDBC Query activity, and go to the <b>Output</b> tab.  Unlike in the prerequisite tutorial, here you should see only two book records instead of three in the Output tab.  This is because one of the three records in the BOOK table has a year that is older than 2000.</li>
					</ol>
					
					Once again, we have another demonstration of how easy it is to do database application programming with <b>TIBCO</b>.  I hope this tutorial has been helpful to you.

					<br /><br /><br />					
					
				</td>
			</tr>
		</table>

	</body>
</html>