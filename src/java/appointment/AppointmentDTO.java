/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appointment;

/**
 *
 * @author Dell
 */
public class AppointmentDTO {
    private String ID;
    private String Name;
    private String Date;
    private String Time;
    private String purpose;
    private String status;
    private String userID;

    public AppointmentDTO() {
    }

    public AppointmentDTO(String ID, String Name, String Date, String Time, String purpose, String status, String userID) {
        this.ID = ID;
        this.Name = Name;
        this.Date = Date;
        this.Time = Time;
        this.purpose = purpose;
        this.status = status;
        this.userID = userID;
    }

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getName() {
        return Name;
    }

    public void setName(String Name) {
        this.Name = Name;
    }

    public String getDate() {
        return Date;
    }

    public void setDate(String Date) {
        this.Date = Date;
    }

    public String getTime() {
        return Time;
    }

    public void setTime(String Time) {
        this.Time = Time;
    }

    public String getPurpose() {
        return purpose;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getUserID() {
        return userID;
    }

    public void setUserID(String userID) {
        this.userID = userID;
    }
    
    
}
