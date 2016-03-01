package daos;

import utils.DatabaseManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Address;
import entities.Errand;
import entities.Errand.ImportanceType;
import entities.User.UserType;
import entities.User;
/**
 * 
 * @author joshr
 *
 */
public class ErrandDao extends DatabaseManager {
	private static final String DELETE = "DELETE FROM Errands WHERE id=?";
	private static final String SELECT_ALL = "SELECT errands.*, customer.id as customerId, customer.username as customerUsername, customer.nameFirst as customerNameFirst, customer.nameLast as customerNameLast, customer.email as customerEmail, customer.phoneHome as customerPhoneHome, customer.phoneWork as customerPhoneWork, customer.password as customerPassword, customer.salt as customerSalt, customer.userTypeId as customerUserTypeId, gopher.id as gopherId, gopher.username as gopherUsername, gopher.nameFirst as gopherNameFirst, gopher.nameLast as gopherNameLast, gopher.email as gopherEmail, gopher.phoneHome as gopherPhoneHome, gopher.phoneWork as gopherPhoneWork, gopher.password as gopherPassword, gopher.salt as gopherSalt, gopher.userTypeId as gopherUserTypeId FROM errands JOIN users AS `customer` ON errands.userIdCustomer = customer.id JOIN users AS `gopher` ON errands.userIdGopher = gopher.id JOIN notification_types ON errands.importanceTypeId = notification_types.id ORDER BY errands.id";
	private static final String SELECT_BY_ID = "SELECT errands.*, customer.id as customerId, customer.username as customerUsername, customer.nameFirst as customerNameFirst, customer.nameLast as customerNameLast, customer.email as customerEmail, customer.phoneHome as customerPhoneHome, customer.phoneWork as customerPhoneWork, customer.password as customerPassword, customer.salt as customerSalt, customer.userTypeId as customerUserTypeId, gopher.id as gopherId, gopher.username as gopherUsername, gopher.nameFirst as gopherNameFirst, gopher.nameLast as gopherNameLast, gopher.email as gopherEmail, gopher.phoneHome as gopherPhoneHome, gopher.phoneWork as gopherPhoneWork, gopher.password as gopherPassword, gopher.salt as gopherSalt, gopher.userTypeId as gopherUserTypeId FROM errands JOIN users AS `customer` ON errands.userIdCustomer = customer.id JOIN users AS `gopher` ON errands.userIdGopher = gopher.id JOIN notification_types ON errands.importanceTypeId = notification_types.id WHERE errands.id = ?";
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
						new User(rs.getInt("customerId"), rs.getString("customerNameFirst"), rs.getString("customerNameLast"), rs.getString("customerEmail"), rs.getString("customerPhoneHome"), rs.getString("customerPhoneMobile"),rs.getString("customerPhoneWork"), rs.getString("customerPassword"), rs.getDate("dateJoined"), UserType.getUserType(rs.getInt("userTypeId"))),
						new User(rs.getInt("gopherId"), rs.getString("gopherNameFirst"), rs.getString("gopherNameLast"), rs.getString("gopherEmail"), rs.getString("gopherPhoneHome"), rs.getString("gopherPhoneMobile"),rs.getString("gopherPhoneWork"), rs.getString("gopherPassword"), rs.getDate("dateJoined"), UserType.getUserType(rs.getInt("userTypeId"))),
						rs.getDate("dateCreated"),
						rs.getDate("dateCompleted"),
						rs.getInt("reward_id"),
						rs.getTimestamp("deadline"),
						rs.getString("status"),
						ImportanceType.valueOf(rs.getString("name"))
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
						//NEW THING
					);
					
		}
		catch (SQLException e){
			throw new RuntimeException(e);
		}
		return null;
	}
}

