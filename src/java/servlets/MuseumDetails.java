package servlets;

import dao.MuseumRepository;
import entity.Museum;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "Museums", urlPatterns = {"/details"})
public class MuseumDetails extends HttpServlet {

    private MuseumRepository repository = new MuseumRepository();
    

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Integer id = Integer.parseInt(request.getParameter("id"));
        Museum museum = repository.getById(id);
        
        request.setAttribute("museum", museum);
        request.getRequestDispatcher("MuseumDetails.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

}
