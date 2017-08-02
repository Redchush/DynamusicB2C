<%--<%@ taglib uri="/dspTaglib" prefix="dsp" %>--%>
<%--<dsp:page>--%>

<%--<dsp:importbean bean="/atg/commerce/order/OrderLookup"/>--%>
<%--<dsp:importbean bean="/atg/userprofiling/Profile"/>--%>
<%--<dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>--%>
<%--<dsp:importbean bean="/atg/commerce/ShoppingCart"/>--%>


<%--<%/* expect a order number to be passed in, we could be acceepting a orderid but run the risk of users trying random orderId's and--%>
<%--seeing other people's orders. We might use the obfuscated id generator, but this is safter then even that*/%>--%>

<%--<DECLAREPARAM NAME="orderId" CLASS="java.lang.Integer" DESCRIPTION="number of the saved order">--%>



<%--<dsp:include page="../common/HeadBody.jsp" flush="false"><dsp:param name="pagetitle" value=" Saved Order"/></dsp:include>--%>

<%--<table border=0 cellpadding=0 cellspacing=0 width=800>--%>
<%--<tr>--%>
<%--<td colspan=2><dsp:include page="../common/BrandNav.jsp" flush="false"/></td>--%>
<%--</tr>--%>
<%--<tr bgcolor="#DBDBDB" >--%>
<%--<dsp:droplet name="OrderLookup">--%>
<%--<dsp:param name="orderId"  param="orderId"/>--%>
<%--<dsp:oparam name="output">--%>
<%--<dsp:getvalueof id="resultParam" param="result">--%>
<%--<dsp:setvalue  value="<%=resultParam%>"  param="order"/>--%>
<%--<td colspan=2 height=18> &nbsp; <span class=small>--%>
<%--<dsp:a href="my_account.jsp">My Account</dsp:a> &gt;--%>
<%--<dsp:a href="saved_orders.jsp">Saved Orders</dsp:a> &gt;--%>
<%--<dsp:valueof  param="order.description"/></span>--%>
<%--</td>--%>
<%--</dsp:getvalueof>--%>
<%--</dsp:oparam>--%>
<%--</dsp:droplet>--%>
<%--</tr>--%>


<%--<tr valign=top>--%>
<%--<td width=55><img src="../images/d.gif" hspace=27></td>--%>
<%--<td valign="top" width=745>--%>


<%--<!-- if nothing is in the cart say there is nothing in the cart -->--%>
<%--<!-- put errors here -->--%>
<%--<!-- this table just for indent -->--%>

<%--<table border=0 cellpadding=4 width=80%>--%>
<%--<tr><td><img src="../images/d.gif"></td></tr>--%>
<%--<tr>--%>
<%--<td colspan=2><span class="big">My Account</span></td>--%>
<%--</tr>--%>
<%--<tr><td><img src="../images/d.gif"></td></tr>--%>
<%--<tr>--%>
<%--<td colspan=2><table width=100% cellpadding=3 cellspacing=0 border=0>--%>
<%--<tr><td class=box-top>&nbsp;Saved Order</td></tr></table></td>--%>
<%--</tr>--%>
<%--<tr>--%>

<%--<dsp:droplet name="OrderLookup">--%>
<%--<dsp:param name="orderId" param= "orderId"/>--%>
<%--<dsp:param name="userId"  bean= "Profile.repositoryId"/>--%>
<%--<dsp:param value="incomplete" name="state"/>--%>
<%--<dsp:oparam name="error">--%>
<%--Could not retreive the specified order : <dsp:valueof  param="errorMsg"/>--%>
<%--</dsp:oparam>--%>
<%--<dsp:oparam name="output">--%>
<%--<dsp:getvalueof id="resultParam" param="result">--%>
<%--<dsp:setvalue value="<%=resultParam%>" param="order"/>--%>
<%--</dsp:getvalueof>--%>

<%--<td><br><b><dsp:valueof  param="order.description"/></b><br>--%>
<%--<span class=small>Order # <dsp:valueof  param="order.Id"/>--%>
<%--- Saved <dsp:valueof date="MMMMM d, yyyy h:mm a"  param="order.creationDate"/></span>--%>

