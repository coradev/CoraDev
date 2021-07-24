/*
 * Created: 03-22-2021 by truongnq2k.
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
import model.Comment;

public class CommentDAO extends DBContext {

    public void insert(Comment c) {
        String sql = "INSERT INTO dbo.comments VALUES(?,?,?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, String.valueOf(c.getLesson_id()));
            ps.setString(2, String.valueOf(c.getStudent_id()));
            ps.setString(3, c.getPurport());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Comment> listAll(String lessonid) {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT comments.*, user_student.name AS student_name\n"
                + "FROM     comments INNER JOIN\n"
                + "                  user_student ON comments.student_id = user_student.id\n"
                + "WHERE lesson_id = ? \n"
                + "ORDER BY comments.id DESC";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, lessonid);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Comment comment = new Comment();
                comment.setId(rs.getInt("id"));
                comment.setLesson_id(rs.getInt("lesson_id"));
                comment.setStudent_id(rs.getInt("student_id"));
                comment.setPurport(rs.getString("purport"));
                comment.setStudent_name(rs.getString("student_name"));
                comments.add(comment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return comments;
    }
}
