package entities;

import java.io.Serializable;
import java.util.Date;

/**
 * This class represents a model for user ratings
 * It acts as the domain-specific class that the application
 * will use to represent the "ratings" table of the database
 * @author skyet
 *
 */
public class Rating implements Serializable {
	private static final long serialVersionUID = 4562427898201605236L;

	private int id;				// Unique id for the rating
	private User userRated;		// The user receiving the rating
	private User rater;			// The user giving the rating
	private int rating;			// The numeric value of the rating
	private Errand errand;		// The errand this rating pertains to
	private String comments;	// Comments left by the rater
	private Date dateCreated;	// Date rating was created
	
	// Getters
	public int getId() {
		return id;
	}
	public User getUserRated() {
		return userRated;
	}
	public User getRater() {
		return rater;
	}
	public int getRating() {
		return rating;
	}
	public String getComments() {
		return comments;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	
	// Setters
	public void setId(int id) {
		this.id = id;
	}
	public void setUserRated(User userRated) {
		this.userRated = userRated;
	}
	public void setRater(User rater) {
		this.rater = rater;
	}
	public void setRating(int rating) {
		this.rating = rating;
	}
	public void setComments(String comments) {
		this.comments = comments;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}

}