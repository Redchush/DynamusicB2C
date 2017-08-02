<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<%@ taglib prefix="c" uri="/cTaglib" %>
<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- page to gather shipping and payment information for express checkout -->
<!-- 4809495000472206 -->
<!-- Title: Purchase Information Page -->

<dsp:page>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:importbean bean="/dynamusic/lp/handler/MultiplePaymentExpressCheckoutWithPL"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>
  <dsp:importbean bean="/atg/commerce/order/purchase/ExpressCheckoutFormHandler.shippingGroup.shippingAddress" var="shipAddr"/>
  <HTML>
  <HEAD>
    <TITLE>Dynamusic Purchase Information</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="/common/header.jsp">
    <dsp:param name="pagename" value="Purchase Information"/>
  </dsp:include>
  <table class="body">
    <tr>
      <td class="sidebar">
        <jsp:include page="/navbar.jsp" flush="true"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- Error handling -->
        <dsp:droplet name="/atg/dynamo/droplet/Switch">
          <dsp:param bean="MultiplePaymentExpressCheckoutWithPL.formError" name="value"/>
          <dsp:oparam name="true">

            <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
              <dsp:param bean="MultiplePaymentExpressCheckoutWithPL.formExceptions"
                         name="exceptions"/>
              <dsp:oparam name="output">
                <div class="error"> <dsp:valueof param="message"/> </div>
              </dsp:oparam>
            </dsp:droplet>

          </dsp:oparam>
        </dsp:droplet>
        <!-- Start of form to capture shipping and billing information -->
        <dsp:form formid="pl_checkout_first" action="purchaseinfo.jsp" method="post">

          <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.commitOrder" value="false" type="hidden"/>
          <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroupNeeded" value="false" type="hidden"/>
          <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroupNeeded" value="false" type="hidden"/>
          <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.expressCheckoutSuccessURL"
                     value="plamount.jsp" type="hidden"/>
          <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.expressCheckoutErrorURL"
                     value="plpurchaseinfo.jsp" type="hidden"/>

          <div class="ship_meth_box ">
            <dsp:include page="/common/checkout/shipping_method.jsp"/>

          </div>
          <div class="sh_info_box box_inl">
              <div class="gr_header">Shipping Information</div>
                <%-- Chapter 8, Ex. 1, Step 2: Insert Name and address information here --%>
              <b>First Name: </b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.firstName"
                         type="text" beanvalue="Profile.shippingAddress.firstName" size="30"/>
              <br>
              <b>Middle Name:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.middleName"
                         type="text" beanvalue="Profile.shippingAddress.middleName" size="30"/>
              <br>
              <b>Last Name:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.lastName"
                         type="text" beanvalue="Profile.shippingAddress.lastName" size="30"/>
              <br>
              <b>Address 1:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.address1"
                         type="text" beanvalue="Profile.shippingAddress.address1" size="30"/>
              <br>
              <b>Address 2:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.address2"
                         type="text" beanvalue="Profile.shippingAddress.address2" size="30"/>
              <br>
              <b>City:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.city"
                         type="text" beanvalue="Profile.shippingAddress.city" size="30"/>
              <br>
              <b>State:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.state"
                         type="text" beanvalue="Profile.shippingAddress.state" size="30"/>
              <br>
              <b>Postal Code:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.postalCode"
                         type="text" beanvalue="Profile.shippingAddress.postalCode" size="30"/>
              <br>
              <b>Country:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.country"
                         type="text" beanvalue="Profile.shippingAddress.country" size="30"/>
              <br>
              <b>Email:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.email"
                         type="text" beanvalue="Profile.email" size="30"/>
              <br>
              <b>Phone:</b>
              <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingAddress.phoneNumber"
                         type="text" beanvalue="Profile.shippingAddress.phoneNumber" size="30"/>
              <br>

          </div>
          <div class="bill_info_box box_inl">
            <dsp:include page="/common/checkout/billing_info.jsp">

            </dsp:include>
          </div>
          <div class="cc_type box">
            <dsp:include page="/common/checkout/credit_card.jsp">
              <dsp:param name="CheckoutHandler" bean="MultiplePaymentExpressCheckoutWithPL"/>
            </dsp:include>
          </div>
          <p>
            <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.expressCheckout"
                       type="submit" value="Checkout"/>
          </p>
        </dsp:form>

      </td>
    </tr>
  </table>
  </body>
  </html>

</dsp:page>
