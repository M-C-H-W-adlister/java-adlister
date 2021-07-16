package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.List;

public interface Ads {

  // get a list of all the ads
  List<Ad> all();

  // insert a new ad and return the new ad's id
  Long insert(Ad ad);

  // find ads by their ids
  Ad findByID(Long id);

  //Below is for Searching by the ads title.
  List<Ad> searchByTitle(String query);

  // for listing ads on profile page
  List<Ad> findByUserID(Long userId);

  void deleteByID(Long id);
  void editByID(Long id, String newTitle, String newDesc);
}
