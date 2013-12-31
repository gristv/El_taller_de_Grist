<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
	pageEncoding="ISO-8859-1"
	import="java.util.*" %>

<html>
	<head>
		<title>TIBCO Designer Tutorial - Hello World - From TIBCO Certified Trainer Jazon Samillano</title>
		<meta name="Description" content="Start learning TIBCO with this easy-to-follow tutorial on how to write output to a file using TIBCO Designer.">
		<meta name="Keywords" content="tibco, tibco consulting firms, services, tibco architects, tibco consultants, tibco developers, tibco experts, tibco training, tibco tutorials, eai, businessworks, bw, enterprise message service, ems, general interface, gi, businessevents, business events, be, businessstudio, business studio">
		
		
		
		<style type="text/css">
			h1 { font-family: Arial, Verdana; font-size: 14pt; margin-top: 3; }
		</style>
	</head>
    <body leftmargin="0" topmargin="0">
    
    	
		
		<table align="center">
		    <tr>
		        <td class="info">
		        	<h1 align="center">TIBCO Designer Tutorial - Hello World</h1>
		        	
					<br />
					
		        	
		        	
					This <b>TIBCO tutorial</b> teaches you how to create a process definition that writes the words "Hello, World!" into a file using <b>TIBCO Designer</b>. You will really appreciate how easy this is to do with TIBCO. The neat thing about application development with TIBCO Designer is that you do not have to know the programming syntax on how to perform most of the tasks. Take, for example, the syntax for writing to a file so that you can output "Hello, World!" into the file. This task requires knowledge of the file writing syntax specific to the programming language being used. With the TIBCO Designer tool, all you have to do is place the appropriate activity (in this case, the <b>Write File</b> activity) into the process. After that, you provide the file path and text content of "Hello, World!" into the activity configuration. Then you're done! No need to know the syntax and the use of the appropriate classes behind the scenes. This tutorial is a good demonstration of <b>how TIBCO increases developer productivity</b>. Enjoy!<br /><br />

					The writing of output into a file can be achieved by creating and configuring a Write File activity in TIBCO Designer. The steps to do this are as follows:

					<ol>
						<li>Create a new empty project called <b>XmarterTIBCOTutorials</b>.</li>
						<li>Inside the XmarterTIBCOTutorials root folder, create a new folder called <b>BusinessProcesses.</b></li>
						<li>Inside the BusinessProcesses folder, create a new folder called <b>HelloWorld</b>.</li>
						<li>Inside the HelloWorld folder, add a process definition called <b>HelloWorld</b>.</li>
						<li>
							Add a <b>Write File</b> activity into the process definition. Configure the Write File activity as follows:
							<ul>
								<li>
									Go to the <b>Input</b> tab of the activity:
									<ul>
										<li>In the <b>fileName</b> field, type <b>"C:\HelloWorld.txt"</b>.</li>
										<li>In the <b>textContent</b> field, type <b>"Hello, World!"</b></li>
									</ul>
								</li>
								<li>When done, click the <b>Apply</b> button in the Write File activity and save the whole project.</li>
							</ul>
						</li>
						<li>Create a transition line from the Start activity to the Write File activity and another from the Write File activity to the End activity.</li>
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
						<li>To check the output, go to <b>My Computer</b>, and open the <b>C drive</b>. Check to see that it contains a <b>HelloWorld.txt</b> file with a <b>"Hello, World!"</b> text written to the file.</li>
					</ol>

					I hope this <b>TIBCO tutorial</b> has been helpful to you. As you can see in the steps above, no coding is required for you to write text into a file. The main bulk of the work is really in the Write File activity. The steps where I had you create the project folders were just for good project organization. Those steps were not necessary to the actual functionality.

					This is just one of many instances in which TIBCO dramatically boosts developer productivity. In my opinion, developer productivity is one of the reasons that make TIBCO such a spectacular tool for application development.
					
					<br /><br /><br />
					
				</td>
			</tr>
		</table>

		

	</body>
</html>