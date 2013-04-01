<html>
<head>
<meta name="layout" content="main" />
<jqgrid:cssResources />
<jq:resources />
<jqui:resources />
<jqgrid:resources />


<script type="text/javascript">
	        $(document).ready(function() {

	        	jQuery("#education").jqGrid({
 	
                         
		url:'listJSON',
		editurl:'editJSON'
		colNames:['Name of School', 'Degree', 'Field of Study']
		colModel:[		  		{name:'nameOfSchool', editable: true},
		  		{name:'degree', editable: true},
                {name:'fieldOfStudy', editable: true}
                ],
		sortname: 'nameOfSchool',
			 caption: 'Education',
			  height:"300",
			pager: '#pager1',
		autowidth:'true', scrollOffset='0', viewrecords='true', showPager='true', gridview: true,
		
		datatype:'json'
               });

	        	jQuery('#education').jqGrid('navGrid','#pager1',{edit:false,add:false,del:true,search:false});
	        }
	 
       </script>

</head>
<body>

<script type="text/javascript">
	        $(document).ready(function() {

	        	jQuery("#education").jqGrid({
 	
                         
		url:'listJSON',
		editurl:'editJSON'
		colNames:['Name of School', 'Degree', 'Field of Study']
		colModel:[		  		{name:'nameOfSchool', editable: true},
		  		{name:'degree', editable: true},
                {name:'fieldOfStudy', editable: true}
                ],
		sortname: 'nameOfSchool',
			 caption: 'Education',
			  height:"300",
			pager: '#pager1',
		autowidth:'true', scrollOffset='0', viewrecords='true', showPager='true', gridview: true,
		
		datatype:'json'
               });

	        	jQuery('#education').jqGrid('navGrid','#pager1',{edit:false,add:false,del:true,search:false});
	        }
	 
       </script>

	<g:formRemote url="[action: 'addEducation']" name="updateEducationForm">
		<div>




			<jqgrid:wrapper id="#education" name="education" />



			<g:textField name="nameOfSchool1" value="" />
			<g:textField name="degree1" value="" />
			<g:textField name="fieldOfStudy1" value="" />
			<g:submitButton name="addEducation" id="add_button" />

		</div>



	</g:formRemote>




</body>
</html>