package daos;

import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import entities.Notification;
import utils.DatabaseManager;

public class NotificationDAO extends DatabaseManager{
	
	private static final String select_AllNotification = "SELECT * FROM notifications";
	
	
	public NotificationDAO(){
		
	}
	
//	public List<Notification> getAllNotifications(){
//		List<Notification> results = new ArrayList<>();
//		try(ResultSet rs = query(select_AllNotification)){
//			while(rs.next())
//				results.add(new Notification(
//						rs.getInt("id"),
//						rs.getString("title"),
//						
//						
//						
//						));
//		}
//	}
}
