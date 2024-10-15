/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package user;

import Util.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Dell
 */
public class UserDAO {
    private static final String LOGIN="SELECT * FROM Users WHERE userID=? AND password=? ";
    private static final String CHECK_DUPLICATE="SELECT userID FROM Users WHERE userID=?  ";
    private static final String INSERT="INSERT INTO Users(userID, userName, password, phoneNum, email) "
            + "                         VALUES(?,?,?,?,?)";
    private static final String UPDATE="UPDATE Users SET userName=?, password=?, phoneNum=?, email=? Where userID=?";
    
    
    public UserDTO checkLogin(String userID, String password) throws SQLException {
        UserDTO user= null;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(LOGIN);
                ptm.setString(1, userID);
                ptm.setString(2, password);
                rs= ptm.executeQuery();
                if(rs.next()){
                    String userId = rs.getString("userID");
                    String fullName = rs.getString("userName");
                    String pass = rs.getString("password");
                    String phone = rs.getString("phoneNum");
                    String gmail = rs.getString("email");
                    user= new UserDTO(userId, fullName, password, phone, gmail);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
    
    public boolean checkDuplicate(String userID) throws SQLException {
        boolean check= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        ResultSet rs= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(CHECK_DUPLICATE);
                ptm.setString(1, userID);
                rs= ptm.executeQuery();
                if(rs.next()){
                    check= true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }finally{
            if(rs!= null) rs.close();
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return check;
    }
    
    public boolean insert(UserDTO user) throws ClassNotFoundException, SQLException {
        boolean checkInsert= false;
        Connection conn= null;
        PreparedStatement ptm= null;
        try {
            conn= DBUtils.getConnection();
            if(conn!= null){
                ptm= conn.prepareStatement(INSERT);
                ptm.setString(1, user.getUserID());
                ptm.setString(2, user.getUserName());
                ptm.setString(3, user.getPassword());
                ptm.setString(4, user.getPhoneNum());
                ptm.setString(5, user.getEmail());
                checkInsert= ptm.executeUpdate()>0?true:false;
            }
        } finally{
            if(ptm!= null) ptm.close();
            if(conn!= null) conn.close();
        }
        return checkInsert;
    }
    
    public boolean update(UserDTO user) throws SQLException, ClassNotFoundException {
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement(UPDATE)) {
            ps.setString(1, user.getUserName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getPhoneNum());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getUserID());
            return ps.executeUpdate()>0;
        }
    }
    
    public UserDTO getUser(String userID) throws Exception {
        UserDTO account = null;
        try (Connection conn = DBUtils.getConnection();
                PreparedStatement ps = conn.prepareStatement("SELECT * FROM Users WHERE userID=?")) {
            ps.setString(1, userID);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    String pass = rs.getString("password");
                    String fullname = rs.getString("userName");
                    String email = rs.getString("email");
                    String phone = rs.getString("phoneNum");
                    account = new UserDTO(userID, fullname, pass, phone, email);
                }
            }
        }
        return account;
    }
}
