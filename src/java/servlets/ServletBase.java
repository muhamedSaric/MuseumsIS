/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlets;

import dao.MuseumRepository;
import javax.servlet.http.HttpServlet;

/**
 *
 * @author Muhamed
 */
public class ServletBase extends HttpServlet { 
    
   protected MuseumRepository repository;

    public ServletBase() {
        this.repository = new MuseumRepository();
    }
}
