package models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import entities.Task;
import entities.User;

/**
 * This class represents a model of Errand data
 * It acts as the domain-specific class that the application
 * will use to represent the "transactions" table of the database
 * @author skyet
 *
 */
public class Errand implements Serializable {
	private static final long serialVersionUID = -2691284966379819188L;

	private int id;					// Unique id of the errand
	private User customer;			// Customer associated with the errand
	private User gopher;			// Gopher associated with the errand
	private Date dateCreated;		// Date the errand was created
	private Date dateCompleted;		// Date the errand was completed
	private List<Task> tasks;		// List of tasks involved in the errand
	private String reward;			// Reward for completing this errand	*NOT IN DB TABLE*
	private String category;		// Type of errand						*NOT IN DB TABLE*
	
	// Getters
	public int getId() {
		return id;
	}
	public User getCustomer() {
		return customer;
	}
	public User getGopher() {
		return gopher;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public Date getDateCompleted() {
		return dateCompleted;
	}
	public List<Task> getTasks() {
		return tasks;
	}
	public String getReward() {
		return reward;
	}
	public String getCategory() {
		return category;
	}
	
	// Setters
	public void setId(int id) {
		this.id = id;
	}
	public void setCustomer(User customer) {
		this.customer = customer;
	}
	public void setGopher(User gopher) {
		this.gopher = gopher;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public void setDateCompleted(Date dateCompleted) {
		this.dateCompleted = dateCompleted;
	}
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	public void setReward(String reward) {
		this.reward = reward;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	
}
