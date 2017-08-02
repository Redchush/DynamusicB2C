<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspELTaglib1_0" prefix="dsp" %>


<dsp:page>
  <dsp:importbean bean="/atg/registry/RepositoryTargeters/ProductCatalog/RootCategories"/>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>
  <!-- ATG Training -->
  <!-- Creating Commerce Applications -->
  <!-- storefront page to loop through rootCategories property -->
  <!-- Last modified: 1 May 07 by RM -->

  <!-- this is a holder page for the chapter 3 labs -->

  <%--IMPORTANT: <%@ taglib uri="/dspTaglib" prefix="dsp" %> --> <dsp:a href="<%=templateURL%>" doesn't work!!! >--%>
  <!-- Title: DynamusicB2C Storefront -->

  <HTML>
  <HEAD>
    <TITLE>Dynamusic Store</TITLE>
  </HEAD>
  <BODY>
  <dsp:include page="common/header.jsp">
    <dsp:param name="pagename" value="Dynamusic Store"/>
  </dsp:include>
  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="/navbar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
            <%-- Chapter 3, Exercise 1: Create a Front Page for Your Catalog --%>
            <%-- Insert TargetingForEach to loop through RootCategories below this line --%>
          <dsp:droplet name="/atg/targeting/TargetingForEach">
            <dsp:param bean="/atg/registry/RepositoryTargeters/ProductCatalog/RootCategories" name="targeter"/>
            <dsp:oparam name="outputStart">
              Categories: <br>
              <ul>
            </dsp:oparam>
            <dsp:oparam name="output">
              <li>
                <dsp:getvalueof id="templateURL" idtype="java.lang.String" param="element.template.url">
                  <dsp:a href="${templateURL}" >
                    <dsp:param name="itemId" param="element.repositoryId"/>
                    <dsp:valueof param="element.displayName"/>
                    <dsp:param name="navAction" value="jump"/>
                    <dsp:param name="navCount" bean="/atg/commerce/catalog/CatalogNavHistory.navCount"/>
                  </dsp:a>
                </dsp:getvalueof>
              </li>
            </dsp:oparam>
            <dsp:oparam name="outputEnd">
              </ul>
            </dsp:oparam>

          </dsp:droplet>
          <%-- End: TargetingForEach --%>

      </td>
    </tr>
  </table>
  </BODY>
  </HTML>


</dsp:page>
