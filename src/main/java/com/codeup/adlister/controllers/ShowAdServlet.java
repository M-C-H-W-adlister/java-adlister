package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "controllers.ShowAdServlet", urlPatterns = "/ads/ad")
public class ShowAdServlet extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    Below is from the ViewProfile servlet where it would check to see if you are logged in before viewing the page.

    if (request.getSession().getAttribute("user") == null) {
      response.sendRedirect("/login");
      return;
    }
//    Below we grab the ID of the ad we clicked, then stick it into an Attribute
    HttpSession session = request.getSession();
    String currentAdIDString = request.getParameter("selectedAd");
//    System.out.println(currentAdIDString);
    Long currentAdID = Long.parseLong(currentAdIDString);
//    System.out.println(currentAdID);
//    Below we use the id we grabbed to turn it into an Ad object
    Ad ad = DaoFactory.getAdsDao().findByID(currentAdID);
//    Setting the ad to the session attribute.
    request.getSession().setAttribute("ad", ad);

//    Below we are grabbing the Ad's owner's username
    User adOwner = DaoFactory.getUsersDao().findByUserID(ad.getUserId());
    request.getSession().setAttribute("adOwner", adOwner);


//   We are checking to see if the user is the Owner, (if the creator and user ids match)
    User user = (User) request.getSession().getAttribute("user");


    boolean isOwner = user.getId() == ad.getUserId();
//  if they do then we are going to make the attribute isOwner true.
//   or set it to false if they are not... don't use an if statement.
    request.getSession().setAttribute("isOwner", isOwner);


    request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
  }

  //
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    Below is from the ViewProfile servlet where it would check to see if you are logged in before viewing the page.

    if (request.getSession().getAttribute("user") == null) {
      response.sendRedirect("/login");
      return;
    }
//    Below we grab the ID of the ad we clicked, then stick it into an Attribute
    HttpSession session = request.getSession();
    String currentAdIDString = request.getParameter("selectedAd");
//    System.out.println(currentAdIDString);
    Long currentAdID = Long.parseLong(currentAdIDString);
//    System.out.println(currentAdID);
//    Below we use the id we grabbed to turn it into an Ad object
    Ad ad = DaoFactory.getAdsDao().findByID(currentAdID);
    String[] ingredientsArray = ad.getIngredients().split(", ");
    List<String> ingredients = Arrays.asList(ingredientsArray);
    request.getSession().setAttribute("ingredients", ingredients);

//    Setting the ad to the session attribute.
    request.getSession().setAttribute("ad", ad);

//    Below we are grabbing the Ad's owner's username
    User adOwner = DaoFactory.getUsersDao().findByUserID(ad.getUserId());
    request.getSession().setAttribute("adOwner", adOwner);


//   We are checking to see if the user is the Owner, (if the creator and user ids match)
    User user = (User) request.getSession().getAttribute("user");


    boolean isOwner = user.getId() == ad.getUserId();
//  if they do then we are going to make the attribute isOwner true.
//   or set it to false if they are not... don't use an if statement.
    request.getSession().setAttribute("isOwner", isOwner);


    request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
  }
}

//
