package models;

import java.io.Serializable;

public class Task implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -218272690039621900L;
	private String taskName = "Pick up my groceries";
	private String taskDescription = "I need someone to pick up my sweet groceries and meats puhhhlueeeezzzee";
	
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
