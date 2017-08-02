
<%--<%@ taglib uri="/dspTaglib" prefix="dsp" %>--%>
<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp" %>

<!-------------------------------------------------------------
page for loyalty point administrator
------------------------------------------------------------->
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="/css/main.css"/>

  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/dynamusic/lp/handler/LoyaltyFormHandler"/>
  <HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>

  <dsp:include page="/common/header.jsp">
    <dsp:param name="pagename" value="Loyalty administration"/>
  </dsp:include>

  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="/common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- *** Start page content *** -->
        <dsp:droplet name="/atg/dynamo/droplet/HasEffectivePrincipal">
        <dsp:param name="type" value="role"/>
        <dsp:param name="id" value="loyaltyAdministrator"/>
        <dsp:oparam name="output">
          <div>
            <dsp:form action="<%=request.getRequestURI()%>" method="get">

              <div class="error">
                <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                  <dsp:oparam name="output">
                    <div><dsp:valueof param="message"/> </div>
                  </dsp:oparam>
                </dsp:droplet>
              </div>

              <div>
                Enter transaction amount:<br>
                <dsp:input bean="LoyaltyFormHandler.value.amount" name="amount" size="30" type="text"
                           iclass="form_input"/><br><br>
                Enter transaction description:<br>
                <dsp:textarea bean="LoyaltyFormHandler.value.description" name="description" rows="10" type="text"
                              maxlength="1000" iclass="form_input"/><br><br>
                Profile id:<i id="profileIdValue"></i> <br>
                <div class="description">Click on "Show users" to choose user to modify</div>
                <dsp:input id="profileId" bean="LoyaltyFormHandler.value.profileId" name="profileId" type="hidden"/><br><br>

                <div class="btn_container">
                  <dsp:input bean="LoyaltyFormHandler.cancelURL" type="hidden" value="<%=request.getRequestURI()%>" />
                  <dsp:input bean="LoyaltyFormHandler.cancel" type="Submit" value="Cancel"
                             iclass="hor_btn"/>
                  <dsp:input id="successURL" bean="LoyaltyFormHandler.createSuccessURL" type="hidden"
                             value="success_transaction.jsp"/>
                  <dsp:input bean="LoyaltyFormHandler.create" type="Submit" value="Add transaction"
                             iclass="hor_btn"/>
                </div>

              </div>
            </dsp:form>
            <dsp:include page="part/dropdown_all_users.jsp">
              <dsp:param name="btn_class" value="profileId_picked"/>
            </dsp:include>
              <%--<dsp:include page="/loyalty/part/dropdown_all_users.jsp"/>--%>
          </div>
        </dsp:oparam>
        <dsp:oparam name="default"> You are not an administrator<p>
        </dsp:oparam>
        <dsp:oparam name="unknown"> You are not logged in<p>

        </dsp:oparam>
        </dsp:droplet>
        <!-- *** End real content *** -->
      </td>
  </table>
  </BODY>
  </HTML>
</dsp:page>




