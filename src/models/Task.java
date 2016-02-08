package models;

import java.io.Serializable;

public class Task implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = -218272690039621900L;
	private String taskName = "Phantasmagorical Photon Shifter";
	
	public void setTaskName(String TaskName){
		this.taskName = TaskName;
	}
	public String getTaskName(){
		return taskName;
	}
}
