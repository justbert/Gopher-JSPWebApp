package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import entities.Task;
import utils.DatabaseManager;

/**
 * @author Justin
 *
 */

public class TaskDAO extends DatabaseManager{
	
	private static final String select_latestTask = "SELECT * from tasks order by date_completed desc join on addresses using(address_id)"; 
	private static final String select_tasksForErrand = "SELECT * FROM tasks where errandID = ?";
	private static final String INSERT_TASK = "INSERT INTO tasks (name, description, errandID, addressesID) VALUES ( ?, ?, ?, ?)";
	private static AddressDAO addressDB = new AddressDAO();
	
	/**
	 * Inserts a new entry into the database, returning the auto-generated id
	 * @param task The model data to map to the database entry
	 * @return The auto-assigned id of the created object, -1 on failure
	 */
	public int addTask(Task task) {
		int taskId = -1;
		
		Object[] taskData = {
				task.getName(),
				task.getDescription(),
				task.getErrandId(),
				(task.getAddress_id().getId() == 0 ? null : task.getAddress_id().getId())
			};
		
		try {
			taskId = insert(INSERT_TASK, taskData);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return taskId;
	}

	
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
	
	public List<Task> getTasksForErrand(int errandID){
		List<Task> tasks = new ArrayList<Task>();
		try(ResultSet rs = query(select_tasksForErrand, errandID)){
			while(rs.next()){
				tasks.add(new Task(
						rs.getInt("id"), 
						rs.getString("name"), 
						rs.getString("description"),
						rs.getDate("startDate"),
						rs.getDate("completionDate"), 
						rs.getInt("errandId"),
						addressDB.getAddress(rs.getInt("addressesId"))
					));
			}
		}catch(SQLException e){
			e.printStackTrace();
		}
		return tasks;
	}
}

