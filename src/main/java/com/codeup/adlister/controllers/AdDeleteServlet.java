package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "AdDeleteServlet", urlPatterns = "/ads/delete")
public class AdDeleteServlet extends HttpServlet {
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
    Ad deleteAdd = (Ad) request.getSession().getAttribute("ad");
    DaoFactory.getAdsDao().deleteByID(deleteAdd.getId());
    response.sendRedirect("/profile");
  }
}
