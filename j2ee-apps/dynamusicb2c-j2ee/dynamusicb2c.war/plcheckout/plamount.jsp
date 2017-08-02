<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- page to review and confirm order -->
<!-- Last modified: 11 Apr 06 by KL -->

<!-- Title: Order Confirm -->


<dsp:page>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:importbean bean="/dynamusic/lp/handler/MultiplePaymentExpressCheckoutWithPL"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Order Confirmation</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="/common/header.jsp">
    <dsp:param name="pagename" value="Loyalty payment"/>
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
          <dsp:param bean="MultiplePaymentExpressCheckoutWithPL.formError" name="value"/>
          <dsp:oparam name="true">
            <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
              <dsp:param bean="MultiplePaymentExpressCheckoutWithPL.formExceptions" name="exceptions"/>
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


        <b>Payment information: </b> <br>
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
                <dsp:oparam name="loyaltyPointPaymentInfoClass">
                  Spend PL:  <dsp:valueof param="element.spendPL"/> PL.
                  Amount in currency:  <dsp:valueof param="element.amount" converter="currency"/> PL.
                </dsp:oparam>
                <dsp:oparam name="default">
                  Remain payment
                  <%--: <dsp:valueof param="element.amount" converter="currency"/>--%>
                </dsp:oparam>
              </dsp:droplet>
            </li>
          </dsp:oparam>
          <dsp:oparam name="outputEnd">
            </ul><br></dsp:oparam>
          <dsp:oparam name="empty">

          </dsp:oparam>
        </dsp:droplet>

          <!-- Enter form with confirm order button here -->
        <div>
          <dsp:form formid="lp_checkout_final" action="plamount.jsp" method="post">
            <div class="loyaltyInfo">
              Current loyalty points:
              <dsp:valueof bean="Profile.loyaltyAmount"/><br>
              If you want to spend some PL on this order, type the sum in the box:

              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.plToSpend" type="text" value=""/>
            </div> <br><br>

            <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.expressCheckoutSuccessURL"
                       type="hidden" value="plorderconfirm.jsp"/>
            <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.expressCheckoutErrorURL"
                       type="hidden" value="plamount.jsp"/>
            <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.commitOrder"
                       type="hidden" value="false"/>
            <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.expressCheckout"
                       type="submit"/>
          </dsp:form>
        </div>




      </td>
    </tr>
  </table>
  </body>
  </html>

</dsp:page>
