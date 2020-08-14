package spring.project.bookshop4.vo;

import java.sql.Timestamp;
import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class GuestVO{
	//ID, PASSWORD, NAME, JUMIN, BIRTH, SOLAR, GENDER, EMAIL, PHONE, EMAILCHECK, SMSCHECK, ADDRESS1, ADDRESS2, ADDRESS3, ENABLED, AUTHORITY
	//id, password, name, jumin, birth, solar, gender, email, phone, EmailCheck, smsCheck, address1, address2, address3, enabled, authority 
	private String id;
	private String password;
	private String name;
	private String jumin;
	private Timestamp birth;
	private String solar;
	private String gender;
	private String email;
	private String phone;
	private String emailCheck;
	private String smsCheck;
	private String address1;
	private String address2;
	private String address3;
	private boolean enabled;
	private String authority;
	
	
	public boolean getEnabled() {
		return enabled;
	}
	public String getAuthority() {
		return authority;
	}
	public void setEnabled(boolean enabled) {
		this.enabled = enabled;
	}
	public void setAuthority(String authority) {
		this.authority = authority;
	}
	public String getId() {
		return id;
	}
	public String getPassword() {
		return password;
	}
	public String getName() {
		return name;
	}
	public String getJumin() {
		return jumin;
	}
	public Timestamp getBirth() {
		return birth;
	}
	public String getBirthForString() {
		return birth.toString().substring(0, 10);
	}
	public String getSolar() {
		return solar;
	}
	public String getGender() {
		return gender;
	}
	public String getEmail() {
		return email;
	}
	public String getPhone() {
		return phone;
	}
	public String getEmailCheck() {
		return emailCheck;
	}
	public String getSmsCheck() {
		return smsCheck;
	}
	public String getAddress1() {
		return address1;
	}
	public String getAddress2() {
		return address2;
	}
	public String getAddress3() {
		return address3;
	}
	public void setId(String id) {
		this.id = id;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public void setName(String name) {
		this.name = name;
	}
	public void setJumin(String jumin) {
		this.jumin = jumin;
	}
	public void setBirth(Timestamp birth) {
		this.birth = birth;
	}
	public void setSolar(String solar) {
		this.solar = solar;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public void setEmailCheck(String emailCheck) {
		this.emailCheck = emailCheck;
	}
	public void setSmsCheck(String smsCheck) {
		this.smsCheck = smsCheck;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public void setAddress3(String address3) {
		this.address3 = address3;
	}
	@Override
	public String toString() {
		return "id:"+id+"/pwd:"+ password+"/name:"+ name+"/jumin:"+ jumin+"/birth:"+ birth+"/solar:"+ solar+"/gender:"+ gender+"/email"+ email+"/phone"+ phone+"EmailChk:"+ emailCheck+"smsChk:"+ smsCheck+"ad1:"+ address1+"ad2:"+ address2+"ad3:"+ address3;
	}
}
