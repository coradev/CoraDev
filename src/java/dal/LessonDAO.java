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
import model.Lesson;

public class LessonDAO extends DBContext {

    public void insert(Lesson l) {
        String sql = "INSERT INTO dbo.lessons VALUES(?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, l.getChapter_id());
            ps.setString(2, l.getTitle());
            ps.setString(3, l.getVideo_link());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Lesson l) {
        String sql = "UPDATE dbo.lessons SET chapter_id = ?, title = ?,video_link= ? WHERE id = ? ";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, l.getChapter_id());
            ps.setString(2, l.getTitle());
            ps.setString(3, l.getVideo_link());
            ps.setInt(4, l.getId());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void delete(String id) {
        String sql = "DELETE FROM dbo.lessons WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Lesson> listAll() {
        List<Lesson> lessons = new ArrayList<>();
        String sql = "SELECT * FROM dbo.lessons";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lesson l = new Lesson();
                l.setId(rs.getInt("id"));
                l.setChapter_id(rs.getInt("chapter_id"));
                l.setTitle(rs.getString("title"));
                l.setVideo_link(rs.getString("video_link"));
                lessons.add(l);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lessons;
    }

    public List<Lesson> findByChapterId(String chapterid) {
        List<Lesson> lessons = new ArrayList<>();
        String sql = "SELECT * FROM dbo.lessons WHERE chapter_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, chapterid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Lesson l = new Lesson();
                l.setId(rs.getInt("id"));
                l.setChapter_id(rs.getInt("chapter_id"));
                l.setTitle(rs.getString("title"));
                l.setVideo_link(rs.getString("video_link"));
                lessons.add(l);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return lessons;
    }

    public Lesson findById(String id) {
        String sql = "SELECT * FROM dbo.lessons WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Lesson l = new Lesson();
                l.setId(rs.getInt("id"));
                l.setChapter_id(rs.getInt("chapter_id"));
                l.setTitle(rs.getString("title"));
                l.setVideo_link(rs.getString("video_link"));
                return l;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }
    
    public static void main(String[] args) {
        LessonDAO ldb = new LessonDAO();
        Lesson l = new Lesson();
        l.setChapter_id(9);
        l.setTitle("Lesson 5 e 1");
        l.setVideo_link("https://www.youtube.com/watch?v=AlOrzDuO60Y");
        ldb.insert(l);
    }
}
