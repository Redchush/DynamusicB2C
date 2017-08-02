<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>
<!-------------------------------------------------------------
  Dynamusic Site Mockup
  LOGIN
  Allow user to log out.
  ------------------------------------------------------------->
  

<HTML>
  <HEAD>
    <TITLE>Dynamusic Login</TITLE>
  </HEAD>
  <BODY>
    <!-- (replace this entire table by dynamically including 
          common/header.html) -->
    <dsp:include page="common/header.jsp">
       <dsp:param name="pagename" value="login"/>
    </dsp:include>
    <table class="container">
      <tr>
        <td class="sidebar">
          <jsp:include page="navbar.jsp" flush="true"/>
        </td>
        <!-- Page Body -->
        <td class="body">
          <!-- *** Start page content *** -->
           <p><i> Please remind us who you are... </i><p>

            <dsp:form action="login.jsp" method="post">
            
              <!-- Default form error handling support -->
              <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                <dsp:oparam name="output">
                  <div class="error"><dsp:valueof param="message"/></div><br>
                </dsp:oparam>
              </dsp:droplet>
            
              Login name: 
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.login" name="login" size="24" type="text"/><br>
            
              Password:
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.value.password" name="password" size="24" type="password"/><br>
            
              <!-- defines the URL to go to on success (relative to 'action')-->
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.loginSuccessURL" type="hidden" value="home.jsp"/>
              <dsp:input bean="/atg/userprofiling/ProfileFormHandler.login" type="Submit" value="Login"/>
            
            </dsp:form>
            
          <!-- *** End real content *** -->
        </td>
    </table>
  </BODY>
</HTML>
</dsp:page>