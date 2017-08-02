
<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" prefix="dsp" %>

<!-------------------------------------------------------------
page for loyalty point administrator
------------------------------------------------------------->
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="/css/main.css"/>

  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/dynamusic/lp/handler/OrderLoyaltyFormHandler"/>
  <HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>

  <script src="<%=request.getContextPath() + "/js/jquery-2.2.3.js"%>"></script>
  <script src="<%=request.getContextPath() + "/js/dropdown_order.js"%>"></script>

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
          <dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
            <dsp:param param="userId" name="value"/>

            <%--show other user pl--%>
            <dsp:oparam name="false">
              <div>
                <dsp:form action="${pageContext.request.requestURL}" method="get">
                  <div class="error">
                    <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
                      <dsp:oparam name="output">
                        <div><dsp:valueof param="message"/> </div>
                      </dsp:oparam>
                    </dsp:droplet>
                  </div>

                  <div>
                    Enter transaction amount:<br>
                    <dsp:input bean="OrderLoyaltyFormHandler.value.amount" name="amount" size="30" type="text"
                               iclass="form_input"/><br><br>
                    Enter transaction description:<br>
                    <dsp:textarea bean="OrderLoyaltyFormHandler.value.description" name="description" rows="10" type="text"
                                  maxlength="1000" iclass="form_input"/><br><br>
                    Enter profile id<br>

                    <dsp:input id="profileId" bean="OrderLoyaltyFormHandler.value.profileId" name="profileId" type="text"
                               iclass="form_input" value="${userId}"/><br><br>

                    Enter order id<br>
                    <dsp:input id="orderId" bean="OrderLoyaltyFormHandler.value.profileId" name="profileId" type="text"
                               maxsize="100" iclass="form_input"/><br><br>

                    <div class="btn_container">
                      <dsp:input bean="OrderLoyaltyFormHandler.cancelURL" type="hidden" value="${pageContext.request.requestURL}" />
                      <dsp:input bean="OrderLoyaltyFormHandler.cancel" type="Submit" value="Cancel"
                                 iclass="hor_btn"/>
                      <dsp:input id="successURL" bean="OrderLoyaltyFormHandler.createSuccessURL" type="hidden"
                                 value="success_transaction.jsp"/>
                      <dsp:input bean="OrderLoyaltyFormHandler.create" type="Submit" value="Add transaction"
                                 iclass="hor_btn"/>
                    </div>

                  </div>
                </dsp:form>
                <dsp:include page="part/dropdown_all_orders.jsp">
                  <dsp:param name="userId" param="userId"/>
                </dsp:include>
              </div>
            </dsp:oparam>

            <dsp:oparam name="true">
              First pick up user:
              <form action="${pageContext.request.requestURL}">
                <dsp:include page="part/dropdown_all_users.jsp"/>
              </form>
            </dsp:oparam>

          </dsp:droplet>



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




