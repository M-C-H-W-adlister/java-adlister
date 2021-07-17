package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

    public MySQLUsersDao(Config config) {
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
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(username, email, password) VALUES (?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (! rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password")
        );
    }
  public User findByUserID(long id) {
    String query = "SELECT * FROM users WHERE id = ? LIMIT 1";
    try {
      PreparedStatement stmt = connection.prepareStatement(query);
      stmt.setLong(1, id);
      return extractUser(stmt.executeQuery());
    } catch (SQLException e) {
      throw new RuntimeException("Error finding a user by username", e);
    }
  }
    public void updateUserPassword (long id, String hashedPassword) {
        String updateSql = "UPDATE users set password = ? where id = ?";
//    We are going to replace the ? with the ID that wants to be deleted.
        try {
            PreparedStatement stmt = connection.prepareStatement(updateSql);
            stmt.setString(1, hashedPassword);
            stmt.setLong(2, id);

//    Message below are to make sure we are getting the expected messages.
//      System.out.println(stmt);
//      System.out.println(stmt.executeQuery());
//    I think below just executes the query, so we don't need to return anything because we are deleting it.
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error Editing an Ad by ID", e);
        }
    }


    public void updateUserEmail (long id, String email) {
        String updateSql = "UPDATE users set email = ? where id = ?";
//    We are going to replace the ? with the ID that wants to be deleted.
        try {
            PreparedStatement stmt = connection.prepareStatement(updateSql);
            stmt.setString(1, email);
            stmt.setLong(2, id);

//    Message below are to make sure we are getting the expected messages.
//      System.out.println(stmt);
//      System.out.println(stmt.executeQuery());
//    I think below just executes the query, so we don't need to return anything because we are deleting it.
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error Editing an Ad by ID", e);
        }
    }

}

