<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="css/main.css"/>

  <!-------------------------------------------------------------
  Dynamusic Site Mockup

  SUCCESS

  Generic form submission success page.

  ------------------------------------------------------------->


  <HTML>
  <HEAD>
    <TITLE>Dynamusic Artists</TITLE>
  </HEAD>
  <BODY>

  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Success"/>
  </dsp:include>
  <table width="700" cellpadding="8">
    <tr>
      <!-- Sidebar -->
      <td width="100" bgcolor="ghostwhite" valign="top">
        <dsp:include page="common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->

      <td class="body">

        <!-- *** Start page content *** -->
        Thank you.  Your form submission was successful.
        <!-- *** End content *** -->

      </td>
  </table>
  </BODY>
  </HTML>
</dsp:page>

