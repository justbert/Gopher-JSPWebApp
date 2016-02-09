package models;

import java.io.Serializable;

/**
 * This class represents a model for addresses
 * @author skyet
 *
 */
public class Address implements Serializable {

	private static final long serialVersionUID = -3615245129407389786L;
	
	// Fields
	private int id;
	private String street_address1;
	private String street_address2;
	private String city;
	private String province;
	private String postal_code;
	
	// Getters
	public int getId() { 
		return id; 
	}
	public String getStreet_address1() { 
		return street_address1; 
	}
	public String getStreet_address2() { 
		return street_address2; 
	}
	public String getCity() { 
		return city; 
	}
	public String getProvince() { 
		return province; 
	}
	public String getPostal_code() { 
		return postal_code; 
	}
	
	// Setters
	public void setId(int id) { 
		this.id = id; 
	}
	public void setStreet_address1(String street_address1) { 
		this.street_address1 = street_address1; 
	}
	public void setStreet_address2(String street_address2) { 
		this.street_address2 = street_address2;
	}
	public void setCity(String city) { 
		this.city = city; 
	}
	public void setProvince(String province) { 
		this.province = province; 
	}
	public void setPostal_code(String postal_code) { 
		this.postal_code = postal_code; 
	}

}
