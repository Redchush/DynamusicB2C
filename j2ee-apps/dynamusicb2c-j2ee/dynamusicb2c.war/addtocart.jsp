<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- fragment to configure Add To Cart button -->
<!-- Last modified: 7 Apr 06 by KL -->

<!-- Title: Add to Cart Fragment -->


<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

  <dsp:form formid="addToCart" action="cart.jsp" method="post">
    <%-- Import CartModifierFormHandler component --%>
    <dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>

    <%-- Form to choose quantity and add SKU to cart --%>
    <dsp:input bean="CartModifierFormHandler.catalogRefIds"
               paramvalue="skuId" type="hidden"/>
    <dsp:input bean="CartModifierFormHandler.productId"
               paramvalue="productId" type="hidden"/>
    <dsp:input bean="CartModifierFormHandler.addItemToOrderSuccessURL"
               value="cart.jsp" type="hidden"/>

    <dsp:input bean="CartModifierFormHandler.quantity" value="1" type="text"
               size="5"/>
    <dsp:input bean="CartModifierFormHandler.addItemToOrder"
               value="Add to Cart" type="submit"/>

  </dsp:form>


</dsp:page>
