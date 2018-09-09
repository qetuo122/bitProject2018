package member.model;

public class MemberInfo {
	
		String userId;
		String password;
		String userName;
		String photoFile;
		
		public MemberInfo (){}
		
		public MemberInfo (String userId, String password, String userName, String photoFile){
			this.userId = userId;
			this.password = password;
			this.userName = userName;
			this.photoFile = photoFile;
		}
		@Override
		public String toString() {
			return "MemberInfo [userId=" + userId + ", password=" + password + ", userName=" + userName + ", photoFile="
					+ photoFile + "]";
			
		}
		public String getUserId() {
			return userId;
		}
		public void setUserId(String userId) {
			this.userId = userId;
		}
		public String getPassword() {
			return password;
		}
		public void setPassword(String password) {
			this.password = password;
		}
		public String getUserName() {
			return userName;
		}
		public void setUserName(String userName) {
			this.userName = userName;
		}
		public String getPhotoFile() {
			return photoFile;
		}
		public void setPhotoFile(String photoFile) {
			this.photoFile = photoFile;
		}
		
	

}
