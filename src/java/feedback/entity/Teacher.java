package feedback.entity;

import java.util.List;

import feedback.dao.Classes;

public class Teacher {
int id;
String name;
String userName;
String password;
String branch;
List<Classes> handlingClass;
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
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
public String getPassword() {
	return password;
}
public void setPassword(String password) {
	this.password = password;
}
public String getBranch() {
	return branch;
}
public void setBranch(String branch) {
	this.branch = branch;
}
public List<Classes> getHandlingClass() {
	return handlingClass;
}
public void setHandlingClass(List<Classes> handlingClass) {
	this.handlingClass = handlingClass;
}
public Teacher() {
	super();
}
public Teacher(int id, String name, String userName, String password, String branch, List<Classes> handlingClass) {
	super();
	this.id = id;
	this.name = name;
	this.userName = userName;
	this.password = password;
	this.branch = branch;
	this.handlingClass = handlingClass;
}

}
