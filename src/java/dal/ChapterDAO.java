/*
 * Created: 03-20-2021 by truongnq2k.
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
import model.Chapter;
import model.Lesson;

public class ChapterDAO extends DBContext {
    
    public void insert(Chapter c) {
        String sql = "INSERT INTO dbo.chapters VALUES(?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, String.valueOf(c.getCourse_id()));
            ps.setString(2, c.getName());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void update(Chapter c) {
        String sql = "UPDATE dbo.chapters SET name = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.setInt(2, c.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public void delete(String id) {
        String sql = "DELETE FROM dbo.chapters WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }
    
    public List<Chapter> listAll() {
        List<Chapter> chapters = new ArrayList<>();
        String sql = "SELECT * FROM dbo.chapters";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setId(rs.getInt("id"));
                chapter.setCourse_id(rs.getInt("course_id"));
                chapter.setName(rs.getString("name"));
                chapters.add(chapter);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return chapters;
    }
    
    public List<Chapter> findByCourseId(String courseid) {
        List<Chapter> chapters = new ArrayList<>();
        String sql = "SELECT * FROM dbo.chapters WHERE course_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, courseid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setId(rs.getInt("id"));
                chapter.setCourse_id(rs.getInt("course_id"));
                chapter.setName(rs.getString("name"));
                LessonDAO lessondao = new LessonDAO();
                List<Lesson> lessons = lessondao.findByChapterId(String.valueOf(chapter.getId()));
                chapter.setLessons(lessons);
                chapters.add(chapter);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return chapters;
    }
    
    public Chapter findById(String id) {
        String sql = "SELECT * FROM dbo.chapters WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Chapter chapter = new Chapter();
                chapter.setId(rs.getInt("id"));
                chapter.setCourse_id(rs.getInt("course_id"));
                chapter.setName(rs.getString("name"));
                return chapter;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
}
