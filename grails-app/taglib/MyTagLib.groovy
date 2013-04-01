
import org.codehaus.groovy.grails.plugins.web.taglib.FormTagLib
import org.codehaus.groovy.grails.plugins.web.taglib.JavascriptTagLib;

class MyTagLib extends JavascriptTagLib {
	static namespace = "my"
	
	   /**
		* ajaxButton tag, this is a modified version of the default
		* grails submitToRemote tag to work with grails webflows.
		* Usage is identical to submitToRemote with the only exception
		* that a 'name' form element attribute is required. E.g.
		* <my:ajaxButton name="myAction" value="myButton ... />
		*
		* @see http://www.grails.org/WebFlow
		* @see http://www.grails.org/Tag+-+submitToRemote
		* @param Map attributes
		* @param Closure body
		*/
	   def ajaxButton = {attrs, body ->
		   // get the jQuery version
		   def jQueryVersion = grailsApplication.getMetadata()['plugins.jquery']
	
		   // fetch the element name from the attributes
		   def elementName = attrs['name'].replaceAll(/ /, "_")
	
		   // generate a normal submitToRemote button
		   def button = submitToRemote(attrs, body)
	
		   /**
			* as of now (grails 1.2.0 and jQuery 1.3.2.4) the grails webflow does
			* not properly work with AJAX as the submitToRemote button does not
			* handle and submit the form properly. In order to support webflows
			* this method modifies two parts of a 'normal' submitToRemote button:
			*
			* 1) replace 'this' with 'this.form' as the 'this' selector in a button
			*    action refers to the button and / or the action upon that button.
			*    However, it should point to the form the button is part of as the
			*    the button should submit the form data.
			* 2) prepend the button name to the serialized data. The default behaviour
			*    of submitToRemote is to remove the element name altogether, while
			*    the grails webflow expects a parameter _eventId_BUTTONNAME to execute
			*    the appropriate webflow action. Hence, we are going to prepend the
			*    serialized formdata with an _eventId_BUTTONNAME parameter.
			*/
		   if (jQueryVersion =~ /^1.([1|2|3]).(.*)/) {
			   // fix for older jQuery plugin versions
			   button = button.replaceFirst(/data\:jQuery\(this\)\.serialize\(\)/, "data:\'_eventId_${elementName}=1&\'+jQuery(this.form).serialize()")
		   } else {
			   // as of jQuery plugin version 1.4.0.1 submitToRemote has been modified and the
			   // this.form part has been fixed. Consequently, our wrapper has changed as well...
			   button = button.replaceFirst(/data\:jQuery/, "data:\'_eventId_${elementName}=1&\'+jQuery")
		   }
	
		   // render button
		   out << button
	   }
	
	
	
		def myTextField = {attrs ->
			// If a controller returned the bean, and the field has an error,
			// then "errors" will be returned as HTML class, otherwise the class will be empty.
			attrs.class = hasErrors(bean:attrs.bean, field:attrs.field, 'errors')
			// Retrieves the field value of the given bean to be rendered in the view.
			// Note: specify the bean and not the bean name. So "${user}" instead of "user"
			attrs.value = fieldValue(bean:attrs.bean, field:attrs.field)
			// Required for textField taglib. attrs.name is a keyname of the params map
			attrs.name = attrs.field
			// renders the HTML tag
			out << new FormTagLib().textField(attrs)
		
	}
	
}
