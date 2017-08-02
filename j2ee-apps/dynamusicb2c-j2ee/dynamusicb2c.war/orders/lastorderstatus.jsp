<!-- ATG Training -->
<!-- Creating Commerce Applications -->
<!-- final order page showing status -->
<!-- Last modified: 1 May 07 by RM -->

<!-- Title: Order Status -->

<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Order Status</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="/common/header.jsp">
    <dsp:param name="pagename" value="Order Status"/>
  </dsp:include>
  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="navbar">
        <jsp:include page="/navbar.jsp" flush="true"/>
      </td>
      <!-- Page Body -->
      <td class="body">
          <%-- Ch. 8, Ex. 2, Step 2: Display order number --%>
        <p>
          Thank you for your order. Please come back soon!<br>
        <div class="gr_header">Details:</div>
        Your order's id is:
        <i><dsp:valueof bean="ShoppingCart.last.id"/></i><br>
        Status:
        <i><dsp:valueof bean="ShoppingCart.last.stateAsString"/></i><br>
        Amount:
        <i><dsp:valueof bean="ShoppingCart.last.priceInfo.amount"
                        converter="currency"/></i><br>
        Total:
        <i><dsp:valueof bean="ShoppingCart.last.priceInfo.total"
                        converter="currency"/></i>

        <div>
          <div class="gr_header">Payment information:</div>
          <dsp:droplet name="/atg/dynamo/droplet/ForEach">
            <dsp:param name="array" bean="ShoppingCart.last.paymentGroups"/>
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
                    Amount in currency:  <dsp:valueof param="element.amount" converter="currency"/> PL.
                  </dsp:oparam>
                  <dsp:oparam name="default">
                    <dsp:valueof param="element.amount" converter="currency"/>
                  </dsp:oparam>
                </dsp:droplet>
              </li>
            </dsp:oparam>
            <dsp:oparam name="outputEnd"></ul><br></dsp:oparam>
            <dsp:oparam name="empty">
            </dsp:oparam>
          </dsp:droplet>
        </div>
        After finishing this order you will receive PL:
        <i> <dsp:valueof bean="ShoppingCart.last.priceInfo.receivedPL"/> PL</i><br>



      </td>
    </tr>
  </table>
  </body>
  </html>

</dsp:page>
