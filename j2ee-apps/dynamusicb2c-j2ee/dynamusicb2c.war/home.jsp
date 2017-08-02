<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/dynamusic/FeaturedSongs"/>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup

  HOME

  Central page for the site; landing point following login,
  providing starting point for site's pages.

  ------------------------------------------------------------->


  <HTML>
  <HEAD>
    <TITLE>Dynamusic Home</TITLE>
  </HEAD>
  <BODY>
  <!-- (replace this entire section by dynamically including
        common/header.jsp) -->
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Home Page"/>
  </dsp:include>
  <!-- (end header banner) -->


  <table class="container">
    <tr>
      <td class="navbar">
        <dsp:include page="/navbar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- *** Start page content *** -->
        <table width="560">
          <tr>
            <td>
              <dsp:droplet name="/atg/dynamo/droplet/Switch">
              <dsp:param bean="Profile.transient" name="value"/>
              <dsp:oparam name="true">
              Welcome to Dynamusic.  <a href="newProfile.jsp">Click here</a> to register. <p>
              </dsp:oparam>
              <dsp:oparam name="false">
              <p>Welcome, <dsp:valueof bean="Profile.firstName"/><p>
              </dsp:oparam>
              </dsp:droplet>

              This week's featured songs are:

              <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                <dsp:param bean="FeaturedSongs.songs" name="array"/>
              <dsp:oparam name="outputStart">
              <ul>
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
              </ul>
              </dsp:oparam>
              <dsp:oparam name="output">
              <li><dsp:valueof param="element"/>

                </dsp:oparam>
                <dsp:oparam name="empty">
                No featured songs this week.
                </dsp:oparam>
                </dsp:droplet>
            </td>
          </tr>

          <tr><td height="80">&nbsp;</td><td></td></tr>
          <tr>
            <td valign="top">
              <dsp:droplet name="/atg/targeting/TargetingForEach">
                <dsp:param bean="/atg/registry/RepositoryTargeters/EventsRepository/VenueTargeter" name="targeter"/>

                <dsp:oparam name="outputStart">
                  Venues near you: <br>
                  <ul>
                </dsp:oparam>

                <dsp:oparam name="output">
                  <li><dsp:a href="venueDetails.jsp">
                    <dsp:param name="itemId" param="element.id"/>
                    <dsp:valueof param="element.name"/>
                  </dsp:a></li>
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
                  </ul>
                </dsp:oparam>
                <dsp:oparam name="empty">

                </dsp:oparam>
              </dsp:droplet>
            </td>
          </tr>

          <tr>
            <td>
              <dsp:droplet name="/atg/targeting/TargetingRandom">
                <dsp:param bean="/atg/registry/RepositoryTargeters/UserProfiles/UserInterestTargeter" name="targeter"/>
                <dsp:param name="howMany" value="3"/>
                <dsp:param name="fireContentEvent" value="false"/>
                <dsp:param name="fireContentTypeEvent" value="false"/>

                <dsp:oparam name="outputStart">
                  Users with similar interests to yours:
                  <ul>
                </dsp:oparam>
                <dsp:oparam name="output">
                  <li>
                    <dsp:a href="user.jsp">
                      <dsp:param name="itemId" param="element.id"/>
                      <dsp:valueof param="element.firstName"/> <dsp:valueof param="element.lastName"/>
                    </dsp:a>
                  </li>
                </dsp:oparam>
                <dsp:oparam name="outputEnd">
                  </ul>
                </dsp:oparam>
              </dsp:droplet>
            </td>
          </tr>
        </table>

        <!-- *** End real content *** -->
      </td>
    </tr>
  </table>
  </BODY>
  </HTML>
</dsp:page>
