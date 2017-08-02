<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- page to review and confirm order -->
<!-- Last modified: 11 Apr 06 by KL -->

<!-- Title: Order Confirm -->


<dsp:page>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:importbean bean="/atg/commerce/order/purchase/ExpressCheckoutFormHandler"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Order Confirmation</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="/common/header.jsp">
    <dsp:param name="pagename" value="Order Confirmation"/>
  </dsp:include>
  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="navbar">
        <jsp:include page="/navbar.jsp" flush="true"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- Error handling -->
        <dsp:droplet name="/atg/dynamo/droplet/Switch">
          <dsp:param bean="ExpressCheckoutFormHandler.formError" name="value"/>
          <dsp:oparam name="true">
            <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
              <dsp:param bean="ExpressCheckoutFormHandler.formExceptions" name="exceptions"/>
              <dsp:oparam name="output">
                <div class="error"> <dsp:valueof param="message"/></div>
              </dsp:oparam>
            </dsp:droplet>
          </dsp:oparam>
        </dsp:droplet>

          <%-- Ch. 8, Ex. 1, Step 1: Display order pricing information --%>
        <b>You order id</b> <dsp:valueof bean="ShoppingCart.current.id"/><br>
        <b>Subtotal:</b>
        <dsp:valueof bean="ShoppingCart.current.priceInfo.amount" converter="currency"/>
        <br>
        <b>Shipping:</b>
        <dsp:valueof bean="ShoppingCart.current.priceInfo.shipping" converter="currency"/>
        <br>
        <b>Total:</b>
        <dsp:valueof bean="ShoppingCart.current.priceInfo.total" converter="currency"/>
        Received PL:
        <i> <dsp:valueof bean="ShoppingCart.current.priceInfo.receivedPL"/> PL</i><br>
        <p>
          <!-- Enter form with confirm order button here -->
          <dsp:form action="orderconfirm.jsp" method="post">
            <dsp:input bean="ExpressCheckoutFormHandler.expressCheckoutSuccessURL"
                       type="hidden" value="../orders/lastorderstatus.jsp"/>
            <dsp:input bean="ExpressCheckoutFormHandler.commitOrder"
                       type="hidden" value="true"/>
            <dsp:input bean="ExpressCheckoutFormHandler.expressCheckout"
                       type="submit"/>
          </dsp:form>
        </p>

      </td>
    </tr>
  </table>
  </body>
  </html>

</dsp:page>
