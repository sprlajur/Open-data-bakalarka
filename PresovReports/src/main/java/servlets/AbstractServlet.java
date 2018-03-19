/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author sprlajur
 */

public abstract class AbstractServlet extends HttpServlet {

    @PersistenceContext
    EntityManager entityManager;
   
}
