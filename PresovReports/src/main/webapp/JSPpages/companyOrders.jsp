<%-- 
    Document   : companyContracts
    Created on : May 6, 2018, 2:44:14 PM
    Author     : sprlajur
--%>

<%@page import="entity.OrderEntity"%>
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
    </head>
    <body>
        <%
            List<OrderEntity> orders = (List<OrderEntity>) request.getAttribute(RequestAttributeNames.ALL_ORDERS);
        %>
        <table class="companytable" id="sortable">
            <caption>Objednávky od mesta Prešov</caption>
            <tr>
                <th class="sorttable_nosort">Text objednávky</th>
                <th>Hodnota</th>
                <th>Stav vybavenia</th>
                <th>Dátum vystavenia</th>
                <th class="sorttable_nosort"></th>
            </tr>
            <%
                if (orders != null) {
                    for (int i = 0; i < orders.size(); i++) {
                        OrderEntity order = orders.get(i);
            %>
            <tr>      
                <td class="text_cell"><%=TableDataFormatter.formatTextData(order.getOrderText())%></td>
                <td><%=TableDataFormatter.priceFormatter(order.getValue(), order.getCurrency())%></td>
                <td><%=TableDataFormatter.dataOrEmptyString(order.getCompletenessStatus())%></td> 
                <td><%=TableDataFormatter.dateFormatter(order.getIssueDate())%></td>
                <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.ALL_ORDERS_URL + "/" + Urls.ORDER_DETAIL + UrlParameters.ORDER_DETAIL_NR_PARAMETER.getURLParameter() + order.getOrderNr()%>"> <i class="glyphicon glyphicon-zoom-in"></i> </a> </td>
            </tr>
            <%}
                }
            %>
        </table>
    </body>
</html>
