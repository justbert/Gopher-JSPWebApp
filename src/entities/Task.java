package entities;

import java.io.Serializable;
import java.util.Date;

/**
 * Task bean for modelling database tables
 * @author Josh
 * 
 * updated by skyet 02/22
 * This class represents a model of Task data
 * It acts as the domain-specific class that the application
 * will use to represent the "tasks" table of the database
 */
public class Task implements Serializable{
	private static final long serialVersionUID = -218272690039621900L;

	private int id;						// Unique task id
	private String name;				// Task name
	private int errandID;				// Errand this task belongs to
	private Date dateCreated;			// Date task was created by a Customer
	private Date dateInitiated;			// Date the task was started by a Gopher
	private Date dateCompleted;			// Date the task was completed
	private Address location;			// Task may involve going to a specific place
	private boolean isActive;
	private String description;	
	
	public Task(int id, String name, int errandID, Date dateCreated, Date dateInitiated, Date dateCompleted,
			Address location, boolean isActive, String description) {
		this.id = id;
		this.name = name;
		this.errandID = errandID;
		this.dateCreated = dateCreated;
		this.dateInitiated = dateInitiated;
		this.dateCompleted = dateCompleted;
		this.location = location;
		this.isActive = isActive;
		this.description = description;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	public int getId() {
		return id;
	}

	public String getName() {
		return name;
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

	public Address getLocation() {
		return location;
	}

	public boolean isActive() {
		return isActive;
	}

	public String description() {
		return description;
	}

	public void setId(int id) {
		this.id = id;
	}

	public void setName(String name) {
		this.name = name;
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

	public void setLocation(Address location) {
		this.location = location;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}
