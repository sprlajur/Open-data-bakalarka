/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import constants.RequestAttributeNames;
import constants.UrlParameters;
import constants.Urls;
import java.io.IOException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import rpo.RPOApiDataGetter;
import rpo.*;

/**
 *
 * @author sprlajur
 */
@WebServlet(Urls.PARTY_DETAIL)
public class PartyDetailServlet extends HttpServlet {

    private final String PARTY_DETAIL_JSP_FILE_PATH = "/JSPpages/partyDetail.jsp";
    private final String PARTY_NOT_FOUND_JSP_FILE_PATH = "/JSPpages/partyNotFound.jsp";

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String ico = request.getParameter(UrlParameters.PARTY_DETAIL_ICO_PARAMETER.getParameter());
        RPOLegalPerson person = null;
        if (ico != null && !ico.isEmpty()) {
            person = RPOJsonParser.parseData(RPOApiDataGetter.getLegalPersonData(ico));
        }
        request.setAttribute(RequestAttributeNames.LEGAL_PERSON, person);
        String nextJSP = person == null ? PARTY_NOT_FOUND_JSP_FILE_PATH : PARTY_DETAIL_JSP_FILE_PATH;
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(nextJSP);
        dispatcher.forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
