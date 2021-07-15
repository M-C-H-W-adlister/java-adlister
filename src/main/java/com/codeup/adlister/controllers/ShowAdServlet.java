package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebServlet(name = "controllers.ShowAdServlet", urlPatterns = "/ads/ad")
public class ShowAdServlet extends HttpServlet {
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//    if (request.getSession().getAttribute("user") == null) {
//      response.sendRedirect("/login");
//      return;
//    }
    HttpSession session = request.getSession();
    String currentAdIDString = request.getParameter("selectedAd");
    System.out.println(currentAdIDString);
    Long currentAdID = Long.parseLong(currentAdIDString);
    System.out.println(currentAdID);
    Ad ad = DaoFactory.getAdsDao().findByID(currentAdID);
    request.getSession().setAttribute("ad",ad);

    request.getRequestDispatcher("/WEB-INF/ads/ad.jsp").forward(request, response);
  }
}
