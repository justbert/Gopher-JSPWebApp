package models;

import java.io.Serializable;

public class Task implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -218272690039621900L;
	private String taskName = "Phantasmagorical Photon Shifter";
	private String taskDescription = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.";
	
	public void setTaskDescription(String TaskDescription){
		this.taskDescription = TaskDescription;
	}
	
	public String getTaskDescription(){
		return taskDescription;
	}
	
	public void setTaskName(String TaskName){
		this.taskName = TaskName;
	}
	public String getTaskName(){
		return taskName;
	}
}
