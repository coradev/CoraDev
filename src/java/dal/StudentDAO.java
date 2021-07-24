/*
 * Created: 03-18-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import model.Student;

public class StudentDAO extends DBContext {
    
    public void insert(Student s) {
        String sql = "INSERT INTO dbo.user_student VALUES(?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getPassword());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void update(Student s) {
        String sql = "UPDATE dbo.user_student SET name = ?, email = ?, password = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, s.getName());
            ps.setString(2, s.getEmail());
            ps.setString(3, s.getPassword());
            ps.setInt(4, s.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
        
    }
    
    public void changePassword(Student s) {
        String sql = "UPDATE dbo.user_student SET password = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, s.getPassword());
            ps.setInt(2, s.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void delete(String id) {
        String sql = "DELETE FROM dbo.user_student WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public Student findById(String id) {
        String sql = "SELECT * FROM dbo.user_student WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPassword(rs.getString("password"));
                return s;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public List<Student> listAll() {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM dbo.user_student";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPassword(rs.getString("password"));
                students.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return students;
    }
    
    public List<Student> search(String search) {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM dbo.user_student\n"
                + "WHERE name LIKE N'%" + search + "%' ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            //ps.setString(1, search);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPassword(rs.getString("password"));
                students.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return students;
    }
    
    public Student getStudent(String email, String password) {
        String sql = "SELECT * FROM dbo.user_student\n"
                + "where email = ? and password = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, email);
            st.setString(2, password);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                Student student = new Student();
                student.setId(rs.getInt("id"));
                student.setName(rs.getString("name"));
                student.setEmail(rs.getString("email"));
                student.setPassword(rs.getString("password"));
                return student;
            }
        } catch (SQLException e) {
        }
        return null;
    }
    
    public Student checkStudentExistByEmail(String email, List<Student> list) {
        Student s = new Student();
        for (Student student : list) {
            if (email.equalsIgnoreCase(student.getEmail())) {
                s.setId(student.getId());
                s.setEmail(student.getEmail());
                s.setName(student.getName());
                s.setPassword(student.getPassword());
                return s;
            }
        }
        return null;
    }
    
    public List<Student> listAllExcludeByid(String id) {
        List<Student> students = new ArrayList<>();
        String sql = "SELECT * FROM dbo.user_student\n"
                + "WHERE id != ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Student s = new Student();
                s.setId(rs.getInt("id"));
                s.setName(rs.getString("name"));
                s.setEmail(rs.getString("email"));
                s.setPassword(rs.getString("password"));
                students.add(s);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return students;
    }
}
