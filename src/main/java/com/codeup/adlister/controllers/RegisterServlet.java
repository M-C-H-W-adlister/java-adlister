package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

      System.out.println(DaoFactory.getUsersDao().findByUsername(username) == null);
      // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty();

        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }

        // create and save a new user
        // commented out because code is being reused for the error stickies
//        User user = new User(username, email, password);
//        DaoFactory.getUsersDao().insert(user);
//        response.sendRedirect("/login");

        // booleans to make sure if user exists already
        boolean usernameNotExists =  false;
        boolean userEmailNotExists =  false;
        boolean passwordNoMatch = false;
        boolean noUserConflicts = false;
        
        User userNameTest = DaoFactory.getUsersDao().findByUsername(username);
        User userEmailTest = DaoFactory.getUsersDao().findByUserEmail(email);

        if(userNameTest == null) {
            usernameNotExists = true;
        }

        if(userEmailTest == null) {
            userEmailNotExists = true;
        }
        if(!password.equals(passwordConfirmation)){
            passwordNoMatch = true;
        }

        if(usernameNotExists && userEmailNotExists && !passwordNoMatch) {
            noUserConflicts = true;
        }



       String ExistsMessage = "<span style=\"color:red\">* already exists</span>";
       String passwordMessage = "<span style=\"color:red\">* doesn't match</span>";

       if(noUserConflicts){
           User user = new User(username, email, password);
           DaoFactory.getUsersDao().insert(user);
           response.sendRedirect("/login");
       } else if(!usernameNotExists && !userEmailNotExists && passwordNoMatch) {
           request.setAttribute("pwMessage", passwordMessage);
            request.setAttribute("usernameExistsMessage",ExistsMessage);
            request.setAttribute("emailExistsMessage", ExistsMessage);
            request.setAttribute("username", username);
            request.setAttribute("email",email);
           request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
       }else if(!userEmailNotExists || !usernameNotExists) {
           if(!userEmailNotExists){
               request.setAttribute("emailExistsMessage", ExistsMessage);
               request.setAttribute("email", email);
               request.setAttribute("username", username);
               request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
           } else if(!usernameNotExists) {
               request.setAttribute("usernameExistsMessage",ExistsMessage);
               request.setAttribute("email", email);
               request.setAttribute("username", username);
               request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
           }
       } else if(passwordNoMatch) {
           request.setAttribute("email", email);
           request.setAttribute("username", username);
           request.setAttribute("pwMessage", passwordMessage);
           request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);

       }

    }

}
