package entities;

public class Notification {
	private Integer id;
	private String title;
	private User userId;
	private NotificationType notificationTypeID;
	
	public enum NotificationType{
		SystemMessage("System Message", 0),
		PrivateMessage("Private Message", 1),
		ErrandCompleted("Errand Completed", 2),
		ErrandAccepted("Errand Accepted", 3);
		
		private String title;
		private int index;
		
		private NotificationType(String title, int index){
			this.title = title;
			this.index = index;
		}
		
		public NotificationType getNotificationType(int index){
			for(NotificationType type : NotificationType.values())
				if(type.index == index) return type;
			return null;
		}
		
		public String getTitle(){
			return title;
		}
		
		public int getIndex(){
			return this.index;
		}
	}

	public Notification(Integer id, String title, User userId, NotificationType notificationTypeID) {
		super();
		this.id = id;
		this.title = title;
		this.userId = userId;
		this.notificationTypeID = notificationTypeID;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public User getUserId() {
		return userId;
	}

	public void setUserId(User userId) {
		this.userId = userId;
	}

	public NotificationType getNotificationTypeID() {
		return notificationTypeID;
	}

	public void setNotificationTypeID(NotificationType notificationTypeID) {
		this.notificationTypeID = notificationTypeID;
	}	
}
