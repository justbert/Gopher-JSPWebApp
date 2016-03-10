package daos;

import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Address;
import entities.Task;
import utils.DatabaseManager;

public class TasksDao extends DatabaseManager{
	
	private static final String select_latestTask = "SELECT * from tasks order by date_completed desc join on addresses using(address_id)"; 
	
	
	public Task getLastCompletedTask(){
		try(ResultSet rs = query(select_latestTask)){
			if(rs.next())
				return new Task(
							
						);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
}