<%--<table border=0 cellpadding=4 cellspacing=1>--%>
<%--<tr bgcolor="#666666">--%>
<%--<td colspan=2><span class=smallbw>Part #</span></td>--%>
<%--<td colspan=2><span class=smallbw>Name</span></td>--%>
<%--<td colspan=2 align=middle><span class=smallbw>Qty</span></td>--%>
<%--<td colspan=2align=middle><span class=smallbw>Total</span></td>--%>

<%--</tr>--%>

<%--<dsp:droplet name="ForEach">--%>
<%--<dsp:param name="array" param="order.commerceItems"/>--%>
<%--<dsp:oparam name="output">--%>
<%--<dsp:getvalueof id="currentItem" param="element" idtype="atg.commerce.order.CommerceItem">--%>
<%--<tr valign=top>--%>

<%--&lt;%&ndash; Display part number, product name/link, inventory info columns &ndash;%&gt;--%>
<%--<dsp:include page="../checkout/cart_line_item.jsp" flush="false">--%>
<%--<dsp:param name="item" value="<%=currentItem%>"/>--%>
<%--</dsp:include>--%>

<%--&lt;%&ndash; Display quantity &ndash;%&gt;--%>
<%--<td align=center><dsp:valueof param="element.quantity"/></td>--%>
<%--<td></td>--%>

<%--&lt;%&ndash; display total list price and any discounted total price &ndash;%&gt;--%>
<%--<dsp:include page="../common/DisplayAmount.jsp" flush="false">--%>
<%--<dsp:param name="item" value="<%=currentItem%>"/>--%>
<%--</dsp:include>--%>

<%--</tr>--%>
<%--</dsp:getvalueof>--%>
<%--</dsp:oparam>--%>
<%--</dsp:droplet>--%>

<%--<tr>--%>
<%--<td colspan=8><table border=0 cellpadding=0 cellspacing=0 width=100%>--%>
<%--<tr bgcolor="#666666"><td><img src="../images/d.gif"></td></tr></table>--%>
<%--</tr>--%>
<%--<tr>--%>
<%--<td colspan=4>&nbsp; </td>--%>
<%--<td>Subtotal</td>--%>
<%--<td></td>--%>
<%--<td align="right">--%>
<%--<b><dsp:valueof converter="currency" locale="Profile.priceList.locale" param="order.priceInfo.amount"/></b>--%>
<%--</td>--%>
<%--</tr>--%>

<%--<tr><td><br></td></tr>--%>
<%--<tr>--%>
<%--<td colspan=4 align=right>--%>
<%--<dsp:form formid="use" action="../checkout/cart.jsp" method="post">--%>
<%--<dsp:input bean="ShoppingCart.handlerOrderId" paramvalue="order.id" type="hidden"/>--%>
<%--<dsp:input bean="ShoppingCart.switch" type="submit" value="Make this your current order"/> &nbsp;--%>
<%--</dsp:form>--%>
<%--</td>--%>
<%--<td colspan=2 align=left>--%>
<%--<dsp:form formid="delete" action="../user/saved_orders.jsp" method="post">--%>
<%--<dsp:input bean="ShoppingCart.handlerOrderId" paramvalue="order.id" type="hidden"/>--%>
<%--<dsp:input bean="ShoppingCart.delete" type="submit" value="Delete"/> &nbsp;--%>
<%--</dsp:form>--%>
<%--</td>--%>
<%--</tr>--%>
<%--<!-- end indent table -->--%>
<%--</table>--%>
<%--</td>--%>
<%--</dsp:oparam> <%/*orderlookup*/%>--%>
<%--</dsp:droplet>--%>

<%--</tr>--%>
<%--</table>--%>
<%--</td>--%>
<%--</tr>--%>
<%--</table>--%>
<%--</div>--%>
<%--</body>--%>
<%--</html>--%>
<%--</dsp:page>--%>
<%--&lt;%&ndash; @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2C/j2ee-apps/dynamusicb2c-j2ee/dynamusicb2c.war/saved_order.jsp#9 $$Change: 514668 $&ndash;%&gt;--%>


