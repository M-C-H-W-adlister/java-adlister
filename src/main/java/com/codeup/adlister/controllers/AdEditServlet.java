package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdEditServlet", urlPatterns = "/ads/edit")
public class AdEditServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
//     We are grabbing the ad we are currently clicked on (only possible if we are the creator)
    Ad editAdd = (Ad) request.getSession().getAttribute("ad");
    String newTitle = request.getParameter("newTitle");
    String newDesc = request.getParameter("newDesc");

    DaoFactory.getAdsDao().editByID(editAdd.getId(),newTitle,newDesc);
    response.sendRedirect("/profile");
  }
}
