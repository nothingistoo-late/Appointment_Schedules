/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

/**
 *
 * @author Dell
 */
public class UserError {
    private String userID;
    private String userName;
    private String password;
    private String confirm;
    private String phoneNum;
    private String email;

    public UserError() {
        this.userID = "";
        this.userName = "";
        this.password = "";
        this.confirm = "";
        this.phoneNum = "";
        this.email = "";
    }

    public UserError(String userID, String userName, String password, String confirm, String phoneNum, String email) {
        this.userID = userID;
        this.userName = userName;
        this.password = password;
        this.confirm = confirm;
        this.phoneNum = phoneNum;
        this.email = email;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
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

    public String getConfirm() {
        return confirm;
    }

    public void setConfirm(String confirm) {
        this.confirm = confirm;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }
    
    
}
