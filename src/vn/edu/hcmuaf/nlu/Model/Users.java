package vn.edu.hcmuaf.nlu.Model;

import java.sql.Timestamp;

public class Users {
    private  int id;
   private String fullName, email, passWord, phone, address;
    private   int level;
    Timestamp CREATED_TIME;

    public Users(int id, String fullName, String email, String passWord, String phone, String address, int level, Timestamp CREATED_TIME) {
        this.id = id;
        this.fullName = fullName;
        this.email = email;
        this.passWord = passWord;
        this.phone = phone;
        this.address = address;
        this.level = level;
        this.CREATED_TIME = CREATED_TIME;
    }
    public  Users(){

    }
    public Users(String email, String passWord) {
        this.email = email;
        this.passWord = passWord;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassWord() {
        return passWord;
    }

    public void setPassWord(String passWord) {
        this.passWord = passWord;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public Timestamp getCREATED_TIME() {
        return CREATED_TIME;
    }

    public void setCREATED_TIME(Timestamp CREATED_TIME) {
        this.CREATED_TIME = CREATED_TIME;
    }

    @Override
    public String toString() {
        return "Users{" +
                "id=" + id +
                ", fullName='" + fullName + '\'' +
                ", email='" + email + '\'' +
                ", passWord='" + passWord + '\'' +
                ", phone='" + phone + '\'' +
                ", address='" + address + '\'' +
                ", level=" + level +
                ", CREATED_TIME=" + CREATED_TIME +
                '}';
    }
}
