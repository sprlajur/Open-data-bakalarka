<%-- 
    Document   : statistics
    Created on : May 6, 2018, 7:14:19 PM
    Author     : sprlajur
--%>

<%@page import="DAO.ContractEntityDAO"%>
<%@page import="entity.OrderEntity"%>
<%@page import="entity.ContractEntity"%>
<%@page import="entity.GrantEntity"%>
<%@page import="entity.InvoiceEntity"%>
<%@page import="presentation.TableDataFormatter"%>
<%@page import="constants.UrlParameters"%>
<%@page import="constants.Urls"%>
<%@page import="constants.RequestAttributeNames"%>
<%@page import="java.util.List"%>
<%@page import="presentation.TopCompany"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="${pageContext.request.contextPath}/css/statisticsStyles.css" rel="stylesheet" type="text/css"/>
        <link href="${pageContext.request.contextPath}/css/styles.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
        <script src="${pageContext.request.contextPath}/javascript/sorttable.js"></script>
        <script src="${pageContext.request.contextPath}/javascript/statisticsjs.js"></script>
        <script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
        <title>Štatistiky</title>
    </head>
    <body>
        <%
            List<TopCompany> companies = (List<TopCompany>) request.getAttribute(RequestAttributeNames.TOP_COMPANIES_BY_TOTAL_AMOUNT);
            List<TopCompany> companiesByNrOfInvoices = (List<TopCompany>) request.getAttribute(RequestAttributeNames.TOP_COMPANIES_BY_NR_OF_INVOICES);
            List<InvoiceEntity> topInvoices = (List<InvoiceEntity>) request.getAttribute(RequestAttributeNames.ALL_INVOICES);
            List<GrantEntity> topGrants = (List<GrantEntity>) request.getAttribute(RequestAttributeNames.ALL_GRANTS);
            List<ContractEntity> topContracts = (List<ContractEntity>) request.getAttribute(RequestAttributeNames.ALL_CONTRACTS);
            List<OrderEntity> topOrders = (List<OrderEntity>) request.getAttribute(RequestAttributeNames.ALL_ORDERS);
        %>
        <jsp:include page="topMenu.jsp" />
        <div class="tab">
            <button class="tablinks" onclick="openCity(event, 'companies')" id="defaultOpen">Top firmy</button>
            <button class="tablinks" onclick="openCity(event, 'invoices')">Top faktúry</button>
            <button class="tablinks" onclick="openCity(event, 'grants')">Top dotácie</button>
            <button class="tablinks" onclick="openCity(event, 'contracts')">Top zmluvy</button>
            <button class="tablinks" onclick="openCity(event, 'orders')">Top objednávky</button>
        </div>
        <div id="companies" class="tabcontent">
            <table class="statisticstable" id ="sortable" style="float: left; width: 500px">
                <caption> Top 100 firiem podľa hodnoty vyplatených faktúr </caption>
                <tr>
                    <th class="sorttable_nosort" style="width: 30px"></th>
                    <th class="sorttable_nosort" style="width: 330px"> Firma </th>
                    <th style="width: 160px; text-align: right; padding-right: 45px">Suma</th>
                </tr>
                <% for (int i = (int) 0; i < companies.size(); i++) {
                        TopCompany tc = companies.get(i);
                %>
                <tr>
                    <td style="text-align: center; width: 30px"><%= i + 1%>.</td>
                    <td style="width: 330px"><a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + tc.getIco()%>"><%=tc.getName()%></a> </td>
                    <td style="width: 160px; text-align: right; padding-right: 5px"><%=TableDataFormatter.priceFormatter(tc.getAmount(), "EUR")%></td>
                </tr>
                <%
                    }
                %>
            </table>
            <table class="statisticstable" id ="sortable" style="width:48%; float: right">
                <caption> Top 100 firiem podľa počtu vyplatených faktúr </caption>
                <tr>
                    <th class="sorttable_nosort" style="width: 30px"></th>
                    <th class="sorttable_nosort" style="width: 350px"> Firma </th>
                    <th style="width: 180px; text-align: right; padding-right: 25px">Počet</th>
                </tr>
                <% for (int i = (int) 0; i < companiesByNrOfInvoices.size(); i++) {
                        TopCompany tc = companiesByNrOfInvoices.get(i);
                %>
                <tr>
                    <td style="text-align: center; width: 30px"><%= i + 1%>.</td>
                    <td style="width: 350px"><a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + tc.getIco()%>"><%=tc.getName()%></a> </td>
                    <td style="width: 140px; text-align: right; padding-right: 5px"><%=tc.getAmount()%></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <div id="invoices" class="tabcontent">
            <table class="companytable" id ="sortable">
                <caption> Top 100 faktúr podľa vyplatenej sumy </caption>
                <tr>      
                    <th class="sorttable_nosort"></th>
                    <th class="sorttable_nosort">Dodávateľ</th>
                    <th class="sorttable_nosort">Účel platby</th>
                    <th>Dátum zverejnenia</th>
                    <th>Zmluva / Objednávka</th>
                    <th class="sorttable_nosort">Cena </th>
                </tr>
                <% for (int i = (int) 0; i < topInvoices.size(); i++) {
                        InvoiceEntity invoice = topInvoices.get(i);
                        String contractOrOrderUrl = "", contractOrOrderHref = "";
                        if (invoice.getContractNr() != null) {
                            contractOrOrderUrl = "/" + Urls.ALL_CONTRACTS_URL + "/" + Urls.CONTRACT_DETAIL + UrlParameters.CONTRACT_DETAIL_NR_PARAMETER.getURLParameter() + invoice.getContractNr();
                            contractOrOrderHref = (String) TableDataFormatter.dataOrEmptyString(invoice.getContractNr());
                        } else if (invoice.getOrderNr() != null) {
                            contractOrOrderUrl = "/" + Urls.ALL_ORDERS_URL + "/" + Urls.ORDER_DETAIL + UrlParameters.ORDER_DETAIL_NR_PARAMETER.getURLParameter() + invoice.getOrderNr();
                            contractOrOrderHref = (String) TableDataFormatter.dataOrEmptyString(invoice.getOrderNr());
                        }
                %>
                <tr>  
                    <td><%=i + 1%>.</td>
                    <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + invoice.getSupplierIco()%>"><%= invoice.getSupplier()%></a> </td>
                    <td><%=TableDataFormatter.formatTextData(invoice.getPaymentDescription())%></td>
                    <td><%=TableDataFormatter.dateFormatter(invoice.getReleaseDate())%></td>
                    <td> <a href="${pageContext.request.contextPath}<%=contractOrOrderUrl%>"><%= contractOrOrderHref%></a> </td>
                    <td class="price_cell"><%=TableDataFormatter.priceFormatter(invoice.getPrice(), invoice.getCurrency())%></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <div id="grants" class="tabcontent">
            <table class="companytable" id ="sortable">
                <caption> Top 100 dotácií podľa vyplatenej sumy </caption>
                <tr style=>
                    <th class="sorttable_nosort"></th>
                    <th class="sorttable_nosort">Žiadateľ</th>
                    <th class="sorttable_nosort">Akcia</th>
                    <th>Rok dotácie</th>
                    <th>Schválená suma</th>
                </tr>
                <% for (int i = (int) 0; i < topGrants.size(); i++) {
                        GrantEntity grant = topGrants.get(i);
                %>
                <tr>  
                    <td><%=i + 1%>.</td>
                    <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + grant.getApplicantIco()%>"><%= grant.getApplicant()%></a> </td>
                    <td><%=TableDataFormatter.formatTextData(grant.getAction())%></td>
                    <td><%=TableDataFormatter.dataOrEmptyString(grant.getGrantYear())%></td>
                    <td><%=TableDataFormatter.priceFormatter(grant.getApprovedGrant(), grant.getCurrency())%></td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <div id="contracts" class="tabcontent">
            <table class="companytable" id ="sortable">
                <caption> Top 100 zmlúv podľa ceny </caption>
                <tr>
                    <th class="sorttable_nosort"> Kontraktor </th>
                    <th class="sorttable_nosort">Predmet</th>
                    <th>Dátum podpisu</th>
                    <th>Cena</th>
                    <th class="sorttable_nosort"></th>
                </tr>
                <% for (int i = 0; i < topContracts.size(); i++) {
                        ContractEntity contract = topContracts.get(i);
                        String parties = contract.getParties();
                        String party1 = TableDataFormatter.formatParties(parties, 0);
                        String party2 = TableDataFormatter.formatParties(parties, 1);
                        String nonPresovParty = party1.contains("Mesto Prešov") ? party2 : party1;
                %>
                <tr>      
                    <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + ContractEntityDAO.getIcoFromContract(contract, nonPresovParty)%>"><%=nonPresovParty%></a> </td>
                    <td><%=TableDataFormatter.formatTextData(contract.getSubject())%></td>
                    <td><%=TableDataFormatter.dateFormatter(contract.getSignatureDate())%></td>
                    <td class= "price_cell"><%=TableDataFormatter.priceFormatter(contract.getPrice(), contract.getCurrency())%></td>
                    <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.ALL_CONTRACTS_URL + "/" + Urls.CONTRACT_DETAIL + UrlParameters.CONTRACT_DETAIL_NR_PARAMETER.getURLParameter() + contract.getContractNr()%>"><i class="glyphicon glyphicon-zoom-in"></i></a> </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
        <div id="orders" class="tabcontent">
            <table class="companytable" id ="sortable">
                <caption> Top 100 objednávok podľa hodnoty </caption>
                <tr>      
                    <th class="sorttable_nosort">Dodávateľ</th>
                    <th class="sorttable_nosort">Text objednávky</th>
                    <th>Stav vybavenia</th>
                    <th>Dátum vystavenia</th>
                    <th>Hodnota</th>
                    <th class="sorttable_nosort"></th>
                </tr>
                <% for (int i = (int) 0; i < topInvoices.size(); i++) {
                        OrderEntity order = topOrders.get(i);
                %>
                <tr>      
                    <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.PARTY_DETAIL + UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getURLParameter() + order.getIco()%>"><%= order.getSupplier()%></a> </td>
                    <td class="text_cell"><%=TableDataFormatter.formatTextData(order.getOrderText())%></td>
                    <td><%=TableDataFormatter.priceFormatter(order.getValue(), order.getCurrency())%></td>
                    <td><%=TableDataFormatter.dataOrEmptyString(order.getCompletenessStatus())%></td> 
                    <td><%=TableDataFormatter.dateFormatter(order.getIssueDate())%></td>
                    <td> <a href="${pageContext.request.contextPath}<%="/" + Urls.ALL_ORDERS_URL + "/" + Urls.ORDER_DETAIL + UrlParameters.ORDER_DETAIL_NR_PARAMETER.getURLParameter() + order.getOrderNr()%>"> <i class="glyphicon glyphicon-zoom-in"></i> </a> </td>
                </tr>
                <%
                    }
                %>
            </table>
        </div>
    </body>
    <script>
        document.getElementById("defaultOpen").click();
    </script>
</html>
