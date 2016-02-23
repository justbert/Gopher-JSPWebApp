package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import entities.Rating;
import entities.User;
import utils.DatabaseManager;

/**
 * Defines all actions that may be performed on the Rating model class.
 * Maps the Rating model to the ratings db table.
 * @author skyet
 *
 */
public class RatingDAO extends DatabaseManager {
	
	/** Defines a query that selects all ratings ordered them by newest first */
	private static final String selectAllRatings = 
			"SELECT * FROM ratings ORDER BY date_created desc";
	
	/** Defines a query that selects all ratings for a single user by user id */
	private static final String selectUserRatingsById = 
			"SELECT * FROM ratings WHERE user_rated_id = ? ORDER BY date_created desc";
	
	/** Defines a query that selects all ratings made by a single user by user id */
	private static final String selectContributedRatingsById = 
			"SELECT * FROM ratings WHERE user_rater_id = ? ORDER BY date_created desc";
	
	/** Defines a query that adds a rating entry into the database */
	private static final String insertRating = 
			"INSERT INTO ratings ( user_rated_id, user_rater_id, errand_id, rating, comments )"
			+ "VALUES ( ?, ?, ?, ?, ? )";
	
	
	/**
	 * Returns a list of all ratings from the database ordered by most recent
	 * @return List of Rating objects
	 */
	public List<Rating> getAllRatings() {
		List<Rating> ratings = new ArrayList<>();
		
		try (ResultSet rs = query(selectAllRatings)){
			while (rs.next()) {
				ratings.add(mapData(rs));
			}
		}
		catch (SQLException e) {
			e.printStackTrace();	// Handle this eventually
		}
		
		return ratings;
	}
	
	
	/**
	 * Returns a list of all ratings given to the User specified by userId
	 * @param userId The id of the user for which to return the ratings
	 * @return a list of Rating objects associated with the specified User
	 */
	public List<Rating> getUserRatingsById(int userId) {
		List<Rating> ratings = new ArrayList<>();
		
		try (ResultSet rs = query(selectUserRatingsById, Integer.toString(userId))) {
			while (rs.next()) {
				ratings.add(mapData(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();	// Handle this eventually
		}
		
		return ratings;
	}
	
	
	/**
	 * Returns a list of ratings that were made by the User specified by userId
	 * @param userId The id of the User for which to return the contributed ratings
	 * @return a list of Rating objects that were made by the specified User
	 */
	public List<Rating> getRatingsMadeById(int userId) {
		List<Rating> ratings = new ArrayList<>();
		
		try (ResultSet rs = query(selectContributedRatingsById, Integer.toString(userId))) {
			while (rs.next()) {
				ratings.add(mapData(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();	// Handle this eventually
		}
		
		return ratings;
	}
	
	/**
	 * 
	 * @param ratedId
	 * @param raterId
	 * @param errandId
	 * @param rating
	 * @param comments
	 * @return
	 */
	public int addRating(int ratedId, int raterId, int errandId, int rating, String comments) {	
		int result = -1;
		
		try {
			result = update(insertRating, 
					Integer.toString(ratedId), 
					Integer.toString(raterId),
					Integer.toString(errandId), 
					Integer.toString(rating), 
					comments);
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		return result;
	}
	
	
	/**
	 * Helper method that maps the data from the specified ResultSet to a Rating model object
	 * @param rs the ResultSet to be mapped to a Rating
	 * @return The Rating with data mapped from the ResultSet
	 * @throws SQLException if an error occurs when accessing db
	 */
	private static Rating mapData(ResultSet rs) throws SQLException {
		Rating rating = new Rating();
		
		rating.setId(rs.getInt("id"));
		rating.setUserRated(new User());		// will have to decide how to do this later
		rating.setRater(new User());			// Can User class use its DAO to do this with an id?
		rating.setRating(rs.getInt("rating"));
		rating.setComments(rs.getString("comments"));
		rating.setDateCreated(rs.getDate("date_created"));
		
		return rating;
	}
	
}
