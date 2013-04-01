<%@ page import="org.grails.ApkCv.MuExperienceController"%>
    <ul>
      <g:each in="${experiences}">
        <li>${it.title} (${it.companyName}) ${it.description}</li>
      </g:each>
    </ul>
