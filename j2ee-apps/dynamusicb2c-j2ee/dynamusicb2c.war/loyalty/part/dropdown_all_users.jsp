<%@ taglib uri="http://www.atg.com/taglibs/daf/dspjspTaglib1_0" prefix="dsp" %>

<!-------------------------------------------------------------
page for include button Show all users and pick up
need param for button class for js usage
------------------------------------------------------------->
<dsp:page>
  <dsp:link rel="stylesheet" type="text/css" page="/css/main.css"/>

  <dsp:importbean bean="/atg/userprofiling/Profile"/>

  <script src="<%=request.getContextPath() + "/js/jquery-2.2.3.js"%>"></script>
  <script src="<%=request.getContextPath() + "/js/dropdown_user.js"%>"></script>

  <div class="dropdown">           <%--start dropdown--%>
    <div id="dropper" class="dropbtn">Show all users</div>
    <div id="dropdown_users" class="dropdown-content">

      <h4>All users:</h4>
      <dsp:droplet name="/atg/dynamo/droplet/RQLQueryForEach">
        <dsp:param name="repository" value="/atg/userprofiling/ProfileAdapterRepository"/>
        <dsp:param name="itemDescriptor" value="user"/>
        <dsp:param name="queryRQL" value="ALL ORDER BY login"/>

        <dsp:oparam name="outputStart">
          <table class="t_inner strong">
          <tr>
            <th>Login</th>
            <th>id</th>
            <th>First name</th>
            <th>Last name</th>
            <th>Action</th>
          </tr>
        </dsp:oparam>
        <dsp:oparam name="output">
          <tr>
            <td>
              <dsp:a page="userDetails.jsp">
                <dsp:param name="itemId" param="element.repositoryId"/>
                <dsp:valueof param="element.login"/>
              </dsp:a>
            </td>
            <td><dsp:valueof param="element.repositoryId"/> </td>
            <td><dsp:valueof param="element.firstName"/> </td>
            <td><dsp:valueof param="element.lastName"/> </td>
            <td>
              <button type="submit" class="<dsp:valueof param="btn_class"/>"
                      name="userId" value="<dsp:valueof param="element.repositoryId"/>">
                Pick up user</button>
            </td>
          </tr>
        </dsp:oparam>
        <dsp:oparam name="outputEnd"></table></dsp:oparam>
        <dsp:oparam name="empty"><div>No users found</div></dsp:oparam>
      </dsp:droplet>
    </div>
  </div> <br><br>
  <%--end dropdown--%>
</dsp:page>