/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import DAO.GrantEntityDAO;
import constants.RequestAttributeNames;
import constants.Urls;
import entity.GrantEntity;
import java.io.IOException;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author sprlajur
 */
@WebServlet(Urls.ALL_GRANTS_URL)
public class AllGrantsServlet extends AbstractServlet {

    private GrantEntityDAO grantEntityManager;
    private final String JSP_FILE_PATH = "/JSPpages/allGrants.jsp";

    @Override
    public void init() {
        grantEntityManager = new GrantEntityDAO(entityManager);
    }

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
        List<GrantEntity> grants = grantEntityManager.findAll();
        setPaginationParameters(request, grants == null ? 0 : grants.size());
        request.setAttribute(RequestAttributeNames.ALL_GRANTS, grants);
        RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(JSP_FILE_PATH);
        dispatcher.forward(request, response);
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
        request.setCharacterEncoding("UTF-8");
        setFilterParameters(request);
        List<GrantEntity> grants = null;
        if (!searchedParty.isEmpty() || !searchedText.isEmpty() || from != null || to != null) {
            grants = grantEntityManager.getGrantsByFilter(searchedParty, searchedText);
            setPaginationParameters(request, grants == null ? 0 : grants.size());
            request.setAttribute(RequestAttributeNames.ALL_GRANTS, grants);
            RequestDispatcher dispatcher = getServletContext().getRequestDispatcher(JSP_FILE_PATH);
            dispatcher.forward(request, response);
        } else {
            doGet(request, response);
        }
    }

}
