<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>
  <dsp:importbean bean="/atg/commerce/order/purchase/SaveOrderFormHandler"/>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
  <dsp:importbean bean="/atg/dynamo/droplet/IsEmpty"/>
  <dsp:importbean bean="/atg/dynamo/droplet/ErrorMessageForEach"/>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>

  <!-- ATG Training -->
  <!-- Creating Commerce Applications Part I -->
  <!-- Cart Page -->
  <!-- Last modified: 1 May 07 by RM -->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Shopping Cart</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Your Shopping Cart"/>
  </dsp:include>
  <style>
    table.shCart, table.shCart tr, table.shCart th, table.shCart td{
      border: 1px solid gray;
      border-collapse: collapse;
      padding:5px;
      text-align: left;

    }
  </style>
  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <jsp:include page="navbar.jsp" flush="true"/>
      </td>
      <!-- Page Body -->
      <td class="body">
          <%-- Chapter 7, Exercise 4, Step 3: Reprice the order when the page is loaded --%>
        <dsp:droplet name="/atg/commerce/order/purchase/RepriceOrderDroplet">
          <dsp:param name="pricingOp" value="ORDER_TOTAL"/>
        </dsp:droplet>

        <dsp:droplet name="IsEmpty">
          <dsp:param name="value" bean="ShoppingCart.current.commerceItems"/>
          <dsp:oparam name="false">

           <%-- Chapter 7, Exercise 3, Step 1: Error Handling --%>
            <dsp:droplet name="ErrorMessageForEach">
              <dsp:param name="exceptions" bean="CartModifierFormHandler.formExceptions"/>
              <dsp:oparam name="output">
                <div class="error"> <dsp:valueof param="message"/></div>
              </dsp:oparam>
            </dsp:droplet>

            <%-- Chapter 7, Exercise 2 --%>
            <%-- Loop through CommerceItems to display each Commerce Item --%>

            <dsp:form formid="cartForm" method="post" action="cart.jsp">
              <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                <dsp:param name="array" bean="CartModifierFormHandler.order.commerceItems"/>

                <dsp:oparam name="outputStart">
                  <table class="shCart">
                  <thead>
                  <tr>
                    <th>Name</th>
                    <th>Quantity</th>
                    <th>Raw Total Price (undiscounted price)</th>
                    <th>Amount (discounted price)</th>
                  </tr>
                  </thead>
                  <tbody>
                </dsp:oparam>
                <dsp:oparam name="output">
                  <dsp:param name="Ci" param="element"/>
                  <tr>
                    <td><dsp:valueof param="Ci.auxiliaryData.catalogRef.displayName"/></td>
                    <td>
                      <input name="<dsp:valueof param="Ci.id"/>"
                             value="<dsp:valueof param="Ci.quantity"/>" size="2" type="text"
                             title="quantity"/>
                    </td>
                    <td><dsp:valueof param="Ci.priceInfo.rawTotalPrice"/></td>
                    <td><dsp:valueof param="Ci.priceInfo.amount"/></td>
                  </tr>
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
                  </tbody>
                  </table>
                </dsp:oparam>
                <dsp:oparam name="empty">

                </dsp:oparam>
              </dsp:droplet>
              <div class="totals">
              Shopping Cart Subtotal:<br><br>
              <%-- Chapter 7, Exercise 4: Display Order Subtotal and Recalculate Button --%>
              Raw subtotal:
              <dsp:valueof bean="ShoppingCart.current.priceInfo.rawSubtotal" converter="currency">
                No price</dsp:valueof><br>
              Order subtotal:
              <dsp:valueof bean="ShoppingCart.current.priceInfo.amount" converter="currency">
                No price</dsp:valueof><br><br>

              <div class="loyalty">
                After completing order you will receive:
                <dsp:valueof bean="ShoppingCart.current.priceInfo.receivedPL"/> LP.<br><br>
              </div>
              <div class="buttons">

              <dsp:input bean="CartModifierFormHandler.setOrderByCommerceId" type="submit"
                         value="Recalculate"/>
              <dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoByCommerceId"
                         value="Checkout" type="submit"/>
              <dsp:select bean="CartModifierFormHandler.moveToPurchaseInfoSuccessURL">
                <dsp:droplet name="/atg/dynamo/droplet/Switch">
                  <dsp:param bean="Profile.transient" name="value"/>
                  <dsp:oparam name="false">
                    <dsp:option value="plcheckout/plpurchaseinfo.jsp">Use PL</dsp:option>
                    <dsp:option value="plcheckout2/plpurchaseinfo.jsp">Use PL2</dsp:option>
                  </dsp:oparam>
                </dsp:droplet>
                <dsp:option value="checkout/purchaseinfo.jsp">Simple checkout</dsp:option>
              </dsp:select>

              <!-- Recalculate Button -->
            </dsp:form>
            </div>
            </div>

            <div>
                <%-- Chapter 7, Optional Exercise 7: Display User's Promotions --%>
              All promotions applied:
              <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                <dsp:param name="array"
                           bean="/atg/commerce/pricing/UserPricingModels.allPromotions"/>

                <dsp:oparam name="outputStart"><ul></dsp:oparam>
                <dsp:oparam name="output">
                  <li>
                    <i><dsp:valueof param="element.displayName"/></i><br>
                    <dsp:valueof param="element.type"/><br>
                  </li>
                </dsp:oparam>
                <dsp:oparam name="outputEnd"></ul></dsp:oparam>
                <dsp:oparam name="empty">No promotions applied</dsp:oparam>
              </dsp:droplet>
              <div>
                Coupons claims:
                <dsp:include flush="false" page="CouponClaim.jsp"/>
              </div>

                <%-- Chapter 11, Exercise 1: Create Save Order Form --%>
              <dsp:form action="saved_orders.jsp">
                Enter a name to identify this order:
                <dsp:input bean="SaveOrderFormHandler.description" type="text"/>
                <dsp:input bean="SaveOrderFormHandler.saveOrder"
                           type="submit" value="Save order"/>
                <dsp:input bean="SaveOrderFormHandler.saveOrder"
                           type="hidden" value="save"/>
                <dsp:input bean="SaveOrderFormHandler.saveOrderErrorURL"
                           type="hidden" value="cart.jsp"/>

              </dsp:form>
              <p>
                <b>Go to your <dsp:a href="saved_orders.jsp">saved orders</dsp:a> </b>
              </p>
            </div>

          </dsp:oparam>

          <dsp:oparam name="true">
            Your cart is empty!
          </dsp:oparam>
        </dsp:droplet>

          <%-- Chapter 7, Optional Exercise 7: Display User's Promotions --%>
          <%--<dsp:droplet name="/atg/commerce/order/purchase/ShippingGroupDroplet">--%>

          <%--&lt;%&ndash; Chapter 9, Ex. 2, Steps 1, 2: Set the ShippingGroupDroplet parameters &ndash;%&gt;--%>
          <%--<dsp:param name="clearShippingGroups" param="init"/>--%>
          <%--<dsp:param name="clearShippingInfos" param="init"/>--%>
          <%--<dsp:param name="initShippingGroups" param="init"/>--%>
          <%--<dsp:param name="initShippingInfos" param="init"/>--%>
          <%--<dsp:param name="initBasedOnOrder" param="fromorder"/>--%>
          <%--<dsp:param name="shippingGroupTypes" value="hardgoodShippingGroup"/>--%>

          <%--<dsp:oparam name="output">--%>

          <%--<dsp:droplet name="ForEach">--%>
          <%--<dsp:param name="array" param="shippingGroups"/>--%>
          <%--<dsp:oparam name="output">--%>

          <%--<dsp:droplet name="/atg/dynamo/droplet/Switch">--%>
          <%--<dsp:param name="value" param="key"/>--%>
          <%--<dsp:getvalueof id="SGName" idtype="String"--%>
          <%--param="cisiItem.shippingGroupName">--%>
          <%--<dsp:getvalueof id="keyname" idtype="String" param="key">--%>
          <%--<dsp:oparam name="<%=SGName%>">--%>
          <%--<dsp:option selected="<%=true%>" value="<%=keyname%>"/>--%>
          <%--<dsp:valueof param="key"/>--%>
          <%--</dsp:oparam>--%>
          <%--<dsp:oparam name="default">--%>
          <%--<dsp:option selected="<%=false%>" value="<%=keyname%>"/><dsp:valueof param="key"/>--%>
          <%--</dsp:oparam>--%>
          <%--</dsp:getvalueof>--%>
          <%--</dsp:getvalueof>--%>

          <%--</dsp:droplet>--%>
          <%--</dsp:oparam>--%>
          <%--</dsp:droplet>--%>

          <%--</dsp:oparam>--%>

          <%--</dsp:droplet>--%>

          <%-- Chapter 9, Exercise 1, Step 4: Test ShippingGroup Address --%>
          <%--<dsp:droplet name="/atg/dynamo/droplet/IsEmpty">--%>
          <%--<dsp:param bean="ShoppingCart.current.ShippingGroups[0].shippingAddress.address1" name="value"/>--%>

          <%--<dsp:oparam name="true">--%>
          <%--<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoSuccessURL"--%>
          <%--value="ship_to_multiple.jsp?init=true" type="hidden"/>--%>
          <%--</dsp:oparam>--%>
          <%--<dsp:oparam name="false">--%>
          <%--<dsp:droplet name="/atg/dynamo/droplet/IsEmpty">--%>
          <%--<dsp:param bean="/atg/commerce/order/purchase/ShippingGroupContainerService.shippingGroupMap"--%>
          <%--name="value"/>--%>

          <%--<dsp:oparam name="true">--%>
          <%--<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoSuccessURL"--%>
          <%--value="ship_to_multiple.jsp?init=true&fromoder=true"--%>
          <%--type="hidden"/>--%>

          <%--</dsp:oparam>--%>
          <%--<dsp:oparam name="false">--%>
          <%--<dsp:input bean="CartModifierFormHandler.moveToPurchaseInfoSuccessURL"--%>
          <%--value="ship_to_multiple.jsp?init=false" type="hidden"/>--%>
          <%--</dsp:oparam>--%>
          <%--</dsp:droplet>--%>
          <%--</dsp:oparam>--%>
          <%--</dsp:droplet>--%>
          <%-- Chapter 7, Exercise 3, Step 2: Add Checkout Button --%>

      </td></tr>
  </table>
  </body>
  </html>


</dsp:page>
