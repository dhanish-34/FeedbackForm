package feedback.entity;

public class ClassValue {
String value;
String handligClass;
public String getValue() {
	return value;
}
public void setValue(String value) {
	this.value = value;
}
public String getHandligClass() {
	return handligClass;
}
public void setHandligClass(String handligClass) {
	this.handligClass = handligClass;
}
public ClassValue(String value, String handligClass) {
	super();
	this.value = value;
	this.handligClass = handligClass;
}
public ClassValue() {
	super();
}

}
