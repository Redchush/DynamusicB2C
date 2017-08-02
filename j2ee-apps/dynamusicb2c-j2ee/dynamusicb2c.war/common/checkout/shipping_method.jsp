<%@ taglib prefix="dsp" uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" %>
<dsp:importbean bean="/dynamusic/lp/handler/MultiplePaymentExpressCheckoutWithPL"/>
<dsp:importbean bean="/atg/commerce/pricing/AvailableShippingMethods"/>
<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>

<dsp:page>
  <div class="gr_header">Shipping Method</div>
  <%-- Shipping Methods Select Box --%>
  <dsp:droplet name="AvailableShippingMethods">
    <dsp:param name="shippingGroup" bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup"/>

    <dsp:oparam name="output">
      <dsp:select bean="MultiplePaymentExpressCheckoutWithPL.shippingGroup.shippingMethod">

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
</dsp:page>