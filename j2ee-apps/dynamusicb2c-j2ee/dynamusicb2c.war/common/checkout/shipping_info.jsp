<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/atg/userprofiling/Profile"/>
<dsp:importbean bean="/dynamusic/lp/handler/MultiplePaymentExpressCheckoutWithPL" var="handler"/>
<dsp:importbean bean="/dynamusic/lp/handler/MultiplePaymentExpressCheckoutWithPL"/>
<%@ taglib prefix="c" uri="/cTaglib" %>
<style>
  label{
    display: block;
    margin: 3px 0;
  }
</style>
<dsp:page>
  <dsp:getvalueof param="CheckoutHandler" id="CheckoutFH">
    <div class="gr_header">Shipping Information</div>
    <%-- Chapter 8, Ex. 1, Step 2: Insert Name and address information here --%>
    <label>
      <b>First Name: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.firstName"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.firstName"%>" size="30"/>
    </label>
    <label>
      <b>Middle Name: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.middleName"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.middleName"%>" size="30"/>
    </label>
    <label>
      <b>Last Name: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.lastName"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.lastName"%>" size="30"/>
    </label>
    <label>
      <b>Address 1: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.address1"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.address1"%>" size="30"/>
    </label>
    <label>
      <b>Address 2: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.address2"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.address2"%>" size="30"/>
    </label>
    <label>
      <b>City: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.city"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.city"%>" size="30"/>
    </label>
    <label>
      <b>State: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.state"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.state"%>" size="30"/>
    </label>
    <label>
      <b>Postal Code: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.postalCode"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.postalCode"%>" size="30"/>
    </label>
    <label>
      <b>Country: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.country"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.country"%>" size="30"/>
    </label>
    <label>
      <b>Email: </b>
      <input value="<dsp:valueof bean="Profile.email"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.email"%>" size="30"/>
    </label>
    <label>
      <b>Phone: </b>
      <input value="<dsp:valueof bean="Profile.shippingAddress.phoneNumber"/>" type="text"
             name="<%=CheckoutFH +".shippingGroup.shippingAddress.phoneNumber"%>" size="30"/>
    </label>
  </dsp:getvalueof>
</dsp:page>
