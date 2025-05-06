package model;

/**
 *
 * @author Matheus
 */

import java.util.ArrayList;
import java.sql.*;

public class Task {
    
    public static final String CLASS_NAME = "org.sqlite.JDBC";
    public static final String URL = "jdbc:sqlite:to-do.db";
    
    public static Exception exception = null;
    
    public static void createTable(){
        try{
            Connection con = getConnection();
            Statement stmt = con.createStatement();
            stmt.execute("create table if not exists tasks(title varchar not null)");
            stmt.close();
            con.close();
        }catch(Exception ex){
            exception = ex;
        }
    }
    
    public static Connection getConnection() throws Exception {
        Class.forName(CLASS_NAME);
        return DriverManager.getConnection(URL);
    }
    
    public static ArrayList<Task> getList() throws Exception{
        ArrayList<Task> list = new ArrayList<>();
        Connection con = getConnection();
        Statement stmt = con.createStatement();
        ResultSet rs = stmt.executeQuery("select * from tasks");
        while(rs.next()){
            list.add(new Task(rs.getString("title")));
        }
        rs.close();
        stmt.close();
        con.close();
        return list;
    }
    
    public static void addTask(String title) throws Exception{
        Connection con = getConnection();
        PreparedStatement stmt = con.prepareStatement("insert into tasks (title) values (?)");
        stmt.setString(1, title);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static void removeTask(String title) throws Exception{
        Connection con = getConnection();
        PreparedStatement stmt = con.prepareStatement("delete from tasks where title = ?");
        stmt.setString(1, title);
        stmt.execute();
        stmt.close();
        con.close();
    }
    
    public static ArrayList<Task> list = new ArrayList<>();
    
    private String title;
    
    public Task() {
        this.setTitle("[NEW]");
    }
    
    public Task (String title) {
        this.title = title;
    }
    
    public String getTitle() {
        return title;
    }
    
    public void setTitle (String title) {
        this.title = title;
    }
}