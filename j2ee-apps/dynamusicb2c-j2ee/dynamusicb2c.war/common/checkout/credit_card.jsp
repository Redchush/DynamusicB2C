<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<%@ taglib prefix="c" uri="/cTaglib" %>
<dsp:importbean bean="/dynamusic/lp/handler/MultiplePaymentExpressCheckoutWithPL"/>
<dsp:importbean bean="/atg/userprofiling/Profile"/>

<dsp:page>
  <dsp:getvalueof param="CheckoutHandler" id="CheckoutFH">
    <div class="gr_header">Credit Card Type:</div>
    <dsp:select bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.creditCardType" required="true">
      <c:set var="isVisa" value="false"/>
      <c:set var="isMaster" value="false"/>
      <c:set var="isAmerican" value="false"/>
      <dsp:droplet name="/atg/dynamo/droplet/Switch">
        <dsp:param bean="Profile.defaultCreditCard.creditCardType" name="value"/>
        <dsp:oparam name="Visa"><c:set var="isVisa" value="true"/></dsp:oparam>
        <dsp:oparam name="MasterCard"><c:set var="isMaster" value="true"/></dsp:oparam>
        <dsp:oparam name="American Express"><c:set var="isAmerican" value="true"/></dsp:oparam>
      </dsp:droplet>
      <dsp:option value="Visa" selected="${isVisa}"/>Visa
      <dsp:option value="MasterCard" selected="${isMaster}" />Master Card
      <dsp:option value="American Express" selected="${isAmerican}"/>American Express
    </dsp:select><br>
    <b>Number:</b>
    <dsp:input bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.creditCardNumber"
               maxsize="20" size="20" type="text"
               beanvalue="Profile.defaultCreditCard.creditCardNumber"
               required="true"/><br>
    <b>Expiration Date:</b>
    Month:
    <dsp:select bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.expirationMonth">
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
    <dsp:select bean="MultiplePaymentExpressCheckoutWithPL.paymentGroup.expirationYear">
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
  </dsp:getvalueof>
</dsp:page>