

<%--
/loyalty/part/sidebar_check_pl_admin.jsp
presume check that profile isn't transient

--%>
<%@ taglib prefix="dsp" uri="/dspTaglib" %>
<dsp:page>
  <dsp:link rel="stylesheet"
            type="text/css"
            href="../css/main.css"/>

  <dsp:droplet name="/atg/dynamo/droplet/HasEffectivePrincipal">
    <dsp:param name="type" value="role"/>
    <dsp:param name="id" value="loyaltyAdministrator"/>
    <dsp:oparam name="output">
      <dsp:a href="../loyaltyAdmin.jsp">PL administration</dsp:a>&nbsp;<br>
      <dsp:a href="../profileTransaction.jsp">My transactions</dsp:a><br>
      <dsp:a href="../orderLoyaltyAdmin.jsp">PL order administration</dsp:a>&nbsp;<br>
    </dsp:oparam>
    <dsp:oparam name="default">
      <dsp:a href="../profileTransaction.jsp">My transactions</dsp:a>
    </dsp:oparam>
  </dsp:droplet>

</dsp:page>
