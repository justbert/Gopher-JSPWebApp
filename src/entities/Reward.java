package entities;

import java.io.Serializable;

/**
 * This class represents a model for errand rewards
 * It acts as the domain-specific class that the application
 * will use to represent the "rewards" table of the database
 * @author skyet
 *
 */
public class Reward implements Serializable {
	private static final long serialVersionUID = 789459184699975989L;

	private int id;
	private String name;
	private int rewardValue;
	private Address address;
	private String description;
	
	// Getters
	public int getId() {
		return id;
	}
	public String getName() {
		return name;
	}
	public int getRewardValue() {
		return rewardValue;
	}
	public Address getAddress() {
		return address;
	}
	public String getDescription() {
		return description;
	}
	
	// Setters
	public void setId(int id) {
		this.id = id;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setRewardValue(int rewardValue) {
		this.rewardValue = rewardValue;
	}
	public void setAddress(Address address) {
		this.address = address;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	
}
