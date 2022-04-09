package model.academy;

public class Student {
	private int id;
	private String name;
	private int age;
	private String location;
	private String state;
	private String email;
	private String subject;
	
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	@Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", age=" + age + ", location=" + location + ", state=" + state
				+ ", email=" + email + ", subject=" + subject + ", getId()=" + getId() + ", getName()=" + getName()
				+ ", getAge()=" + getAge() + ", getLocation()=" + getLocation() + ", getState()=" + getState()
				+ ", getEmail()=" + getEmail() + ", getSubject()=" + getSubject() + "]";
	}

	
	
	
}
