package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.io.FileInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
  private Connection connection = null;

  public MySQLAdsDao(Config config) {
    try {
      DriverManager.registerDriver(new Driver());
      connection = DriverManager.getConnection(
        config.getUrl(),
        config.getUser(),
        config.getPassword()
      );
    } catch (SQLException e) {
      throw new RuntimeException("Error connecting to the database!", e);
    }
  }

  @Override
  public List<Ad> all() {
    PreparedStatement stmt = null;
    try {
      stmt = connection.prepareStatement("SELECT * FROM ads");
      ResultSet rs = stmt.executeQuery();
      return createAdsFromResults(rs);
    } catch (SQLException e) {
      throw new RuntimeException("Error retrieving all ads.", e);
    }
  }

  @Override
  public Long insert(Ad ad) {
    try {
      String insertQuery = "INSERT INTO ads(user_id, title, description, ingredients) VALUES (?, ?, ?, ?)";
      PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
      stmt.setLong(1, ad.getUserId());
      stmt.setString(2, ad.getTitle());
      stmt.setString(3, ad.getDescription());
      stmt.setString(4, ad.getIngredients());
      stmt.executeUpdate();
      ResultSet rs = stmt.getGeneratedKeys();
      rs.next();
      return rs.getLong(1);
    } catch (SQLException e) {
      throw new RuntimeException("Error creating a new ad.", e);
    }
  }

  private Ad extractAd(ResultSet rs) throws SQLException {
    return new Ad(
      rs.getLong("id"),
      rs.getLong("user_id"),
      rs.getString("title"),
      rs.getString("description"),
      rs.getString("ingredients")
    );
  }

  private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
    List<Ad> ads = new ArrayList<>();
    while (rs.next()) {
      ads.add(extractAd(rs));
    }
    return ads;
  }

//Below for is the ViewAdServlet
//It makes a SQL query that searches by ID, (which cannot be the same unlike a title)
  public Ad findByID(Long id) {
    String query = "SELECT * FROM ads WHERE id = ? LIMIT 1";
//    We are going to replace the ? with the ID that was clicked.
    try {
      PreparedStatement stmt = connection.prepareStatement(query);
      stmt.setLong(1, id);
//    Message below are to make sure we are getitng the expected messages.
//      System.out.println(stmt);
//      System.out.println(stmt.executeQuery());
      ResultSet rs = stmt.executeQuery();
//      We store the results from the query inside of a REsultSet variable so we can iterate over the results, and grab the Ad
      rs.next();
      return extractAd(rs);
    } catch (SQLException e) {
      throw new RuntimeException("Error finding an Ad by ID", e);
    }
  }

  @Override
  public List<Ad> searchByTitle(String title) {
    String query = "SELECT * FROM ads WHERE title LIKE ?";
    String searchWildCards = "%" + title + "%";
//    We are going to replace the ? with the Title that was clicked.
    PreparedStatement stmt = null;
    try {
       stmt = connection.prepareStatement(query);
      stmt.setString(1, searchWildCards);
      ResultSet rs = stmt.executeQuery();
//      We store the results from the query inside of a ResultSet variable so we can iterate over the results, and grab the Ad
//      rs.next();
      return createAdsFromResults(rs);
    } catch (SQLException e) {
      throw new RuntimeException("Error finding an Ad by Title", e);
    }

  }


  public List<Ad> findByUserID(Long userId) {
    String query = "SELECT * FROM ads WHERE user_id = ?";
//    We are going to replace the ? with the ID that was clicked.
    try {
      PreparedStatement stmt = connection.prepareStatement(query);
      stmt.setLong(1, userId);
//    Message below are to make sure we are getting the expected messages.
//      System.out.println(stmt);
//      System.out.println(stmt.executeQuery());
      ResultSet rs = stmt.executeQuery();
//      We store the results from the query inside of a REsultSet variable so we can iterate over the results, and grab the Ad
//      rs.next();
      return createAdsFromResults(rs);
    } catch (SQLException e) {

      throw new RuntimeException("Error finding Ads by user id.", e);
    }
  }

  public void deleteByID(Long id) {
    String query = "DELETE FROM ads WHERE id = ? LIMIT 1";
//    We are going to replace the ? with the ID that wants to be deleted.
    try {
      PreparedStatement stmt = connection.prepareStatement(query);
      stmt.setLong(1, id);
//    Message below are to make sure we are getting the expected messages.
//      System.out.println(stmt);
//      System.out.println(stmt.executeQuery());
//    I think below just executes the query, so we don't need to return anything because we are deleting it.
      stmt.execute();
    } catch (SQLException e) {
      throw new RuntimeException("Error deleting an Ad by ID", e);
    }
  }

  public void editByID(Long id, String newTitle, String newDesc) {

    String queryTitle = "UPDATE ads set title = ? where id = ?";
    String queryDesc = "UPDATE ads set description = ? where id = ?";
//    We are going to replace the ? with the ID that wants to be deleted.
    try {
      PreparedStatement stmtTitle = connection.prepareStatement(queryTitle);
      PreparedStatement stmtDesc = connection.prepareStatement(queryDesc);
      stmtTitle.setString(1, newTitle);
      stmtDesc.setString(1, newDesc);
      stmtTitle.setLong(2, id);
      stmtDesc.setLong(2, id);

//    Message below are to make sure we are getting the expected messages.
//      System.out.println(stmt);
//      System.out.println(stmt.executeQuery());
//    I think below just executes the query, so we don't need to return anything because we are deleting it.
      stmtTitle.executeUpdate();
      stmtDesc.executeUpdate();
    } catch (SQLException e) {
      throw new RuntimeException("Error Editing an Ad by ID", e);
    }
  }

  public List<Ad> listByCatID(Long catID) {
    String query = "SELECT * FROM ads WHERE id IN (SELECT ad_id FROM ad_cat WHERE cat_id = ?);";
//    We are going to replace the ? with the ID that was clicked.
    try {
      PreparedStatement stmt = connection.prepareStatement(query);
      stmt.setLong(1, catID);
//    Message below are to make sure we are getting the expected messages.
      System.out.println(stmt);
//      System.out.println(stmt.executeQuery());
      ResultSet rs = stmt.executeQuery();
//      We store the results from the query inside of a REsultSet variable so we can iterate over the results, and grab the Ad
//      rs.next();
      return createAdsFromResults(rs);
    } catch (SQLException e) {

      throw new RuntimeException("Error listing ads by cat ID.", e);
    }
  }



}
