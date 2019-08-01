package servlets;

import entity.*;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/")
public class MuseumsServlet extends ServletBase {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)  throws ServletException, IOException {
       
        List<City> cities = repository.LoadCities();
        List<Museumtpye> types = repository.LoadTypes();
        

        request.setAttribute("cities", cities);
        request.setAttribute("types", types);
        
        
        int searchfrm = 0;
        int city = 0;
        int type = 0;
        String mq = request.getParameter("mq");
        
        if(request.getParameter("searchfrm")!=null){
            searchfrm = Integer.parseInt(request.getParameter("searchfrm"));
        }
        
         if(request.getParameter("city")!=null){
            city = Integer.parseInt(request.getParameter("city"));
        }
         
          if(request.getParameter("type")!=null){
            type = Integer.parseInt(request.getParameter("type"));
        }
          
          
           List<Museum> museums = new ArrayList<>();
           
           if(searchfrm == 1){
             museums =  repository.searchMuseumsByName(mq);
           }else if(searchfrm == 2){
             museums =  repository.searchMuseumsByCityAndType(city, type);
           }else{
               museums = repository.loadMuseums();
           }
           
          
                  request.setAttribute("museums", museums);

        request.getRequestDispatcher("MuseumsList.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
    }

}
