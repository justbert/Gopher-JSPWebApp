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

	private int id;								// Unique id of the errand
	private User user_id_customer;				// Customer associated with the errand
	private User user_id_gopher;				// Gopher associated with the errand
	private Date dateCreated;					// Date the errand was created
	private Date dateCompleted;					// Date the errand was completed
	private ImportanceType importanceTypeID;
	private List<Task> tasks;					// List of tasks involved in the errand
	private int reward_id;						// Reward for completing this errand
	private Timestamp deadline;					// Due date/time for errand
	private String status;						// Ongoing progress status
	private String name;
	private String description;
	
	public enum ImportanceType{
		VERY_HIGH("Very High",5),
		HIGH("High",4),
		NORMAL("Normal",3),
		LOW("Low", 2),
		VERY_LOW("Very Low", 1);
		
		private String name;
		private int index;
		
		private ImportanceType(String name, int index){
			this.name = name;
			this.index = index;
		}
		
		public ImportanceType getImportanceType(int index){
			for(ImportanceType type : ImportanceType.values())
				if(type.index == index) return type;
			return null;
		}
		
		public String getTitle(){
			return name;
		}
		
		public int getIndex(){
			return this.index;
		}
	}
	
	
	public Errand(){};
	
	public Errand(int id, String name, String description, User user_id_cusomter, User user_id_gopher, Date dateCreated, Date dateCompleted, int reward_id, Timestamp deadline, String status, ImportanceType importance){
		this.id = id;
		this.name = name;
		this.description = description;
		this.user_id_customer = user_id_cusomter;
		this.user_id_gopher = user_id_gopher;
		this.dateCreated = dateCreated;
		this.reward_id = reward_id;
		this.setDeadline(deadline);
		this.setStatus(status);
		this.setImportance(importance);
	}

	// Getters
	public int getId() {
		return id;
	}
	public User getUserIdCustomer() {
		return user_id_customer;
	}
	public User getUserIdGopher() {
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
	public ImportanceType getImportanceTypeID() {
		return importanceTypeID;
	}
	
	// Setters
	public void setId(int id) {
		this.id = id;
	}
	public void setUserIdCustomer(User user_id_customer) {
		this.user_id_customer = user_id_customer;
	}
	public void setUserIdGopher(User user_id_gopher) {
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
	public void setImportance(ImportanceType importanceTypeId) {
		this.importanceTypeID = importanceTypeId;
	}
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
}