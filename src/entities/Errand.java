package entities;

import java.io.Serializable;
import java.sql.Timestamp;
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
	private int user_id_customer;	// Customer associated with the errand
	private int user_id_gopher;		// Gopher associated with the errand
	private Date dateCreated;		// Date the errand was created
	private Date dateCompleted;		// Date the errand was completed
	private List<Task> tasks;		// List of tasks involved in the errand
	private int reward_id;			// Reward for completing this errand
	private Timestamp deadline;		// Due date/time for errand
	private String status;			// Ongoing progress status
	private String importance;		// importance rating
	private String category;		// Type of errand
	
	public Errand(){};
	
	public Errand(int id, int user_id_customer, int user_id_gopher, Date dateCreated, Date dateCompleted, int reward_id, Timestamp deadline, String status, String importance, String category){
		this.id = id;
		this.user_id_customer = user_id_customer;
		this.user_id_gopher = user_id_gopher;
		this.dateCreated = dateCreated;
		this.reward_id = reward_id;
		this.setDeadline(deadline);
		this.setStatus(status);
		this.setImportance(importance);
		this.category = category;
	}

	// Getters
	public int getId() {
		return id;
	}
	public int getUserIdCustomer() {
		return user_id_customer;
	}
	public int getUserIdGopher() {
		return user_id_gopher;
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
	public int getRewardId() {
		return reward_id;
	}
	public String getStatus() {
		return status;
	}
	public Timestamp getDeadline() {
		return deadline;
	}	
	public String getImportance() {
		return importance;
	}	
	public String getCategory() {
		return category;
	}
	
	// Setters
	public void setId(int id) {
		this.id = id;
	}
	public void setUserIdCustomer(int user_id_customer) {
		this.user_id_customer = user_id_customer;
	}
	public void setUserIdGopher(int user_id_gopher) {
		this.user_id_gopher = user_id_gopher;
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
	public void setRewardId(int reward_id) {
		this.reward_id = reward_id;
	}	
	public void setStatus(String status) {
		this.status = status;
	}
	public void setDeadline(Timestamp deadline) {
		this.deadline = deadline;
	}
	public void setImportance(String importance) {
		this.importance = importance;
	}
	public void setCategory(String category) {
		this.category = category;
	}
}