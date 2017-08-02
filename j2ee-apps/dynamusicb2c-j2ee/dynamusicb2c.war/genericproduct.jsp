<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" href="css/main.css"/>
  <!-- ATG Training -->
  <!-- Creating Commerce Applications -->
  <!-- storefront page to loop through rootCategories property -->
  <!-- Last modified: 3 Apr 06 by KL -->

  <!-- this is a holder page for the chapter 3, Exercise 4 -->
  <!-- for creating a page to display a product -->

  <!-- Title: DynamusicB2C Product Page -->

  <%-- Declare your "id" parameter here --%>
  <DECLAREPARAM NAME="id" CLASS="java.lang.String" DESCRIPTION="Repository ID">
  <%-- End parameter declaration--%>

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Product Page</TITLE>
  </HEAD>
  <BODY>
  <dsp:droplet name="/atg/commerce/catalog/ProductLookup">
    <dsp:param name="id" param="itemId"/>

    <dsp:oparam name="output">
      <dsp:droplet name="/atg/commerce/catalog/ProductBrowsed">
        <dsp:param name="eventObject" param="element"/>
      </dsp:droplet>

      <dsp:include page="common/header.jsp">
        <dsp:getvalueof id="name" param="element.displayName">
          <dsp:param name="pagename" value="name"/>
        </dsp:getvalueof>
      </dsp:include>
      <table width="700" cellpadding="8">
        <tr>
          <!-- Sidebar -->
          <td width="100" valign="top">
            <jsp:include page="navbar.jsp" flush="true"/>
          </td>
          <!-- Page Body -->
          <td class="body">

            <dsp:droplet name="/atg/commerce/catalog/CatalogNavHistoryCollector">
              <dsp:param name="item" param="element"/>
              <dsp:param name="navAction" param="navAction"/>
              <dsp:param name="navCount" param="navCount"/>
            </dsp:droplet>

            <jsp:include page="breadcrumbs.jsp" flush="true"/><p>
            <h3>
              <dsp:valueof param="element.displayName"/>
            </h3>
            Category:<dsp:valueof param="element.parentCategory.displayName"/>
            <br>
            <p><i><dsp:valueof param="element.description"/></i></p>
            <p>
              <i><dsp:valueof param="element.longDescription"/> </i>
            </p>
            <dsp:include page="skulist.jsp">
              <dsp:param name="product" param="element"/>
            </dsp:include>
          </td>
        </tr>
      </table>
    </dsp:oparam>

    <dsp:oparam name="empty">
      Product with such id=<dsp:valueof param="itemId"/> doesn't exist.
    </dsp:oparam>

  </dsp:droplet>
  </BODY> </HTML>

</dsp:page>
