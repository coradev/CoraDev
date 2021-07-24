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
import java.util.Arrays;
import java.util.List;
import model.Chapter;
import model.Course;

public class CourseDAO extends DBContext {

    public void insert(Course c) {
        String sql = "INSERT INTO dbo.courses( admin_id, category_id, title, fee, introduce, purport, cover_image, intro_video)\n"
                + "VALUES( ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, c.getAdmin_id());
            ps.setInt(2, c.getCategory_id());
            ps.setString(3, c.getTitle());
            ps.setFloat(4, c.getFee());
            ps.setString(5, c.getIntroduce());
            ps.setString(6, c.getPurport());
            ps.setString(7, c.getCover_image());
            ps.setString(8, c.getIntro_video());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Course> listAll() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT courses.*, category.name AS category_name\n"
                + "FROM     category INNER JOIN\n"
                + "                  courses ON category.id = courses.category_id";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setAdmin_id(rs.getInt("admin_id"));
                course.setCategory_id(rs.getInt("category_id"));
                course.setTitle(rs.getString("title"));
                course.setFee(rs.getFloat("fee"));
                course.setIntroduce(rs.getString("introduce"));
                course.setPurport(rs.getString("purport"));
                course.setCover_image(rs.getString("cover_image"));
                course.setIntro_video(rs.getString("intro_video"));
                course.setCategory_name(rs.getString("category_name"));
                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return courses;
    }

    public void delete(String id) {
        String sql = "DELETE FROM dbo.courses WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Course findById(String id) {
        String sql = "SELECT * FROM dbo.courses WHERE id  = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setAdmin_id(rs.getInt("admin_id"));
                course.setCategory_id(rs.getInt("category_id"));
                course.setTitle(rs.getString("title"));
                course.setFee(rs.getFloat("fee"));
                course.setIntroduce(rs.getString("introduce"));
                course.setPurport(rs.getString("purport"));
                course.setCover_image(rs.getString("cover_image"));
                course.setIntro_video(rs.getString("intro_video"));

                ChapterDAO chapterdao = new ChapterDAO();
                List<Chapter> chapters = chapterdao.findByCourseId(id);
                course.setChapters(chapters);
                return course;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    public void update(Course c) {
        String sql = "UPDATE dbo.courses "
                + "SET title = ?, fee = ?, introduce = ?, purport = ?, cover_image = ?, intro_video= ?, category_id = ? "
                + "WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getTitle());
            ps.setString(2, String.valueOf(c.getFee()));
            ps.setString(3, c.getIntroduce());
            ps.setString(4, c.getPurport());
            ps.setString(5, c.getCover_image());
            ps.setString(6, c.getIntro_video());
            ps.setString(7, String.valueOf(c.getCategory_id()));
            ps.setString(8, String.valueOf(c.getId()));
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Course> getCourseForHome() {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT TOP 6 * FROM dbo.courses ORDER BY newid()";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setAdmin_id(rs.getInt("admin_id"));
                course.setCategory_id(rs.getInt("category_id"));
                course.setTitle(rs.getString("title"));
                course.setFee(rs.getFloat("fee"));
                course.setIntroduce(rs.getString("introduce"));
                course.setPurport(rs.getString("purport"));
                course.setCover_image(rs.getString("cover_image"));
                course.setIntro_video(rs.getString("intro_video"));
                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return courses;
    }

    //LIST CORSE WITH PAGING
    public int countPage() {
        ArrayList<Course> dummies = new ArrayList<>();
        try {
            String sql = "SELECT COUNT(*) AS TOTAL FROM dbo.courses";
            PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet rs = statement.executeQuery();
            if (rs.next()) {
                int countPage;
                countPage = rs.getInt("TOTAL") / 4;
                if (rs.getInt("TOTAL") % 4 != 0) {
                    countPage++;
                }
                return countPage;
            }
        } catch (SQLException ex) {

        }
        return 0;
    }

    public ArrayList<Course> getCourseByPageNumber(int pageNumber) {
        ArrayList<Course> lc = new ArrayList<>();
        try {
            String sql = "SELECT id , title, introduce, fee, cover_image\n"
                    + "FROM(SELECT id , title, introduce, fee, cover_image ,ROW_NUMBER() OVER (ORDER BY id) AS Seq FROM  dbo.courses) as x\n"
                    + "WHERE Seq BETWEEN ? AND ?";
            PreparedStatement statement = connection.prepareStatement(sql);
            statement.setInt(1, ((pageNumber - 1) * 4) + 1);
            statement.setInt(2, (pageNumber * 4));
            ResultSet rs = statement.executeQuery();
            while (rs.next()) {
                Course c = new Course();
                c.setId(rs.getInt(1));
                c.setTitle(rs.getString(2));
                c.setIntroduce(rs.getString(3));
                c.setFee(rs.getFloat(4));
                c.setCover_image(rs.getString(5));
                lc.add(c);
            }
            return lc;
        } catch (SQLException ex) {

        }
        return null;
    }

    //search course by categoryid
    public List<Course> searchByCategoryId(String listid) {
        List<Course> courses = new ArrayList<>();
        String sql = "SELECT * FROM dbo.courses\n"
                + "WHERE category_id IN(" + listid + ")";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Course course = new Course();
                course.setId(rs.getInt("id"));
                course.setAdmin_id(rs.getInt("admin_id"));
                course.setCategory_id(rs.getInt("category_id"));
                course.setTitle(rs.getString("title"));
                course.setFee(rs.getFloat("fee"));
                course.setIntroduce(rs.getString("introduce"));
                course.setPurport(rs.getString("purport"));
                course.setCover_image(rs.getString("cover_image"));
                course.setIntro_video(rs.getString("intro_video"));
                courses.add(course);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }

        return courses;
    }

    public static void main(String[] args) {
        String listid[] = {"1", "9"};
        List<String> list = Arrays.asList(listid);
        String result = String.join(",", list);

        CourseDAO coursedao = new CourseDAO();
        List<Course> courses = coursedao.searchByCategoryId(result);

        for (Course course : courses) {
            System.out.println(course.getTitle());
        }
    }
}
