<%@ taglib uri="/dspTaglib" prefix="dsp" %>
<dsp:page>

  <!-- ATG Training -->
  <!-- Creating Commerce Applications -->
  <!-- Fragment for displaying a SKU's discounted price -->
  <!-- Last modified: 4 Apr 06 by KL -->

  <!-- Title: Discount Price Page -->

  <%-- Chapter 5, Exercise 1 --%>
  <%--2. Two parameters will be passed in from skulist.jsp: product and sku.--%>
  <dsp:droplet name="/atg/commerce/pricing/PriceItem">
    <dsp:param name="product" param="product"/>
    <dsp:param name="item" param="sku"/>
    <%--<dsp:param name="elementName" param="priceItem"/>--%>

    <dsp:oparam name="output">
      <%--commerceItem type--%>
      <dsp:param name="priceItem" param="element"/>
      List price:
      <dsp:valueof converter="currency" param="priceItem.priceInfo.listPrice"/>
      You price:
      <dsp:valueof converter="currency"
                   param="priceItem.priceInfo.amount"/>
      <br><br>
      Difference:
      <%--<dsp:valueof param="priceItem.priceInfo"/>--%>
      <dsp:droplet name="/atg/dynamo/droplet/Switch">
        <dsp:param param="sku.onSale" name="value"/>

        <dsp:oparam name="true">
          You price on salePrice:
          <dsp:valueof converter="currency"
                       param="priceItem.priceInfo.salePrice"/>

        </dsp:oparam>
        <dsp:oparam name="false">
          You price from listPrice:
          <dsp:valueof converter="currency"
                       param="priceItem.priceInfo.listPrice"/>
        </dsp:oparam>
      </dsp:droplet>

    </dsp:oparam>
  </dsp:droplet>
</dsp:page>

