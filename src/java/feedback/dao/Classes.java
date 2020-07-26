package feedback.dao;

public class Classes {
String branch;
String year;
String sub;
String sem;
String sec;
public String getBranch() {
	return branch;
}
public void setBranch(String branch) {
	this.branch = branch;
}
public String getYear() {
	return year;
}
public void setYear(String year) {
	this.year = year;
}
public String getSub() {
	return sub;
}
public void setSub(String sub) {
	this.sub = sub;
}
public String getSem() {
	return sem;
}
public void setSem(String sem) {
	this.sem = sem;
}
public String getSec() {
	return sec;
}
public void setSec(String sec) {
	this.sec = sec;
}
public Classes(String branch, String year, String sub, String sem, String sec) {
	super();
	this.branch = branch;
	this.year = year;
	this.sub = sub;
	this.sem = sem;
	this.sec = sec;
}
public Classes() {
	super();
}

}
