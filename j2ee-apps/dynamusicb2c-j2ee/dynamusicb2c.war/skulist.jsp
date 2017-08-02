<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>
  <dsp:importbean bean="/atg/commerce/order/purchase/CartModifierFormHandler"/>


  <!-- ATG Training -->
  <!-- Creating Commerce Applications -->
  <!-- fragment to loop through a list of SKUs and display SKU info -->
  <!-- Last modified: 1 May 07 by RM -->

  <!-- this is a holder page for the chapter 3 labs -->

  <!-- Title: Sku List -->
  <%-- Chapter 3, Exercise 5 --%>
  <%-- Insert ForEach droplet to loop through product.childSKUs --%>

    <dsp:droplet name="/atg/dynamo/droplet/ForEach">
    <dsp:param name="array" param="product.childSKUs"/>

    <dsp:oparam name="outputStart">
    <div>Skulist:
      <ul>
        </dsp:oparam>
        <dsp:oparam name="outputEnd"></ul>
    </div></dsp:oparam>


    <dsp:oparam name="output">
    <dsp:param name="sku" param="element"/>
    <!-- display SKU name -->
    <li class="none_list">
      <p>
        <dsp:droplet name="/atg/dynamo/droplet/IsNull">
          <dsp:param param="sku.smallImage" name="value"/>
          <dsp:oparam name="false">
            <dsp:getvalueof param="sku.smallImage.url" idtype="String" id="img">
              <img src="<%=img%>"><br>
            </dsp:getvalueof>
          </dsp:oparam>
          <dsp:oparam name="true">

            <dsp:droplet name="/atg/dynamo/droplet/IsNull">
              <dsp:param param="product.smallImage" name="value"/>
              <dsp:oparam name="false">
                <dsp:getvalueof param="product.smallImage.url" idtype="String" id="img">
                  <img src="<%=img%>"><br>
                </dsp:getvalueof>
              </dsp:oparam>
            </dsp:droplet>

          </dsp:oparam>
        </dsp:droplet> <%--end IsNull droplet--%>

        <dsp:valueof param="sku.displayName"/>
      </p>

        <%-- Chapter 5, Ex. 1: include discountedprice.jsp to display list and discounted price --%>
        <%-- pass product (passed in from genericproduct.jsp) and sku (from the ForEach here) as parameters named product and sku --%>
      <div class="price">
        <dsp:include page="discountprice.jsp">
          <dsp:param name="product" param="product"/>
          <dsp:param name="sku" param="sku"/>
        </dsp:include>
          <%--<dsp:valueof converter="currency" param="sku.listPrice"/>--%>
      </div>

      <dsp:include page="addtocart.jsp">
        <dsp:param name="productId" param="product.repositoryId"/>
        <dsp:param name="skuId" param="sku.repositoryId"/>
      </dsp:include>

      <b>Inventory information:</b><br>
      <dsp:droplet name="/atg/commerce/inventory/InventoryLookup">
        <dsp:param name="useCache" value="false"/>
        <dsp:param name="itemId" param="sku.repositoryId"/>
        <dsp:oparam name="output">
          <dsp:valueof param="sku.repositoryId"/><br>
          Status msg: <dsp:valueof param="inventoryInfo.availabilityStatusMsg">
          Unknown
        </dsp:valueof><br>
          stock Level: <dsp:valueof param="inventoryInfo.stockLevel"><br>
          Unknown
        </dsp:valueof>
          preorderLevel:
          <dsp:valueof param="inventoryInfo.preorderLevel">Unknown</dsp:valueof><br>
          availabilityStatus:
          <dsp:valueof param="inventoryInfo.availabilityStatus">Unknown</dsp:valueof><br>

        </dsp:oparam>
      </dsp:droplet>

      </dsp:oparam>

      <dsp:oparam name="empty">
      There are no SKUS to display for this product.
      </dsp:oparam>
      </dsp:droplet>

</dsp:page>
