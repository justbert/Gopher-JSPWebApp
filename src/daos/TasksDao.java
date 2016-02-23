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
							rs.getInt("id"),
							rs.getString("name"),
							rs.getInt("errand_id"),
							rs.getDate("date_created"),
							rs.getDate("date_initiated"),
							rs.getDate("date_completed"),
							new Address(),
							rs.getBoolean("is_active"),
							rs.getString("description")						
						);
		}catch(SQLException e){
			e.printStackTrace();
		}
		return null;
	}
}

