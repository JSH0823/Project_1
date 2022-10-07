package jvFile;

public class MemberDTO {
	
	private String name;
	private String id;
	private String pw;
	private String gender;
	
	public MemberDTO(String name, String id, String pw, String gender) {
		this.name = name;
		this.id = id;
		this.pw = pw;
		this.gender = gender;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String pw) {
		this.pw = pw;
	}
	
	public String getGender() {
		return gender;
	}
	
	public void setGender(String gender) {
		this.gender = gender;
	}

}
