
<%@ page import="org.grails.ApkCv.MuCVController" %>
<resource:accordion skin="default" />
<head>

<meta charset="utf-8" />
<meta name="layout" content="main" />
<%--

stylei css'e taşı

--%>

<style type="text/css" media="screen">

#accordion {  
    width: 960px;  
    background-color: white;
    background-image: none;
    margin-left: -2px;
}  

#accordion .ui-accordion-content {

	background-color: #f4f4f4;
	color: #777;
	font-size: 10pt;
	line-height: 16pt;
}

#accordion .ui-accordion-header {  
    width: 50%;
	margin-left: 20%;
	margin-bottom: 3%;
	background: lightgray;
	border: 1px dashed #E3E3E3;
	text-align: center;
	font-weight: bold;
	font-size: 16px;
	color: #0077B5;
	background-color: #F8F8F8;

}

#accordion .ui-accordion-content > * {
	margin: 0;
	background-color: #f4f4f4;;
} 

#accordion .ui-accordion-content-active {
	background-color: #f4f4f4;;
}

#accordion .ui-widget-content{
	background-image: none;
	border-top-color: #aaaaaa;
	border-bottom-color: #aaaaaa;
}

#accordion .ui-widget{
	background-image: none;
	border-top-color: #aaaaaa;
	border-bottom-color: #aaaaaa;
	width: 960px;
}

.errors {
      background-color: red;
   }
   
   tr.spaceUnder > td
{
  padding-bottom: 1em;
}

.buttons input.cancel { 
    background: transparent url(../images/cancel.png) 5px 50% no-repeat; 
    padding-left: 28px; 
} 

</style>

<title>jQuery UI Accordion - Default functionality</title>
<link rel="stylesheet"
	href="http://code.jquery.com/ui/1.10.2/themes/smoothness/jquery-ui.css" />
<script src="http://code.jquery.com/jquery-1.9.1.js"></script>
<script src="http://code.jquery.com/ui/1.10.2/jquery-ui.js"></script>

<script>
	$(function() {
		$("#accordion").accordion({
			collapsible : true,
			active : false
		});
		$("#accordion").accordion("option", "icons", null);
	});
</script>


<title></title>
</head>

<body>

	<table>
		<tr>
			<td>
				<div id="accordion">
					<h3>Section 1</h3>
					<div>
						<g:form  name="experienceAddForm" >
						
							<g:render template="/muExperience/MuExperience" />
					
						</g:form>

	
						<g:form  name="experienceListForm" >
						
							<g:render template="/muExperience/MuExperienceList" model="[MuExperience: MuExperienceLiest]"/>
					
						</g:form>

					</div>


				</div>
			</td>
		</tr>
	</table>



</body>


<%--<richui:accordion>
            <g:each in="${regionInstanceList}" status="i" var="regionInstance">
                <richui:accordionItem id="${regionInstance.regionName}" caption="${regionInstance.regionName}" 
                  expanded="${regionInstance.regionName == selectedRegionName}">
                    <g:each var="rc" in="${regionInstance.countries}">
                        <g:set var="countryId" value="${rc.country.id}"/>
                        <g:link controller="${controller}" action="${action}" params="[country_id:countryId]">
                            ${rc.country?.encodeAsHTML()}
                        </g:link><br/>
                    </g:each>                       
                </richui:accordionItem>
            </g:each>
        </richui:accordion>   

--%>