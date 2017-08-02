<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>

  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  Sidebar
  Page fragment displaying the sidebar, common to all pages.

  ------------------------------------------------------------->

  <b>
    <dsp:a page="../storefront.jsp">
      Dynamusic
      <dsp:param name="navaction" value="jump"/>
    </dsp:a><br><br>
    <dsp:a page="/home.jsp">Home</dsp:a>
    &nbsp;<br>

    <dsp:a page="/artists.jsp">Artists</dsp:a> <br>
    <dsp:a page="/venues.jsp">Venues</dsp:a> <br>
    <dsp:a page="/search.jsp">Search</dsp:a> <br>
    <dsp:droplet name="/atg/dynamo/droplet/Switch">
      <dsp:param bean="Profile.transient" name="value"/>
      <dsp:oparam name="true">
        <br>
        <dsp:a page="/login.jsp">Log In</dsp:a> <br>
      </dsp:oparam>
      <dsp:oparam name="false">
        <dsp:a page="/updateProfile.jsp">Profile</dsp:a> <br>
        <dsp:a page="/playlists.jsp">Playlists</dsp:a> <br>
        <dsp:a page="/uploadsong.jsp">Upload Song</dsp:a><br><br>
        <dsp:a page="/saved_orders.jsp">Saved orders</dsp:a><br><br>

        <dsp:a page="/logout.jsp">Log Out</dsp:a> <br><br>
        <dsp:include page="/loyalty/part/sidebar_check_pl_admin.jsp"/>
      </dsp:oparam>
    </dsp:droplet>
  </b>
</dsp:page>

