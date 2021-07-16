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

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

      System.out.println(DaoFactory.getUsersDao().findByUsername(username) == null);
      boolean usernameTaken = DaoFactory.getUsersDao().findByUsername(username) == null;
      // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation))
            || !usernameTaken;

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
        boolean noUserConflicts = false;
        
        User userNameTest = DaoFactory.getUsersDao().findByUsername(username);
        User userEmailTest = DaoFactory.getUsersDao().findByUserEmail(username);

        if(userNameTest == null) {
            usernameNotExists = true;
        }

        if(userEmailTest == null) {
            userEmailNotExists = true;
        }

        if(usernameNotExists && userEmailNotExists) {
            noUserConflicts = true;
        }

       String usernameExistsMessage = "This username already exists, please try another username";
       String emailExistsMessage = "This email already exists, please try another email";

       if(noUserConflicts){
           User user = new User(username, email, password);
           DaoFactory.getUsersDao().insert(user);
           response.sendRedirect("/login");
       } else if(!usernameNotExists) {
           request.setAttribute("emailExistsMessage", emailExistsMessage);
//           request.setAttribute("userInputEmail", );
       }

    }

}
