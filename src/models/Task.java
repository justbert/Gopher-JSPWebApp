package models;

import java.io.Serializable;

/**
 * Task bean for modelling database tables
 * @author Josh
 */
public class Task implements Serializable{
	private static final long serialVersionUID = -218272690039621900L;
	private String taskName;
	private String taskDescription;
	
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
