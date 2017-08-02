<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

  <dsp:importbean bean="/atg/commerce/catalog/CatalogNavHistory"/>

  <!-- ATG Training -->
  <!-- Creating Commerce Applications -->
  <!-- storefront page to loop through rootCategories property -->
  <!-- Last modified: 4 Apr 06 by KL -->

  <!-- this is a holder page for the chapter 4, Exercise 2 -->
  <!-- for creating a page to display a category -->
  <!-- This fragment shows a "bread crumb trail", showing the user's navigation
  history, and allowing them to link to the previous products and categories
  they have viewed. -->
  <!-- Title: Breadcrumbs -->

  <font face="Verdana,Geneva,Arial" size="2" color="midnightblue">
    <style>
      ul.block, ul.block > li{
        display: inline-block;
        list-style: none;

      }
      ul.block{
        margin: 0;
        padding:0;
        -webkit-margin-before: 0;
        -webkit-padding-start: 0;
      }
    </style>
      <%-- Chapter 4, Exercise 2 --%>
      <%-- Insert ForEach droplet to iterate through the navHistory --%>

    <dsp:droplet name="/atg/dynamo/droplet/ForEach">
      <dsp:param name="array" bean="CatalogNavHistory.navHistory"/>

      <dsp:oparam name="outputStart">
        <ul class="block">History:
      </dsp:oparam>
      <dsp:oparam name="output">
        <dsp:param name="historyElement" param="element"/>
        <li>
          <dsp:getvalueof id="templateURL" idtype="java.lang.String" param="historyElement.template.url">
            <dsp:a href="<%=templateURL%>" >
              <dsp:param name="id" param="historyElement.repositoryId"/>
              <dsp:param name="navAction" value="pop"/>
              <dsp:param name="navCount" bean="CatalogNavHistory.navCount"/>
              <dsp:valueof param="element.displayName"/></dsp:a>
          </dsp:getvalueof>

          <dsp:droplet name="/atg/dynamo/droplet/Compare">
            <dsp:param param="count" name="obj1"/>
            <dsp:param param="size" name="obj2"/>
            <dsp:oparam name="lessthan" >
              >
            </dsp:oparam>
          </dsp:droplet>
        </li>
      </dsp:oparam>
      <dsp:oparam name="outputEnd"></ul></dsp:oparam>
      <dsp:oparam name="empty">

      </dsp:oparam>
    </dsp:droplet>

  </font>
</dsp:page>
