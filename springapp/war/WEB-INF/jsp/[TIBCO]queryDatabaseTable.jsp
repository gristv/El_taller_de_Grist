<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"
	import="java.util.*" %>
	
<html>
	<head>
		<title>TIBCO Designer Tutorial - Query Database Table - Xmarter TIBCO Training Center - TIBCO Tutorials - TIBCO Trainer</title>
		<meta name="Description" content="In this TIBCO tutorial, TIBCO Certified Trainer Jazon Samillano of Xmarter, Inc. shows you how to query data in a database table using TIBCO Designer.">
		<meta name="Keywords" content="tibco, tibco architects, tibco consultants, tibco developers, tibco experts, tibco training, tibco tutorials, eai, businessworks, bw, enterprise message service, ems, general interface, gi, businessevents, business events, be, businessstudio, business studio">
		
		<style type="text/css">
			h1 { font-family: Arial, Verdana; font-size: 14pt; margin-top: 3; }
		</style>
	</head>
	<body leftmargin="0" topmargin="0">

		<table align="center">
			<tr>
				<td class="info">
					<h1 align="center">TIBCO Designer Tutorial - Query Database Table</h1>

					<br />
					
					This <b>TIBCO tutorial</b> shows you how to use <b>TIBCO Designer</b> to connect to a database and query a table.  The target audience are <b>TIBCO developers</b> or those interested in becoming one.  You will really enjoy how easy this is to do in TIBCO Designer.  In TIBCO, the task can be performed without having to know the correct syntax for connecting to a database and performing the query.  TIBCO Designer only requires that you configure a <b>JDBC Connection</b> shared resource and a <b>JDBC Query</b> activity.<br /><br />

					In this tutorial, we will use an <b>Oracle</b> database and a <b>BOOK</b> table in that database.  Here is the script to create the BOOK table if you would like to follow along:
					
<pre>
CREATE TABLE BOOK
(	
    BOOK_ID     NUMBER, 
    CATEGORY    VARCHAR2(50 BYTE), 
    TITLE       VARCHAR2(100 BYTE), 
    LANG        VARCHAR2(50 BYTE), 
    AUTHOR      VARCHAR2(300 BYTE), 
    YEAR        NUMBER, 
    PRICE       NUMBER, 
    CONSTRAINT  BOOK_PK PRIMARY KEY (BOOK_ID) ENABLE
) ;

INSERT INTO BOOK 
(BOOK_ID, CATEGORY, TITLE, LANG, AUTHOR, YEAR, PRICE) 
VALUES 
(1, 'Sales', 'Soft Selling in a Hard World', 
'en', 'Jerry Vass', 1998, 11);

INSERT INTO BOOK 
(BOOK_ID, CATEGORY, TITLE, LANG, AUTHOR, YEAR, PRICE) 
VALUES 
(2, 'Self-Development', 'Thinkertoys', 
'en', 'Michael Michalko', 2006, 13.57);

INSERT INTO BOOK 
(BOOK_ID, CATEGORY, TITLE, LANG, AUTHOR, YEAR, PRICE) 
VALUES 
(3, 'Persuasion', 'Subliminal Persuasion', 
'en', 'Dave Lakhani', 2008, 16.47);
</pre>
					
					Now open up <b>TIBCO Designer</b>, and follow these steps:
					
					<ol>
					    <li>Create a new empty project called <b>XmarterTIBCOTutorials</b>.</li>
					    <li>
					        For the sake of good project organization, create the following directory structure on your project:
					        <ul>
					            <li>Inside the XmarterTIBCOTutorials root folder, create a folder called <b>QueryDBTable</b>.</li>
					            <li>Inside the XmarterTIBCOTutorials root folder, create a folder called <b>SharedResources</b>.</li>
					            <li>Inside the SharedResources folder, create a folder called <b>Connections</b>.</li>
					            <li>Inside the SharedResources/Connections folder, create a folder called <b>JDBC</b>.</li>
					        </ul>
					    </li>
					    <li>
					        Inside the SharedResources/Connections/JDBC folder, add a <b>JDBC Connection</b> shared resource.  Configure the resource as follows:
					        <ul>
					            <li>Rename the resource to <b>JDBCConnection</b> (no space).</li>
					            <li>In the <b>JDBC Driver</b> dropdown box, choose <b>tibcosoftware.jdbc.oracle.OracleDriver</b>.</li>
					            <li>Enter your Oracle database parameters in the <b>Database URL</b> textbox.  For our case, we have a value of <b>jdbc:tibcosoftwareinc:oracle://localhost:1521;SID=XE</b>.</li>
					            <li>Enter your Oracle database username in the <b>User Name</b> textbox.</li>
					            <li>Enter your Oracle database password in the <b>Password</b> textbox.</li>
					            <li>Click on the <b>Test Connection</b> button.  If you have entered the correct values in the JDBC Connection shared resource, you should see a message saying "<b>JDBC connection test successful.</b>"</li>
					        </ul>
					    
					    </li>
					    <li>Inside the QueryDBTable folder, create a new process definition called <b>GetBooks</b>.</li>
					    <li>
					        In the GetBooks process definition, add a <b>JDBC Query</b> activity.  Configure the JDBC Query activity as follows:
					        
					        <ul>
					            <li>
					                In the <b>Configuration</b> tab of the activity:
					                
					                <ul>
					                    <li>Change the <b>Name</b> of the activity from <b>JDBC Query</b> to <b>Get Books</b>.</li>
					                    <li>In the <b>JDBC Connection</b> field, click on the <b>Browse resources</b> button.  On the <b>Select a Resource</b> dialog box that comes up, select the <b>JDBCConnection</b> shared resource, and click OK.</li>
					                    <li>In the SQL Statement field, enter:  <font face="Courier New"><b>SELECT * FROM BOOK</b></font></li>
					                </ul>
					            </li>
					            <li>
					                Go to the <b>Output</b> tab of the activity:
					                <ul>
					                    <li>You will see a <font color="red"><b>resultSet</b></font> warning.  Click on the <b>Fetch</b> button below.  This will fetch the resultSet structure of the SQL statement.  After you click the button, the warning should be replaced with a resultSet structure.  If not, check to make sure your SQL Statement in the Configuration tab does not contain a misspelling.</li>
					                </ul>
					            </li>
					            <li>Click on the <b>Apply</b> button on the activity, and then save the project.</li>
					        </ul>
					    </li>
					    <li>Create a transition line from the Start activity to the JDBC Query activity and another from the JDBC Query activity to the End activity.</li>
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
					    <li>To check the output, click on the JDBC Query activity, and go to the <b>Output</b> tab.  You should see three book records in that tab.</li>
					</ol>
					
					Now, wasn't that easy?  <b>No coding required!</b>  Once you are familiar with the use of TIBCO Designer, this entire task of connecting to a database and querying a table could've been accomplished in less than five minutes.  The beautiful thing is the fact that you did not need to know any programming language syntax for database operations.  All you had to do was <b>add and configure</b> a JDBC Connection and a JDBC Query activity, and you're done.  As I've said in previous tutorials, this is one of the reasons why I truly enjoy my work as a <b>TIBCO consultant</b>.  TIBCO Software, Inc. deserves great credit for creating a wonderful tool for application developers.

					<br /><br /><br />					
					
				</td>
			</tr>
		</table>


	</body>
</html>