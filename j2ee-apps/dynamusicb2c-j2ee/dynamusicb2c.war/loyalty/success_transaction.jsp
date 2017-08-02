
<%--<%@ taglib uri="/dspTaglib" prefix="dsp" %>--%>
<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp" %>


<dsp:page>
  <dsp:link rel="stylesheet"
            type="text/css"
            href="../css/main.css"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/dynamusic/lp/handler/LoyaltyFormHandler"/>

  <!-------------------------------------------------------------
  Dynamusic Site  DAF Site Mockup
  HOME
  Central page for the site; landing point following login,
  providing starting point for site's pages.
  Version 4 - adds slot to advertise concerts for viewed
  artists.
  ------------------------------------------------------------->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="/common/header.jsp">
    <dsp:param name="pagename" value="Home"/>
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
            Your transaction had success.<br>
            <a href="profileTransaction.jsp?userId=<dsp:valueof param="userId"/>">
              See list of last updated profile transactions
            </a>
            <br>
            <dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
              <dsp:param param="orderId" name="value"/>
              <dsp:oparam name="false">
                <a href="profileOrders.jsp?userId=<dsp:valueof param="userId"/>">
                  See list of last updated profile transactions
                </a>
              </dsp:oparam>
            </dsp:droplet>

          </dsp:oparam>
          <dsp:oparam name="default">
            <dsp:a href="profileTransaction.jsp">My transactions</dsp:a>
          </dsp:oparam>
        </dsp:droplet>

        <!-- *** End real content *** -->
      </td>
  </table>
  </BODY>
  </HTML>
</dsp:page>




