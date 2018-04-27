<%-- 
    Document   : allGrants
    Created on : Apr 25, 2018, 5:29:45 PM
    Author     : sprlajur
--%>

<%@page import="constants.UrlParameters"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="constants.RequestAttributeNames"%>
<%@page import="entity.InvoiceEntity"%>
<%@page import="java.util.List"%>
<%@page import="constants.Urls"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <title>Dodávateľské faktúry mesta</title>
    </head>
    <body>
        <div id="top_menu">
            <ul>
                <li><a href= "<%= Urls.ALL_CONTRACTS_URL%>">Zmluvy</a></li>
                <li><a href="<%= Urls.ALL_GRANTS_URL%>">Dotácie</a></li>
                <li><a href="<%= Urls.ALL_INVOICES_URL%>">Faktúry</a></li>
                <li><a href="<%= Urls.ALL_ORDERS_URL%>">Objednávky</a></li>
            </ul>
        </div>
        <%! List<InvoiceEntity> invoices;%>
        <table style="width:100%">
            <tr style=>      
                <th>Dodávateľ</th>
                <th>Účel platby</th>
                <th>Cena </th>
                <th>Stav zaplatenia</th>
                <th>Stav vybavenia</th>
                <th>Dátum úhrady</th>
                <th>Dátum zverejnenia</th>
                <th>Zmluva</th>
            </tr>
            <%
                invoices = (List<InvoiceEntity>) request.getAttribute(RequestAttributeNames.ALL_INVOICES);

                for (int i = 0; i < invoices.size(); i++) {
                    InvoiceEntity invoice = invoices.get(i);
            %>
            <tr>      
                <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + invoice.getSupplierIco() %>"><%= invoice.getSupplier() %></a> </td>
                <td><%=TableDataFormatter.formatTextData(invoice.getPaymentDescription())%></td>
                <td><%=TableDataFormatter.priceFormatter(invoice.getPrice(), invoice.getCurrency())%></td>
                <td><%=TableDataFormatter.dataOrEmptyString(invoice.getPaymentStatus())%></td>
                <td><%=TableDataFormatter.dataOrEmptyString(invoice.getCompletementStatus())%></td>
                <td><%=TableDataFormatter.dateFormatter(invoice.getPaymentDate())%></td>
                <td><%=TableDataFormatter.dateFormatter(invoice.getReleaseDate())%></td>
                <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.ALL_CONTRACTS_URL + "/" + Urls.CONTRACT_DETAIL + UrlParameters.CONTRACT_DETAIL_NR_PARAMETER.getURLParameter() + invoice.getContractNr() %>"><%= TableDataFormatter.dataOrEmptyString(invoice.getContractNr())%></a> </td>
                <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.ALL_ORDERS_URL + "/" + Urls.ORDER_DETAIL + UrlParameters.ORDER_DETAIL_NR_PARAMETER.getURLParameter() + invoice.getOrderNr() %>"><%= TableDataFormatter.dataOrEmptyString(invoice.getOrderNr())%></a> </td>

            </tr>
            <% }%>
        </table>
    </body>
</html>
