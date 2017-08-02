<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/dynamusic/lp/handler/MultiplePaymentExpressCheckoutWithPL"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:page>
  <div class="gr_header">Billing Information</div>
  <div class="descr"> Please, enter your name as it appears on your credit card.</div><br>
  <b>First Name:</b>
  <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.billingAddress.firstName"
             beanvalue="Profile.firstName" size="30" type="text" required="true>"/><br>
  <b>Middle Name:</b>
  <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.billingAddress.middleName"
             beanvalue="Profile.middleName" size="30" type="text"/><br>
  <b>Last Name:</b>
  <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.billingAddress.lastName"
             beanvalue="Profile.lastName" size="30" type="text" required="true"/><br>
  <b>Address 1:</b>
  <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.billingAddress.address1"
             beanvalue="Profile.billingAddress.address1" size="30" type="text"/><br>
  <b>Address 2:</b>
  <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.billingAddress.address2"
             beanvalue="Profile.billingAddress.address2" size="30" type="text"/><br>
  <b>City:</b>
  <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.billingAddress.city"
             beanvalue="Profile.billingAddress.city" size="30" type="text" required="true"/><br>
  <b>State:</b>
  <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.billingAddress.state" maxsize="2"
             beanvalue="Profile.billingAddress.state" size="2" type="text" required="true"/><br>
  <b>Postal Code:</b>
  <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.billingAddress.postalCode"
             beanvalue="Profile.billingAddress.postalCode" size="10" type="text" required="true"/><br>
  <b>Country:</b>
  <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.billingAddress.country"
             beanvalue="Profile.billingAddress.country" size="10" type="text"/><br>
</dsp:page>

