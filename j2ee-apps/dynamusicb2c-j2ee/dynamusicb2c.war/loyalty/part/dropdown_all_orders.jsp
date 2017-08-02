<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp" %>

<!-------------------------------------------------------------
page for include button Show all users and pick up
------------------------------------------------------------->
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>

  <dsp:importbean bean="/atg/userprofiling/Profile"/>

  <script src="<%=request.getContextPath() + "/js/jquery-2.2.3.js"%>"></script>
  <script src="<%=request.getContextPath() + "/js/dropdown_order.js"%>"></script>

  <div class="dropdown">           <%--start dropdown--%>
    <div id="dropper" class="dropbtn">Show all orders</div>
    <div id="dropdown_users" class="dropdown-content">

      <h4>All orders of user id=<dsp:valueof param="userId"/> :</h4>
      <dsp:droplet name="/atg/commerce/order/OrderLookup">
        <dsp:param param="userId" name="userId"/>

        <dsp:oparam name="output">
          <dsp:droplet name="/atg/dynamo/droplet/ForEach">
            <dsp:param param="result" name="array"/>
            <dsp:oparam name="outputStart">
              <table class="t_inner strong">
              <tr>
                <th>Order Id</th>
                <th>Creation date</th>
                <th>Amount</th>
                <th>State</th>
                <th>Action</th>
              </tr>
            </dsp:oparam>
            <dsp:oparam name="output">
              <tr>
                <td><dsp:valueof param="element.repositoryId"/> </td>
                <td><dsp:valueof date="MMMMM d, yyyy h:mm a"  param="order.creationDate"/></td>
                <td><dsp:valueof param="element.priceInfo.amount"/> </td>
                <td><dsp:valueof param="element.state"/> </td>
                <td>
                  <input type="hidden" name="orderId_picked" value="<dsp:valueof param="element.repositoryId"/>"/>
                </td>
              </tr>
            </dsp:oparam>
            <dsp:oparam name="outputEnd">
              </table>
            </dsp:oparam>
            <dsp:oparam name="empty">
              No open orders.
            </dsp:oparam>
          </dsp:droplet>

        </dsp:oparam>
      </dsp:droplet>
    </div>
  </div> <br><br>
  <%--end dropdown--%>
</dsp:page>