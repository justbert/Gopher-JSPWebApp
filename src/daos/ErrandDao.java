package daos;

import utils.DatabaseManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Address;
import entities.Errand;
import entities.Errand.ImportanceType;
import entities.Errand.StatusType;
import entities.User.UserType;
import entities.User;
/**
 * 
 * @author joshr
 *
 */
public class ErrandDao extends DatabaseManager {
	private static final String DELETE = "DELETE FROM Errands WHERE id=?";
	private static final String SELECT_ALL = "SELECT * FROM errands";
	private static final String SELECT_BY_ID = "SELECT * FROM errands where id = ?";
	private static final String SELECT_BY_NAME = "SELECT * FROM Errands WHERE name=?";
	private static final String INSERT = "INSERT INTO Errands(name, tel, passwd) VALUES(?, ?, ?)";
	private static final String UPDATE = "UPDATE Errands SET name=?, tel=?, passwd=? WHERE id=?";
	private static final String SELECT_ERRANDS_FOR_USERID = "SELECT * From errands join users on errands.userIdCustomer = users.id where users.id = ?";
	private static final String SELECT_ERRANDS_FOR_GOPHERID = "SELECT * From errands join users on errands.userIdGopher = users.id where users.id = ?";
	private static final String SELECT_12_LATEST = "SELECT * FROM errands ORDER BY creationDate DESC LIMIT 12";
	private UserDao userDB = new UserDao();
	private RewardDAO rewardDB = new RewardDAO();
	
	
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
		List<Errand> errands = new ArrayList<Errand>();
		try(ResultSet rs = query(SELECT_ALL)){
			while (rs.next()){
				errands.add(new Errand(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("description"),
						rs.getDate("creationDate"),
						rs.getDate("completionDate"),
						rs.getTimestamp("deadline"),
						rewardDB.getRewardForID(rs.getInt("rewardId")),
						StatusType.getStatusType(rs.getInt("statusTypeId")),
						ImportanceType.getImportanceType(rs.getInt("importanceTypeId")),
						userDB.getUserForID(rs.getInt("userIdCustomer")),
						userDB.getUserForID(rs.getInt("userIdGopher"))					
					));
			}
			return errands;
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
	
	public List<Errand> selectErrandsForUser(User user){
		return selectErrandsForUser(SELECT_ERRANDS_FOR_USERID, user.getId());
	}
	
	public List<Errand> selectErrandsForGopherId(User user){
		return selectErrandsForUser(SELECT_ERRANDS_FOR_GOPHERID, user.getId());
	}
	
	public List<Errand> selectErrandsForUser(String query, int userid){
		List<Errand> errands = new ArrayList<Errand>();
		try(ResultSet rs = query(query, userid)){
			while (rs.next()){
				errands.add(new Errand(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("description"),
						rs.getDate("creationDate"),
						rs.getDate("completionDate"),
						rs.getTimestamp("deadline"),
						rewardDB.getRewardForID(rs.getInt("rewardId")),
						StatusType.getStatusType(rs.getInt("statusTypeId")),
						ImportanceType.getImportanceType(rs.getInt("importanceTypeId")),
						userDB.getUserForID(rs.getInt("userIdCustomer")),
						userDB.getUserForID(rs.getInt("userIdGopher"))					
					));
			}
			return errands;
		} catch (SQLException e){
			throw new RuntimeException(e);
		}	
	}
	
	public Errand selectById(int id){
		Errand errand = null;
		try(ResultSet rs = query(SELECT_BY_ID, Integer.toString(id));){
			if(rs.next())
				errand = new Errand(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("description"),
						rs.getDate("creationDate"),
						rs.getDate("completionDate"),
						rs.getTimestamp("deadline"),
						rewardDB.getRewardForID(rs.getInt("rewardId")),
						StatusType.getStatusType(rs.getInt("statusTypeId")),
						ImportanceType.getImportanceType(rs.getInt("importanceTypeId")),
						userDB.getUserForID(rs.getInt("userIdCustomer")),
						userDB.getUserForID(rs.getInt("userIdGopher"))
					);
		}
		catch (SQLException e){
			e.printStackTrace();
			return null;
		}
		return errand;
	}
	
	public List<Errand> select12Latest(){
		List<Errand> errands = new ArrayList<Errand>();
		try(ResultSet rs = query(SELECT_12_LATEST)){
			while (rs.next()){
				errands.add(new Errand(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getString("description"),
						rs.getDate("creationDate"),
						rs.getDate("completionDate"),
						rs.getTimestamp("deadline"),
						rewardDB.getRewardForID(rs.getInt("rewardId")),
						StatusType.getStatusType(rs.getInt("statusTypeId")),
						ImportanceType.getImportanceType(rs.getInt("importanceTypeId")),
						userDB.getUserForID(rs.getInt("userIdCustomer")),
						userDB.getUserForID(rs.getInt("userIdGopher"))					
					));
			}
			return errands;
		} catch (SQLException e){
			throw new RuntimeException(e);
		}
	}
}