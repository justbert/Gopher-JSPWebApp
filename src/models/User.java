package models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * This class represents a model of User data
 * @author skyet
 *
 */
public class User implements Serializable {
	private static final long serialVersionUID = -6205863538753164722L;
	
	// Fields
	private int id;
	private String nameFirst;
	private String nameLast;
	private String email;
	private Address addressHome;
	private Address addressWork;
	private String phoneHome;
	private String phoneMobile;
	private String phoneWork;
	private String password;	// yes this is here for now shhh
	private Date dateJoined;
	private List<Task> tasks;
	
	// Getters
	public int getId() { 
		return id; 
	}
	public String getNameFirst() { 
		return nameFirst; 
	}
	public String getNameLast() { 
		return nameLast; 
	}
	public String getEmail() { 
		return email; 
	}
	public Address getAddressHome() { 
		return addressHome; 
	}
	public Address getAddressWork() { 
		return addressWork; 
	}
	public String getPhoneHome() { 
		return phoneHome; 
	}
	public String getPhoneMobile() { 
		return phoneMobile;
	}
	public String getPhoneWork() { 
		return phoneWork; 
	}
	public String getPassword() { 
		return password; 
	}
	public Date getDateJoined() { 
		return dateJoined; 
	}
	public List<Task> getTasks() {
		return tasks;
	}
	
	// Setters
	public void setId(int id) { 
		this.id = id; 
	}
	public void setNameFirst(String nameFirst) { 
		this.nameFirst = nameFirst; 
	}
	public void setNameLast(String nameLast) { 
		this.nameLast = nameLast; 
	}
	public void setEmail(String email) { 
		this.email = email; 
	}
	public void setAddressHome(Address addressHome) { 
		this.addressHome = addressHome; 
	}
	public void setAddressWork(Address addressWork) { 
		this.addressWork = addressWork; 
	}
	public void setPhoneHome(String phoneHome) { 
		this.phoneHome = phoneHome; 
	}
	public void setPhoneMobile(String phoneMobile) { 
		this.phoneHome = phoneMobile; 
	}
	public void setPhoneWork(String phoneWork) { 
		this.phoneWork = phoneWork; 
	}
	public void setPassword(String password) { 
		this.password = password; 
	}
	public void setDateJoined(Date dateJoined) { 
		this.dateJoined = dateJoined; 
	}
	public void setTasks(List<Task> tasks) {
		this.tasks = tasks;
	}
	
	public String toString() {
		return nameFirst + " " + nameLast;
	}
	
}
