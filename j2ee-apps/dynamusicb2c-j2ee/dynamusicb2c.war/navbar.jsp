<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

  <!-- This page fragment provides a navigation bar for the Dynamusic lab exercises.
  You can call it from any page in the store. You should add it to the following
  pages as part of the chapter 4 exercises: storefront.jsp, genericcategory.jsp,
  genericproduct.jsp, cart.jsp,and processorder.jsp.
  -->

  <dsp:importbean bean="/atg/dynamo/droplet/Switch"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>

  <!-- Title: New Page Fragment -->
  <b>
  <dsp:a page="/storefront.jsp">Catalog Home</dsp:a><br><br>
  <dsp:a page="/searchpage.jsp">Search</dsp:a><br> <br>
  <dsp:a page="/showwishlist.jsp">My Lists</dsp:a><br> <br>
  <dsp:a page="/cart.jsp">Shopping Cart</dsp:a><br><br>

  <dsp:droplet name="Switch">
    <dsp:param bean="Profile.transient" name="value"/>
    <dsp:oparam name="false">
      <dsp:a page="/orders/lastorderstatus.jsp">Last order status</dsp:a><br><br>
      <dsp:a page="/genericproduct.jsp">
        <dsp:param name="itemId" value="prod40004"/>
        HIT</dsp:a> <br>
      <dsp:a page="/saved_orders.jsp">Saved orders</dsp:a><br>
      <dsp:a page="/logout.jsp">Logout</dsp:a><br><br>
      <dsp:include page="/loyalty/part/sidebar_check_pl_admin.jsp"/>
    </dsp:oparam>
    <dsp:oparam name="true">
      <dsp:a page="/login.jsp">Login</dsp:a> or <dsp:a page="/newProfile.jsp">Register</dsp:a>

    </dsp:oparam>
  </dsp:droplet><br><br>
  <a href="home.jsp">Dynamusic Home</a><br><br>
  &nbsp;<br>
  </b>
</dsp:page>
