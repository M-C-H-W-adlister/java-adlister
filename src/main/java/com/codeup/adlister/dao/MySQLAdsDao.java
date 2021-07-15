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
      String insertQuery = "INSERT INTO ads(user_id, title, description) VALUES (?, ?, ?)";
      PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
      stmt.setLong(1, ad.getUserId());
      stmt.setString(2, ad.getTitle());
      stmt.setString(3, ad.getDescription());
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
      rs.getString("description")
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
  public List<Ad> searchByTitle(String query) {
    return null;
  }

}
