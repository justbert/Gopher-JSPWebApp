package models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

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
	private int userIDCustomer;		// Customer associated with the errand
	private int userIDGopher;		// Gopher associated with the errand
	private Date dateCreated;		// Date the errand was created
	private Date dateCompleted;		// Date the errand was completed
	private List<Task> tasks;		// List of tasks involved in the errand
	
	// Getters
	public int getId() {
		return id;
	}
	public int getUserIDCustomer() {
		return userIDCustomer;
	}
	public int getUserIDGopher() {
		return userIDGopher;
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
	
	// Setters
	public void setId(int id) {
		this.id = id;
	}
	public void setUserIDCustomer(int userIDCustomer) {
		this.userIDCustomer = userIDCustomer;
	}
	public void setUserIDGopher(int userIDGopher) {
		this.userIDGopher = userIDGopher;
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
	
}
