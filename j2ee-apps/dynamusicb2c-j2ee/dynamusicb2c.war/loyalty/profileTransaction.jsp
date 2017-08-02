<%@ taglib uri="/dspTaglib" prefix="dsp" %>

<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>
  <dsp:importbean bean="/atg/userprofiling/Profile"/>
  <dsp:importbean bean="/atg/userprofiling/ProfileFormHandler"/>
  <%-- Required input param: itemId (id of the user to display --%>
  <!-------------------------------------------------------------
  Dynamusic Site Mockup
  USER
  Shows a user's transactions.
  If exist userId parameter, check profile role and it has loyaltyAdministrator role, lookup user and show his pl.
  Otherwise show profiles's transactions
  ------------------------------------------------------------->
  <HTML>
  <HEAD>
    <TITLE>Dynamusic User Page</TITLE>
  </HEAD>
  <BODY>

  <dsp:include page="/common/header.jsp">
    <dsp:param name="pagename" value="Profile transactions"/>
  </dsp:include>

  <table class="container">
    <tr>
      <!-- Sidebar -->
      <td class="sidebar">
        <dsp:include page="/common/sidebar.jsp"/>
      </td>
      <!-- Page Body -->
      <td class="body">
        <!-- *** Start page content *** -->
        <div>
          <!-- Check userId-->
            <%--<dsp:valueof param="userId"/>--%>
          <dsp:droplet name="/atg/dynamo/droplet/IsEmpty">
            <dsp:param param="userId" name="value"/>

            <%--show other user pl--%>
            <dsp:oparam name="false">

              <dsp:droplet name="/atg/dynamo/droplet/HasEffectivePrincipal">
                <dsp:param name="type" value="role"/>
                <dsp:param name="id" value="loyaltyAdministrator"/>
                <dsp:oparam name="output">

                  <dsp:droplet name="/atg/targeting/RepositoryLookup">
                    <dsp:param name="id" param="userId"/>
                    <dsp:param name="itemDescriptor" value="user"/>
                    <dsp:param bean="/atg/userprofiling/ProfileAdapterRepository" name="repository"/>

                    <dsp:oparam name="output">

                      <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                        <dsp:param name="array" param="element.loyaltyTransactions"/>
                        <dsp:oparam name="outputStart">
                          <h2 class="subheader">
                            User id=<dsp:valueof param="element.repositoryId"/>,
                            login=<dsp:valueof param="element.login">Unknown</dsp:valueof>
                          </h2>
                          <br>
                          <table class="t_inner">
                          <thead>
                          <tr>
                            <th>Date</th>
                            <th>Description</th>
                            <th>Amount</th>
                          </tr>
                          </thead>
                        </dsp:oparam>
                        <dsp:oparam name="output">
                          <tr>
                            <th><dsp:valueof param="element.date"/> </th>
                            <th><dsp:valueof param="element.description"/> </th>
                            <th><dsp:valueof param="element.amount"/> PL </th>
                          </tr>
                        </dsp:oparam>
                        <dsp:oparam name="outputEnd">
                          <tr>
                            <td colspan="2">Total:</td>
                            <td><dsp:valueof bean="Profile.loyaltyAmount"/></td>
                          </tr>
                          </table>
                        </dsp:oparam>
                        <dsp:oparam name="empty">
                          This user id=<dsp:valueof param="element.repositoryId"/>,
                          <dsp:valueof param="element.login">Unknown</dsp:valueof>
                          has no one PL transaction</dsp:oparam>
                      </dsp:droplet>
                    </dsp:oparam>

                    <dsp:oparam name="empty">User with id=<dsp:valueof param="userId"/> isn't exist </dsp:oparam>
                  </dsp:droplet>  <%--end lookup--%>
                </dsp:oparam>
              </dsp:droplet>  <%--end checking function--%>


            </dsp:oparam>

            <%--show current user pl--%>
            <dsp:oparam name="true">

               <dsp:droplet name="/atg/dynamo/droplet/Switch">
                   <dsp:param bean="Profile.transient" name="value"/>

                   <dsp:oparam name="false">

                     <dsp:droplet name="/atg/dynamo/droplet/ForEach">
                       <dsp:param name="array" bean="Profile.loyaltyTransactions"/>
                       <dsp:oparam name="outputStart">
                         <table class="t_inner">
                         <thead>
                         <tr>
                           <th>Date</th>
                           <th>Description</th>
                           <th>Amount</th>
                         </tr>
                         </thead>
                       </dsp:oparam>
                       <dsp:oparam name="output">
                         <tr>
                           <th><dsp:valueof param="element.date"/> </th>
                           <th><dsp:valueof param="element.description"/> </th>
                           <th><dsp:valueof param="element.amount"/> PL </th>
                         </tr>
                       </dsp:oparam>
                       <dsp:oparam name="outputEnd">
                         <tr>
                           <td colspan="2">Total:</td>
                           <td class="td_right">
                             <dsp:valueof bean="Profile.loyaltyAmount"/> PL
                           </td>
                         </tr>
                         <style>
                           .td_right {
                             text-align: right;
                           }
                         </style>

                         </table></dsp:oparam>
                       <dsp:oparam name="empty"> You have no one PL transaction</dsp:oparam>
                     </dsp:droplet>
                   </dsp:oparam>
                   <dsp:oparam name="true">
                     To see your transactions, please,
                     <dsp:a page="/login.jsp">log in</dsp:a> .

                   </dsp:oparam>
               </dsp:droplet>


              <br>

            </dsp:oparam>

          </dsp:droplet>
        </div>
        <!-- *** End real content *** -->
      </td>
    </tr>
  </table>
  </BODY>
  </HTML>
</dsp:page>
