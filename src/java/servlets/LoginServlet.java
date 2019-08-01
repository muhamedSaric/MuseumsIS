package servlets;

import dao.HashUtil;
import dto.UserIdentity;
import entity.User;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "LoginServlet", urlPatterns = {"/login"})
public class LoginServlet extends ServletBase {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        
        if(email == null || password == null || email.length()==0 || password.length()==0){
            response.sendRedirect("LoginError.jsp");
        }else{
        
            User user = repository.getUserByEmail(email);
             String md5PassHash = HashUtil.getHashPass(password);

             if(user!=null && md5PassHash.equals(user.getPssword())){
                  HttpSession session = request.getSession(true);
                  UserIdentity userIdentity = new UserIdentity();
                  userIdentity.setEmail(user.getEmail());
                  userIdentity.setFullName(user.getName()+" "+user.getSurname());
                  session.setAttribute("currentUser",userIdentity); 
                  response.sendRedirect("/MuseumsIS");
             }else{
                  response.sendRedirect("LoginError.jsp"); //error page 
             }
        }
    }
}
