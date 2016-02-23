package entities;

import java.io.Serializable;

/**
 * This class represents a model for addresses
 * It acts as the domain-specific class that the application
 * will use to represent the "addresses" table of the database
 * @author skyet
 *
 */
public class Address implements Serializable {
	private static final long serialVersionUID = -3615245129407389786L;
	
	private int id;
	private String streetAddress1;
	private String streetAddress2;
	private String city;
	private String province;
	private String postalCode;
	
	// Getters
	public int getId() { 
		return id; 
	}
	public String getStreetAddress1() { 
		return streetAddress1; 
	}
	public String getStreetAddress2() { 
		return streetAddress2; 
	}
	public String getCity() { 
		return city; 
	}
	public String getProvince() { 
		return province; 
	}
	public String getPostalCode() { 
		return postalCode; 
	}
	
	// Setters
	public void setId(int id) { 
		this.id = id; 
	}
	public void setStreetAddress1(String streetAddress1) { 
		this.streetAddress1 = streetAddress1; 
	}
	public void setStreetAddress2(String streetAddress2) { 
		this.streetAddress2 = streetAddress2;
	}
	public void setCity(String city) { 
		this.city = city; 
	}
	public void setProvince(String province) { 
		this.province = province; 
	}
	public void setPostalCode(String postalCode) { 
		this.postalCode = postalCode; 
	}

}
