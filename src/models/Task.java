package models;

import java.io.Serializable;
import java.util.Date;

/**
 * Task bean for modelling database tables
 * @author Josh
 * 
 * updated by skyet 02/22:
 * MOVED TO ERRAND CLASS: reward, category
 * ADDED other fields to match tasks table in db
 * ADDED/NOT CURRENTLY IN TASKS TABLE OF DB: dateCreated, taskName, taskDescription
 * 
 * This class represents a model of Task data
 * It acts as the domain-specific class that the application
 * will use to represent the "tasks" table of the database
 */
public class Task implements Serializable{
	private static final long serialVersionUID = -218272690039621900L;

	private int id;						// Unique task id
	private int errandID;				// Errand this task belongs to
	private Date dateCreated;			// Date task was created by a Customer
	private Date dateInitiated;			// Date the task was started by a Gopher
	private Date dateCompleted;			// Date the task was completed
	private Date deadline;				// Date this task must be completed by
	private Address location;			// Task may involve going to a specific place
	private String status;				// Completion status of the task
	private String importance;			// Urgency of this task compared to others of the same errand
	private String taskName;
	private String taskDescription;
	
	// Getters
	public int getId() {
		return id;
	}
	public int getErrandID() {
		return errandID;
	}
	public Date getDateCreated() {
		return dateCreated;
	}
	public Date getDateInitiated() {
		return dateInitiated;
	}
	public Date getDateCompleted() {
		return dateCompleted;
	}
	public Date getDeadline() {
		return deadline;
	}
	public Address getLocation() {
		return location;
	}
	public String getStatus() {
		return status;
	}
	public String getImportance() {
		return importance;
	}
	public String getTaskName() {
		return taskName;
	}
	public String getTaskDescription() {
		return taskDescription;
	}
	
	// Setters
	public void setId(int id) {
		this.id = id;
	}
	public void setErrandID(int errandID) {
		this.errandID = errandID;
	}
	public void setDateCreated(Date dateCreated) {
		this.dateCreated = dateCreated;
	}
	public void setDateInitiated(Date dateInitiated) {
		this.dateInitiated = dateInitiated;
	}
	public void setDateCompleted(Date dateCompleted) {
		this.dateCompleted = dateCompleted;
	}
	public void setDeadline(Date deadline) {
		this.deadline = deadline;
	}
	public void setLocation(Address location) {
		this.location = location;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public void setImportance(String importance) {
		this.importance = importance;
	}
	public void setTaskName(String taskName) {
		this.taskName = taskName;
	}
	public void setTaskDescription(String taskDescription) {
		this.taskDescription = taskDescription;
	}
	
	
}
