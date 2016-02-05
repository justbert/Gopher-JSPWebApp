package models;

import java.io.Serializable;
import java.util.Date;

/**
 * This class represents a model of User data
 * @author skyet
 *
 */
public class User implements Serializable {
	private static final long serialVersionUID = -6205863538753164722L;
	
	// Fields
	private int id;
	private String username;
	private String name_first;
	private String name_last;
	private String email;
	private Address address_home;
	private Address address_work;
	private String phone_home;
	private String phone_work;
	private String password;	// yes this is here for now shhh
	private Date date_joined;
	
	// Getters
	public int getId() { 
		return id; 
	}
	public String getUsername() { 
		return username; 
	}
	public String getName_first() { 
		return name_first; 
	}
	public String getName_last() { 
		return name_last; 
	}
	public String getEmail() { 
		return email; 
	}
	public Address getAddress_home() { 
		return address_home; 
	}
	public Address getAddress_work() { 
		return address_work; 
	}
	public String getPhone_home() { 
		return phone_home; 
	}
	public String getPhone_work() { 
		return phone_work; 
	}
	public String getPassword() { 
		return password; 
	}
	public Date getDate_joined() { 
		return date_joined; 
	}
	
	// Setters
	public void setId(int id) { 
		this.id = id; 
	}
	public void setUsername(String username) { 
		this.username = username; 
	}
	public void setName_first(String name_first) { 
		this.name_first = name_first; 
	}
	public void setName_last(String name_last) { 
		this.name_last = name_last; 
	}
	public void setEmail(String email) { 
		this.email = email; 
	}
	public void setAddress_home(Address address_home) { 
		this.address_home = address_home; 
	}
	public void setAddress_work(Address address_work) { 
		this.address_work = address_work; 
	}
	public void setPhone_home(String phone_home) { 
		this.phone_home = phone_home; 
	}
	public void setPhone_work(String phone_work) { 
		this.phone_work = phone_work; 
	}
	public void setPassword(String password) { 
		this.password = password; 
	}
	public void setDate_joined(Date date_joined) { 
		this.date_joined = date_joined; 
	}
	
	
	
}
