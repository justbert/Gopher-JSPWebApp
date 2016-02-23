package daos;

import utils.DatabaseManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Errand;
/**
 * 
 * @author joshr
 *
 */
public class ErrandDao extends DatabaseManager {

	
	private static final String DELETE = "DELETE FROM Errands WHERE id=?";
	private static final String SELECT_ALL = "SELECT * FROM Errands ORDER BY id";
	private static final String SELECT_BY_ID = "SELECT * FROM Errands WHERE id=?";
	private static final String SELECT_BY_NAME = "SELECT * FROM Errands WHERE name=?";
	private static final String INSERT = "INSERT INTO Errands(name, tel, passwd) VALUES(?, ?, ?)";
	private static final String UPDATE = "UPDATE Errands SET name=?, tel=?, passwd=? WHERE id=?";
			
	public int delete(int id) {
		try{
		Integer result = update(DELETE, Integer.toString(id));
				return result.intValue();
		}
		catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public List<Errand> selectAll(){
		try{
			List<Errand> errands = new ArrayList<Errand>();
			ResultSet rs = query(SELECT_ALL);
			while (rs.next()){
				Errand errand = new Errand(
						rs.getInt("id"), 
						rs.getInt("user_id_customer"), 
						rs.getInt("user_id_gopher"), 
						rs.getDate("date_created"), 
						rs.getDate("date_completed"), 
						rs.getInt("reward_id"), 
						rs.getTimestamp("deadline"), 
						rs.getString("status"),
						rs.getString("importance"),
						rs.getString("category")
					);
				errands.add(errand);
			}
			return errands;
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public Errand selectById(int id){
		try{
			ResultSet rs = query(SELECT_BY_ID, Integer.toString(id));
			if (rs.next())
				return new Errand(
						rs.getInt("id"), 
						rs.getInt("user_id_customer"), 
						rs.getInt("user_id_gopher"), 
						rs.getDate("date_created"), 
						rs.getDate("date_completed"), 
						rs.getInt("reward_id"), 
						rs.getTimestamp("deadline"), 
						rs.getString("status"),
						rs.getString("importance"),
						rs.getString("category")
					);
					
		}
		catch (SQLException e){
			throw new RuntimeException(e);
		}
		return null;
	}
}

