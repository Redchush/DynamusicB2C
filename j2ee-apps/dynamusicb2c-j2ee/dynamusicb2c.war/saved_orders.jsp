<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>

  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>


  <HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="/common/header.jsp" flush="false">
    <dsp:param name="pagename" value=" Saved Orders"/>
  </dsp:include>
  <table class="container">
    <tr>
      <td class="sidebar">
        <dsp:include page="navbar.jsp" flush="false"/>
      </td>

      <td class="body">
        <!-- main content area -->
        <table class="t_inner strong">

          <dsp:droplet name="IsEmpty">
          <dsp:param name="value" bean="ShoppingCart.saved"/>
          <dsp:oparam name="true">
            <tr>
              <td>You have no saved orders.</td>
            </tr>
          </dsp:oparam>
          <dsp:oparam name="false">

          <tr>
            <td><b><span class=small> Order name</span></b></td>

            <td><b><span class=small> Order #</span></b></td>

            <td><b><span class=small>Date saved</span></b></td>
            <td><b><span class=small>State</span></b></td>
          </tr>
          <dsp:droplet name="ForEach">
            <dsp:param name="array" bean="ShoppingCart.saved"/>
            <dsp:oparam name="output">
              <tr>
                <td>
                  <dsp:a href="saved_order.jsp">
                    <dsp:param name="orderId" param="element.id"/>
                    <dsp:valueof  param="element.description"/>
                  </dsp:a>
                </td>
                <td><dsp:valueof  param="element.id"/></td>
                <td><dsp:valueof date="MMMM d, yyyy h:mm a"  param="element.creationDate"/></td>
                <td><dsp:valueof  param="element.state"/></td>
              </tr>
            </dsp:oparam>
          </dsp:droplet>
        </table>

        </dsp:oparam>
        </dsp:droplet><!--end IsEmpty-->

      </td>
    </tr>
  </table>

  </body>
  </html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2C/j2ee-apps/dynamusicb2c-j2ee/dynamusicb2c.war/saved_orders.jsp#9 $$Change: 514668 $--%>
