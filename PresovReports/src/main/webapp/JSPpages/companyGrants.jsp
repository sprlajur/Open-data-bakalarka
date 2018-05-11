<%-- 
    Document   : companyContracts
    Created on : May 6, 2018, 2:44:14 PM
    Author     : sprlajur
--%>

<%@page import="entity.GrantEntity"%>
<%@page import="constants.UrlParameters"%>
<%@page import="constants.Urls"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="entity.ContractEntity"%>
<%@page import="constants.RequestAttributeNames"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <link href="${pageContext.request.contextPath}/css/statisticsStyles.css" rel="stylesheet" type="text/css"/>
        <script src="${pageContext.request.contextPath}/javascript/sorttable.js"></script>
    </head>
    <body>
        <%
            List<GrantEntity> grants = (List<GrantEntity>) request.getAttribute(RequestAttributeNames.ALL_GRANTS);
            int height = grants.size() > 2 ? 300 : 120;
        %><div class = "table-top-container" style="margin: auto; height: <%=(height + 50)%>px; width: 100%">
            <h4>Dotácie od mesta Prešov</h4>
            <div class="table-container">
                <div></div>
                <table cellspacing="0" class="statisticstable" id="sortable" style="height: <%=(height)%>px;  width: 100%;">
                    <thead>
                        <tr>
                            <th class="sorttable_nosort" style="width: 600px; max-width: 600px;"><div style="width:600px;">Akcia</div></th>
                            <th><div style="width:150px">Rok dotácie</div></th>
                            <th><div style="width:150px">Stav vybavenia</div></th>
                            <th><div style="width:250px">Schválené prostriedky</div></th>
                        </tr>
                    </thead>
                    <%
                        if (grants != null) {
                            for (int i = 0; i < grants.size(); i++) {
                                GrantEntity grant = grants.get(i);
                    %>
                    <tr>      
                        <td class="text_cell" style="width: 500px; max-width: 500px; text-align: center"><%=TableDataFormatter.formatTextData(grant.getAction())%></td>
                        <td style="width: 150px; text-align: center"><%=TableDataFormatter.dataOrEmptyString(grant.getGrantYear())%></td>
                        <td style="width: 150px; text-align: center"><%=TableDataFormatter.dataOrEmptyString(grant.getStatus())%></td> 
                        <td style="width: 250px; text-align: center"><%=TableDataFormatter.priceFormatter(grant.getApprovedGrant(), grant.getCurrency())%></td>
                    </tr>
                    <%}
                        }
                    %>
                </table>
            </div>
        </div>
    </body>
</html>
