<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<!-- ATG Training -->
<!-- Creating Commerce Applications Part I -->
<!-- page to gather shipping and payment information for express checkout -->
<!-- Last modified: 1 May 07 by RM -->

<!-- Title: Purchase Information Page -->


<dsp:page>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:importbean bean="/dynamusic/lp/handler/SimpleExpressCheckoutWithPL"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
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
          <dsp:param bean="SimpleExpressCheckoutWithPL.formError" name="value"/>
          <dsp:oparam name="true">

            <dsp:droplet name="/atg/dynamo/droplet/ErrorMessageForEach">
              <dsp:param bean="SimpleExpressCheckoutWithPL.formExceptions"
                         name="exceptions"/>
              <dsp:oparam name="output">
                <div class="error"> <dsp:valueof param="message"/> </div>
              </dsp:oparam>
            </dsp:droplet>

          </dsp:oparam>
        </dsp:droplet>
        <!-- Start of form to capture shipping and billing information -->
        <dsp:form formid="pl_checkout_second" action="purchaseinfo.jsp" method="post">

          <dsp:input bean="SimpleExpressCheckoutWithPL.renovateSpendPL" value="true" type="hidden"/>
          <dsp:input bean="SimpleExpressCheckoutWithPL.commitOrder" value="false" type="hidden"/>
          <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroupNeeded" value="false" type="hidden"/>
          <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroupNeeded" value="false" type="hidden"/>
          <dsp:input bean="SimpleExpressCheckoutWithPL.expressCheckoutSuccessURL"
                     value="plamount.jsp" type="hidden"/>
          <dsp:input bean="SimpleExpressCheckoutWithPL.expressCheckoutErrorURL"
                     value="plpurchaseinfo.jsp" type="hidden"/>

          <div class="ship_meth_box">
            <div class="gr_header">Shipping Method</div>
              <%-- Shipping Methods Select Box --%>
            <dsp:droplet name="AvailableShippingMethods">
            <dsp:param name="shippingGroup" bean="SimpleExpressCheckoutWithPL.shippingGroup"/>

            <dsp:oparam name="output">
            <dsp:select bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingMethod">

            <dsp:droplet name="ForEach">
            <dsp:param name="array" param="availableShippingMethods"/>
            <dsp:oparam name="output">
            <dsp:param name="method" param="element"/>
            <option value='<dsp:valueof param="method"/>'><dsp:valueof param="method"/>
              </dsp:oparam>
              </dsp:droplet> <%--end foreach availableShippingMethods--%>

              </dsp:select>
              </dsp:oparam>

              </dsp:droplet>
          </div>

          <div class="sh_info_box box_inl">
            <div class="gr_header">Shipping Information</div>
              <%-- Chapter 8, Ex. 1, Step 2: Insert Name and address information here --%>
            <b>First Name: </b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.firstName"
                       type="text" beanvalue="Profile.shippingAddress.firstName" size="30"/>
            <br>
            <b>Middle Name:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.middleName"
                       type="text" beanvalue="Profile.shippingAddress.middleName" size="30"/>
            <br>
            <b>Last Name:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.lastName"
                       type="text" beanvalue="Profile.shippingAddress.lastName" size="30"/>
            <br>
            <b>Address 1:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.address1"
                       type="text" beanvalue="Profile.shippingAddress.address1" size="30"/>
            <br>
            <b>Address 2:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.address2"
                       type="text" beanvalue="Profile.shippingAddress.address2" size="30"/>
            <br>
            <b>City:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.city"
                       type="text" beanvalue="Profile.shippingAddress.city" size="30"/>
            <br>
            <b>State:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.state"
                       type="text" beanvalue="Profile.shippingAddress.state" size="30"/>
            <br>
            <b>Postal Code:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.postalCode"
                       type="text" beanvalue="Profile.shippingAddress.postalCode" size="30"/>
            <br>
            <b>Country:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.country"
                       type="text" beanvalue="Profile.shippingAddress.country" size="30"/>
            <br>
            <b>Email:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.email"
                       type="text" beanvalue="Profile.email" size="30"/>
            <br>
            <b>Phone:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.shippingGroup.shippingAddress.phoneNumber"
                       type="text" beanvalue="Profile.shippingAddress.phoneNumber" size="30"/>
            <br>
          </div>

          <div class="bill_info_box box_inl">
            <!-- Billing information -->
            <div class="gr_header">Billing Information</div>
            <div class="descr"> Please, enter your name as it appears on your credit card.</div><br>
            <b>First Name:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.billingAddress.firstName"
                       beanvalue="Profile.firstName" size="30" type="text" required="true>"/><br>
            <b>Middle Name:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.billingAddress.middleName"
                       beanvalue="Profile.middleName" size="30" type="text"/><br>
            <b>Last Name:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.billingAddress.lastName"
                       beanvalue="Profile.lastName" size="30" type="text" required="true"/><br>
            <b>Address 1:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.billingAddress.address1"
                       beanvalue="Profile.billingAddress.address1" size="30" type="text"/><br>
            <b>Address 2:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.billingAddress.address2"
                       beanvalue="Profile.billingAddress.address2" size="30" type="text"/><br>
            <b>City:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.billingAddress.city"
                       beanvalue="Profile.billingAddress.city" size="30" type="text" required="true"/><br>
            <b>State:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.billingAddress.state" maxsize="2"
                       beanvalue="Profile.billingAddress.state" size="2" type="text" required="true"/><br>
            <b>Postal Code:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.billingAddress.postalCode"
                       beanvalue="Profile.billingAddress.postalCode" size="10" type="text" required="true"/><br>
            <b>Country:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.billingAddress.country"
                       beanvalue="Profile.billingAddress.country" size="10" type="text"/><br>
          </div>

          <div class="cc_type box box_inl">
            <div class="gr_header">Credit Card Type:</div>
            <dsp:select bean="SimpleExpressCheckoutWithPL.paymentGroup.creditCardType" required="true">
              <dsp:option value="Visa"/>Visa
              <dsp:option value="MasterCard"/>Master Card
              <dsp:option value="American Express"/>American Express
            </dsp:select><br>
            <b>Number:</b>
            <dsp:input bean="SimpleExpressCheckoutWithPL.paymentGroup.creditCardNumber"
                       maxsize="20" size="20" type="text"
                       beanvalue="Profile.defaultCreditCard.creditCardNumber"
                       required="true"/><br>
            <b>Expiration Date:</b>
            Month:
            <dsp:select bean="SimpleExpressCheckoutWithPL.paymentGroup.expirationMonth">
              <dsp:option value="1"/>January
              <dsp:option value="2"/>February
              <dsp:option value="3"/>March
              <dsp:option value="4"/>April
              <dsp:option value="5"/>May
              <dsp:option value="6"/>June
              <dsp:option value="7"/>July
              <dsp:option value="8"/>August
              <dsp:option value="9"/>September
              <dsp:option value="10"/>October
              <dsp:option value="11"/>November
              <dsp:option value="12"/>December
            </dsp:select>
            Year:
            <dsp:select bean="SimpleExpressCheckoutWithPL.paymentGroup.expirationYear">
              <dsp:option value="2008"/>2008
              <dsp:option value="2009"/>2009
              <dsp:option value="2010" selected="true"/>2010
              <dsp:option value="2011"/>2011
              <dsp:option value="2012"/>2012
              <dsp:option value="2013"/>2013
              <dsp:option value="2014"/>2014
              <dsp:option value="2015"/>2015
              <dsp:option value="2016"/>2016
              <dsp:option value="2017"/>2017
              <dsp:option value="2018"/>2018
            </dsp:select><br><br>
          </div>
          <p>
            <dsp:input bean="SimpleExpressCheckoutWithPL.expressCheckout"
                       type="submit" value="Checkout"/>
          </p>
        </dsp:form>

      </td>
    </tr>
  </table>
  </body>
  </html>

</dsp:page>
