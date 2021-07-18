package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ListByCatServlet", urlPatterns = "/ads/category")
public class ListByCatServlet extends HttpServlet {
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    System.out.println(request.getParameter("catID"));
    Long catID = Long.parseLong(request.getParameter("catID"));
    System.out.println(catID);
    request.setAttribute("ads", DaoFactory.getAdsDao().listByCatID(catID));
    request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
  }
}
