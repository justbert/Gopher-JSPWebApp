package models;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 * This class represents a model of User data
 * It acts as the domain-specific class that the application
 * will use to represent the "users" table of the database
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
	private String password;		
	private Date dateJoined;		
	private List<Errand> errands;	// Errands associated with this user	
	private List<Rating> ratings;	// Ratings received by the user
	
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
	public List<Errand> getErrands() {
		return errands;
	}
	public List<Rating> getRatings() {
		return ratings;
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
	public void setErrands(List<Errand> errands) {
		this.errands = errands;
	}
	public void setRatings(List<Rating> ratings) {
		this.ratings = ratings;
	}
	
	public String toString() {
		return nameFirst + " " + nameLast;
	}
	
}
