/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package appointment;

import Util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import user.UserDTO;

/**
 *
 * @author Dell
 */
public class AppointmentDAO {
    private static final String CREATE="INSERT INTO Appointment(ID, Name, AppointmentDate, AppointmentTime, purpose, status, userID) "
            + "                         VALUES(?,?,?,?,?,?,?)";
    private static final String UPDATE="UPDATE Appointment SET Name=?, AppointmentDate=?, AppointmentTime=?, purpose=?, status=? Where ID=? AND userID=?";
    
    public boolean create(AppointmentDTO app) throws ClassNotFoundException, SQLException {
        boolean checkInsert= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(CREATE);
                ptm.setString(1, app.getID());
                ptm.setString(2, app.getName());
                ptm.setString(3, app.getDate());
                ptm.setString(4, app.getTime());
                ptm.setString(5, app.getPurpose());
                ptm.setString(6, app.getStatus());
                ptm.setString(7, app.getUserID());
                checkInsert= ptm.executeUpdate()>0?true:false;
            }
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkInsert;
    }
    
    public List<AppointmentDTO> getAllProducts(String userID) throws Exception {
    List<AppointmentDTO> list = new ArrayList<>();
    String sql = "SELECT * FROM Appointment WHERE userID=?";
    
    try (Connection conn = DBUtils.getConnection(); PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, userID);
        try (ResultSet rs = ps.executeQuery()) {
            while (rs.next()) {
                String ID = rs.getString("ID");
                String name = rs.getString("Name");
                String Date = rs.getString("AppointmentDate");
                String time = rs.getString("AppointmentTime");
                String purpose = rs.getString("purpose");
                String status = rs.getString("status");
                list.add(new AppointmentDTO(ID, name, Date, time, purpose, status, userID));
            }
        }
    }
    return list;
    }
    
    public boolean remove(String ID, String userID) throws Exception {
        String sql = "DELETE FROM Appointment WHERE ID=? AND userID=?";
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            ps.setString(1, ID);
            ps.setString(2, userID);
            return ps.executeUpdate() > 0;
        }
    }
    
    public boolean update(AppointmentDTO app) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(UPDATE)) {
            ps.setString(1, app.getName());
            ps.setString(2, app.getDate());
            ps.setString(3, app.getTime());
            ps.setString(4, app.getPurpose());
            ps.setString(5, app.getStatus());
            ps.setString(6, app.getID());
            ps.setString(7, app.getUserID());
            return ps.executeUpdate()>0;
        }
    }
}
