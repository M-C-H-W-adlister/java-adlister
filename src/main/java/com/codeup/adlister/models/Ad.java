package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private String title;
    private String description;
    private String ingredients;

//    NEW STUFF BELOW
    private String directions;
    private String image;




  public Ad(long id, long userId, String title, String description, String ingredients) {
    this.id = id;
    this.userId = userId;
    this.title = title;
    this.description = description;
    this.ingredients = ingredients;
  }

  public Ad(long userId, String title, String description, String ingredients) {
    this.userId = userId;
    this.title = title;
    this.description = description;
    this.ingredients = ingredients;
  }

    public Ad(long id, long userId, String title, String description) {
        this.id = id;
        this.userId = userId;
        this.title = title;
        this.description = description;
    }

    public Ad(long userId, String title, String description) {
        this.userId = userId;
        this.title = title;
        this.description = description;
    }

  public String getIngredients() {
    return ingredients;
  }

  public void setIngredients(String ingredients) {
    this.ingredients = ingredients;
  }

  public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}
