<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup

  Header

  Page fragment displaying the site's header, common to all
  pages.

  ------------------------------------------------------------->

  <dsp:img src="../images/Dynamusic.jpg"/>
  <table width="700" cellpadding="8" class="header">
    <tr>
      <td width="100"></td>
      <td class="title">
        <dsp:valueof param="pagename"/>
        <br>
        <hr size="8">
      </td>
    </tr>
  </table>
</dsp:page> 