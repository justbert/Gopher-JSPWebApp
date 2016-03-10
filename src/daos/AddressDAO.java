package daos;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import entities.Address;
import entities.Rating;
import entities.Reward;
import entities.User;
import entities.Address.AddressType;
import utils.DatabaseManager;

public class AddressDAO  extends DatabaseManager{

	
	/**
	 * Query for all rows with matching userId
	 */
	private static final String SELECT_ALL_ADDRESSES_BY_USERID = "SELECT * FROM addresses WHERE userId = ?";
	
	private static final String INSERT_ADDRESS = "INSERT INTO addresses ( id, addressLine1, addressLine2, city, province, country, zip, userId, addressType )"
											   + "VALUES ( ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	 
	private static final String UPDATE_ADDRESS = "UPDATE addresses SET addressLine1=?, addressLine2=?, city=?, province=?, country=?, zip=?, addressType=? WHERE id=?";
	
	
	/**
	 * Returns All addresses belonging to the user with the matching userId
	 * @param userId
	 * @return All addresses with the matching userId
	 */
	public List<Address> getAddresses(int userId){
		
		List<Address> addresses = new ArrayList<>();
		
		try (ResultSet rs = query(SELECT_ALL_ADDRESSES_BY_USERID, Integer.toString(userId))) {
			while (rs.next()) {
				addresses.add(mapData(rs));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}	
		return addresses;
	}
	
	/**
	 * Updates an Address
	 * @param addressLine1
	 * @param addressLine2
	 * @param city
	 * @param province
	 * @param country
	 * @param zip
	 * @param addressType
	 * @param addressId
	 * @return The number of rows affected
	 */
	public int editRating(String addressLine1, String addressLine2, String city, String province, String country, String zip, int newAddressType, int addressId){
		
		/* Since this method updates all fields, in the GUI the old information will be auto-filled 
		 * into the form, letting the user change what they want before they submit.
		 */
		
		int result = -1;
		Address.AddressType addressType = null;

		//TODO	Workaround for dealing with enum AddressType...not sure if best implementation
		switch(newAddressType){			
			case 1:
				addressType = Address.AddressType.HOME;
				break;
				
			case 2:
				addressType = Address.AddressType.WORK;
				break;
				
			case 3:
				addressType = Address.AddressType.PICKUP_LOCATION;
				break;
				
			case 4:
				addressType = Address.AddressType.MEETING_LOCATION;
				break;
				
			case 5:
				addressType = Address.AddressType.DROPOFF_LOCATION;
				break;
				
			case 6:
				addressType = Address.AddressType.CUSTOM_TYPE;
				break;

			default:
				addressType = Address.AddressType.CUSTOM_TYPE;
		}
		
		
		try {
			result = update(
				UPDATE_ADDRESS, 
				addressLine1,
				addressLine2,
				city,
				province,
				country,
				zip,
				addressType,
				addressId					
			);
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}		
		return result;
	}
	
	
	/**
	 * Inserts a new address into the database
	 * @param Address Object
	 * @return The number of rows updated
	 */
	public int addAddress(Address address) {	
		int result = -1;
		
		Object[] addressData = {
			address.getId(),
			address.getAddressLine1(),
			address.getAddressLine2(),
			address.getCity(),
			address.getProvince(),
			address.getCountry(),
			address.getZip(),
			address.getUserId(),
			address.getAddressType()
		};
		
		try {
			result = update(INSERT_ADDRESS, addressData);			
		} 
		catch (SQLException e) {
			e.printStackTrace();
		}	
		return result;
	}
	
	
	/**
	 * Address object created using a ResultSet
	 * @param The result set to be used
	 * @return Address from the result set
	 * @throws SQLException in case of database error
	 */
	private static Address mapData(ResultSet rs) throws SQLException {
		
		Address address = null;
		Address.AddressType addressType = null;

		//TODO	Workaround for dealing with enum AddressType...not sure if best implementation
		switch(rs.getInt("addressTypeId")){			
			case 1:
				addressType = Address.AddressType.HOME;
				break;
				
			case 2:
				addressType = Address.AddressType.WORK;
				break;
				
			case 3:
				addressType = Address.AddressType.PICKUP_LOCATION;
				break;
				
			case 4:
				addressType = Address.AddressType.MEETING_LOCATION;
				break;
				
			case 5:
				addressType = Address.AddressType.DROPOFF_LOCATION;
				break;
				
			case 6:
				addressType = Address.AddressType.CUSTOM_TYPE;
				break;

			default:
				addressType = Address.AddressType.CUSTOM_TYPE;
		}
	
		address = new Address(
			rs.getInt("id"),
			rs.getString("addressLine1"),
			rs.getString("addressLine2"),
			rs.getString("city"),
			rs.getString("province"),
			rs.getString("country"),
			rs.getString("zip"),
			new User(),					//TODO 	Make this work
			addressType					
		);				
		return address;
	}
	
}
