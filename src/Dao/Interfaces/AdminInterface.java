package Dao.Interfaces;

public interface AdminInterface {
	public void logIn(String userN, String passw);
	public void createAdmin(String id, String usermae, String password, String role, String email);
	public void passwordUpdate();
	public void deleteUsers(int id);;
	
	
}
