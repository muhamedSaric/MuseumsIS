package servlets;

import dao.HashUtil;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.User;

@WebServlet(name = "RegisterServlet", urlPatterns = {"/register"})
public class RegisterServlet extends ServletBase {
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        
        String name = request.getParameter("name");
        String surname = request.getParameter("surname");
        String pass = request.getParameter("psw");
        String email = request.getParameter("email");
        String confirmPass = request.getParameter("psw-repeat");
       
        String md5PassHash = HashUtil.getHashPass(pass);
        User user = new User();
        user.setName(name);
        user.setEmail(email);
        user.setSurname(surname);
        user.setPssword(md5PassHash);
        repository.saveUser(user);
       
        request.getRequestDispatcher("RegisterSuccess.jsp").forward(request, response);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }
}
