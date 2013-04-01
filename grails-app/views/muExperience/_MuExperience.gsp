<%@ page import="org.grails.ApkCv.MuExperienceController"%>







<div id="update_saveExp">
<g:if test="${flash.message}">
	<div class="message" >
		${flash.message}
	</div>
</g:if>


<table>
	<tbody>

		<tr class="spaceUnder">
			<td valign="top" class="name"><label for="companyName"
				style="font-weight: bold; color: black"><g:message
						code="default.companyName.label" default="Company Name" /> </label></td>
			<td valign="top"
				class="value ${hasErrors(bean: experienceInstance, field: 'companyName', 'errors')}">
				<g:textField name="companyName"
					value="${experienceInstance?.companyName}" size="60" />
			</td>
			<td><g:if
					test="${hasErrors(bean: experienceInstance, field: 'companyName', 'errors')}">
					<jqvalui:renderError for="companyName" style="margin-top: -5px">
						<g:eachError bean="${experienceInstance}" field="companyName">
							<g:message error="${it}" />
						</g:eachError>
					</jqvalui:renderError>
				</g:if></td>

		</tr>

		<tr class="spaceUnder">
			<td valign="top"><label for="title"
				style="font-weight: bold; color: black"><g:message
						code="default.title.label" default="Title" /> </label></td>
			<td valign="top"
				class="value ${hasErrors(bean: experienceInstance, field: 'title', 'errors')}">
				<g:textField name="title" value="${experienceInstance?.title}"
					size="60" />
			</td>
			<td><g:if
					test="${hasErrors(bean: experienceInstance, field: 'title', 'errors')}">
					<jqvalui:renderError for="title" style="margin-top: -5px">
						<g:eachError bean="${experienceInstance}" field="title">
							<g:message error="${it}" />
						</g:eachError>
					</jqvalui:renderError>
				</g:if></td>
		</tr>
		<tr class="spaceUnder">
			<td valign="top"><label for="timePeriod"
				style="font-weight: bold; color: black"><g:message
						code="default.timeperiod.label" /> </label></td>
			<td><g:datePicker name="workFrom"
					value="${experienceInstance?.workFrom}" precision="month"
					noSelection="['':'-Choose-']" relativeYears="[-50..20]" /> - <g:datePicker
					name="workTo" value="${experienceInstance?.workTo}"
					precision="month" noSelection="['':'-Choose-']"
					relativeYears="[-50..20]" /></td>

			<td><g:if
					test="${hasErrors(bean: experienceInstance, field: 'workFrom', 'errors')}">
					<jqvalui:renderError for="workFrom" style="margin-top: -5px">
						<g:eachError bean="${experienceInstance}" field="workFrom">
							<g:message error="${it}" />
						</g:eachError>
					</jqvalui:renderError>
				</g:if></td>
		</tr>


		<tr class="spaceUnder">
			<td valign="top"><label for="currentlyWorking"
				style="font-weight: bold; color: black"><g:message
						code="default.currentlyworking.label"
						default="Currently working here" /> </label></td>
			<td valign="top"
				class="value ${hasErrors(bean: experienceInstance, field: 'currentlyWorking', 'errors')}">
				<g:checkBox value="${experienceInstance?.currentlyWorking}"
					name="currentlyWorking" />
			</td>
			<td><g:if
					test="${hasErrors(bean: experienceInstance, field: 'currentlyWorking', 'errors')}">
					<jqvalui:renderError for="currentlyWorking"
						style="margin-top: -5px">
						<g:eachError bean="${experienceInstance}" field="currentlyWorking">
							<g:message error="${it}" />
						</g:eachError>
					</jqvalui:renderError>
				</g:if></td>
		</tr>


		<tr class="spaceUnder">
			<td valign="top"><label for="description"
				style="font-weight: bold; color: black"><g:message
						code="default.description.label" default="Description" /> </label></td>
			<td valign="top"
				class="value ${hasErrors(bean: experienceInstance, field: 'description', 'errors')}">
				<g:textArea name="description"
					value="${experienceInstance?.description}" size="60" rows="2"
					style='width: 550px; ' />
			</td>
			<td><g:if
					test="${hasErrors(bean: experienceInstance, field: 'description', 'errors')}">
					<jqvalui:renderError for="description" style="margin-top: -5px">
						<g:eachError bean="${experienceInstance}" field="description">
							<g:message error="${it}" />
						</g:eachError>
					</jqvalui:renderError>
				</g:if></td>
		</tr>

	</tbody>
</table>

<div class="buttons" >

	<span class="button">
	 <g:submitToRemote
			controller="MuExperience" action="saveMuExperience" 
			value="dd" update="update_saveExp"  >
		</g:submitToRemote> <%--		<g:actionSubmit class="cancel" action="cancel"--%> <%--			value="${message(code: 'default.button.cancel.label', default: 'Cancel')}"--%>
		<%--			onclick="return confirm('${message(code: 'default.button.cancel.confirm.message', default: 'Are you sure?')}');" />--%>

	</span>

</div>

</div>