<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

  <dsp:importbean bean="/atg/commerce/order/OrderLookup"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/atg/dynamo/droplet/ForEach"/>
  <dsp:importbean bean="/atg/commerce/ShoppingCart"/>
  <dsp:link rel="stylesheet" type="text/css" href="css/main.css"/>

  <%/* expect a order number to be passed in, we could be acceepting a orderid but run the risk of users trying random orderId's and
seeing other people's orders. We might use the obfuscated id generator, but this is safter then even that*/%>

  <DECLAREPARAM NAME="orderId" CLASS="java.lang.Integer"
  DESCRIPTION="number of the saved order">

  <!-- ATG Training -->
  <!-- Creating Commerce Applications Part I -->
  <!-- Save Order Page -->
  <!-- Last modified: 1 May 07 by RM -->

  <HTML>
  <HEAD>
    <TITLE>Save Order</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="View My Saved Order"/>
  </dsp:include>
  <table class="container">
    <tr>
      <td class="navbar">
        <jsp:include page="navbar.jsp" flush="true"/>
      </td>

      <!-- Page Body -->
      <td class="body">
        <dsp:a href="saved_orders.jsp">Saved Orders</dsp:a> &gt;
          <%-- Enter OrderLookup droplet and input parameters --%>
        <dsp:droplet name="OrderLookup">
        <dsp:param name="orderId" param="orderId"/>
        <dsp:param name="userId" param="Profile.repositoryId"/>
        <dsp:param name="incomplete" param="state"/>

        <dsp:oparam name="error">
          <div class="error">
            Could not retrieve the specified order : <dsp:valueof  param="errorMsg"/>
          </div>
        </dsp:oparam>

        <dsp:oparam name="output">
        <dsp:param name="order" param="result"/>

        <b>
        Saved Order: <dsp:valueof  param="order.description"/></b><br>
        Order # <dsp:valueof  param="order.Id"/><br>
        Saved <dsp:valueof date="MM d, yyyy h:mm a"  param="order.creationDate"/>
        <p>

          <dsp:droplet name="ForEach">
            <dsp:param name="array" param="order.commerceItems"/>

            <dsp:oparam name="output">
              <%-- Display part number, product name/link, inventory info columns --%>
              <dsp:include page="cart_line_item.jsp" flush="false">
                <dsp:param name="item" param="element"/>
              </dsp:include>&nbsp;&nbsp;&nbsp;
              Qty: <dsp:valueof param="element.quantity"/><br>
              &nbsp;&nbsp;&nbsp;

              <%-- display total list price and any discounted total price --%>
              <dsp:include page="DisplayAmount.jsp" flush="false">
                <dsp:param name="item" param="element"/>
              </dsp:include><br>


            </dsp:oparam>
          </dsp:droplet>
        </p>
        <p>
          <b>Subtotal</b>
          <b><dsp:valueof converter="currency" param="order.priceInfo.amount"/></b>
        </p>
        <p>

            <%-- Insert a form to make this order current --%>
          <dsp:form formid="use" action="cart.jsp" method="post">
            <dsp:input bean="ShoppingCart.handlerOrderId"
                       type="hidden" paramvalue="order.id"/>
            <dsp:input bean="ShoppingCart.switch"
                       type="submit" value="Make this your current order"/>
          </dsp:form>

            <%-- Insert a form to delete this saved order --%>
          <dsp:form formid="delete" action="saved_orders.jsp" method="post">
            <dsp:input bean="ShoppingCart.handlerOrderId"
                       type="hidden" paramvalue="order.id"/>
            <dsp:input bean="ShoppingCart.delete"
                       type="submit" value="Delete"/>
          </dsp:form>
          </dsp:oparam> <%/*orderlookup*/%>
          </dsp:droplet>
        </p>


      </td>
    </tr>
  </table>
  </body>
  </html>
</dsp:page>
<%-- @version $Id: //edu/ILT-Courses/main/Commerce/StudentFiles/Commerce/setup/DynamusicB2B/j2ee-apps/dynamusicb2b-j2ee/dynamusicb2b.war/saved_order.jsp#9 $$Change: 514668 $--%>
