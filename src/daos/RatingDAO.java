package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Rating;
import utils.DatabaseManager;

/**
 * Defines all actions that may be performed on the Rating model class.
 * Maps the Rating model to the ratings db table.
 * @author skyet
 *
 */
public class RatingDAO extends DatabaseManager {
	
	/** Select all ratings from database and order them by newest first */
	private static final String selectAllRatings = 
			"SELECT * FROM ratings ORDER BY date_created desc";
	
	/** Select all ratings for a single user by user id */
	private static final String selectUserRatingsId = 
			"SELECT * FROM ratings WHERE user_rated_id = ? ORDER BY date_created desc";
	
	/** Select all ratings made by a single user by user id */
	private static final String selectContributedRatingsById = 
			"SELECT * FROM ratings WHERE user_rater_id = ? ORDER BY date_created desc";
	
	/** Add a rating */
	
	/**
	 * Returns a list of all ratings from the database ordered by most recent
	 * @return List of Rating objects
	 */
	public List<Rating> getAllRatings() {
		List<Rating> ratings = new ArrayList<>();
		
		try (ResultSet rs = query(selectAllRatings)){
			while (rs.next()) {
				Rating rating = new Rating();
				rating.setId(rs.getInt("id"));
				rating.setUserRated(null);	// will have to decide how to do this later
				rating.setRater(null);		// perhaps a method in User or UserDAO to get User by id
				rating.setRating(rs.getInt("rating"));
				rating.setComments(rs.getString("comments"));
				rating.setDateCreated(rs.getDate("date_created"));
				ratings.add(rating);
			}
		}
		catch (SQLException e) {
			e.printStackTrace();
		}
		
		return ratings;
	}
	
}
