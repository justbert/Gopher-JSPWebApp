package daos;

import java.sql.ResultSet;
import java.sql.SQLException;

import entities.Errand;
import entities.Reward;
import entities.Errand.ImportanceType;
import entities.Errand.StatusType;
import utils.DatabaseManager;

public class RewardDAO extends DatabaseManager{
	private static final String select_RewardForID = "SELECT * FROM rewards WHERE id = ?";
	
	public Reward getRewardForID(int id){
		Reward reward = null;
		try(ResultSet rs = query(select_RewardForID, Integer.toString(id));){
			if(rs.next())
				reward = new Reward(
						rs.getInt("id"),
						rs.getString("name"),
						rs.getInt("rewardValue"),
						rs.getString("description")
					);
		}
		catch (SQLException e){
			e.printStackTrace();
			return null;
		}
		return reward;
	}
}
