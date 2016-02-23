package entities;

public class Notification {
	private Integer id;
	private String title;
	private User user;
	private NotificationType type;
	
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

	public Notification(Integer id, String title, User user, NotificationType type) {
		super();
		this.id = id;
		this.title = title;
		this.user = user;
		this.type = type;
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

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public NotificationType getType() {
		return type;
	}

	public void setType(NotificationType type) {
		this.type = type;
	}

	
}
