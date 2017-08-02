<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- page to review and confirm order -->
<!-- Last modified: 11 Apr 06 by KL -->

<!-- Title: Order Confirm -->


<dsp:page>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:importbean bean="/dynamusic/lp/handler/SimpleExpressCheckoutWithPL"/>
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
          <dsp:param bean="SimpleExpressCheckoutWithPL.formError" name="value"/>
          <dsp:oparam name="true">
            <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
              <dsp:param bean="SimpleExpressCheckoutWithPL.formExceptions" name="exceptions"/>
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
        <br>

        <div class="gr_header">Payment information: </div> <br>
        <dsp:droplet name="/atg/dynamo/droplet/ForEach">
          <dsp:param name="array" bean="ShoppingCart.current.paymentGroups"/>
          <dsp:oparam name="outputStart">
            <ul>
          </dsp:oparam>
          <dsp:oparam name="output">
            <li>
              <dsp:valueof param="element.paymentMethod"/><br>
              <dsp:droplet name="/atg/dynamo/droplet/Switch">
                <dsp:param param="element.paymentMethod" name="value"/>
                <dsp:oparam name="loyaltyPointPayment">
                  Spend PL:  <dsp:valueof param="element.spendPL"/> PL.
                  Amount in currency:  <dsp:valueof param="element.amount" converter="currency"/>.
                </dsp:oparam>
                <dsp:oparam name="default">
                  Remain payment
                </dsp:oparam>
              </dsp:droplet>
            </li>
          </dsp:oparam>
          <dsp:oparam name="outputEnd"></ul><br></dsp:oparam>
          <dsp:oparam name="empty">

          </dsp:oparam>
        </dsp:droplet>

       <!-- Enter form with confirm order button here -->
        <div>
          <dsp:form formid="lp_checkout_final" action="orderconfirm.jsp" method="post">
            <dsp:input bean="SimpleExpressCheckoutWithPL.expressCheckoutSuccessURL"
                       type="hidden" value="../orders/lastorderstatus.jsp"/>
            <dsp:input bean="SimpleExpressCheckoutWithPL.expressCheckoutErrorURL"
                       type="hidden" value="plorderconfirm.jsp"/>
            <dsp:input bean="SimpleExpressCheckoutWithPL.commitOrder"
                       type="hidden" value="true"/>
            <dsp:input bean="SimpleExpressCheckoutWithPL.expressCheckout"
                       type="submit"/>
          </dsp:form>

          <dsp:a page="plamount.jsp">Change Pl amount</dsp:a><br>
          <dsp:a page="plpurchaseinfo.jsp">Change payment information</dsp:a>
        </div>


      </td>
    </tr>
  </table>
  </body>
  </html>

</dsp:page>
