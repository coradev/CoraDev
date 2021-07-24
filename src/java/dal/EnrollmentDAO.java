/*
 * Created: 03-23-2021 by truongnq2k.
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
import model.Enrollment;

public class EnrollmentDAO extends DBContext {

    public List<Enrollment> getAll() {
        List<Enrollment> enrollments = new ArrayList<>();
        String sql = "SELECT user_student.name AS StudentName, enrollment.student_id, enrollment.course_id, enrollment.is_paid_subscription, enrollment.id AS enrollment_id, courses.title AS CourseBought, courses.fee AS FeeOfCourse\n"
                + "                FROM     courses INNER JOIN\n"
                + "                                  enrollment ON courses.id = enrollment.course_id INNER JOIN\n"
                + "                                 user_student ON enrollment.student_id = user_student.id";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Enrollment enrollment = new Enrollment();
                enrollment.setStudent_name(rs.getString("StudentName"));
                enrollment.setStudent_id(rs.getInt("student_id"));
                enrollment.setCourse_id(rs.getInt("course_id"));
                enrollment.setIs_paid_subscription(rs.getBoolean("is_paid_subscription"));
                enrollment.setId(rs.getInt("enrollment_id"));
                enrollment.setCourse_bought(rs.getString("CourseBought"));
                enrollment.setFee(rs.getFloat("FeeOfCourse"));
                enrollments.add(enrollment);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return enrollments;
    }

    public void update(int ispaid, int id) {
        String sql = "UPDATE dbo.enrollment SET is_paid_subscription = ? WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, ispaid);
            ps.setInt(2, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public List<Enrollment> getEnrollByStudentId(String id) {
        List<Enrollment> enrollments = new ArrayList<>();
        String sql = "SELECT user_student.name AS StudentName,\n"
                + "       enrollment.student_id,\n"
                + "       enrollment.course_id,\n"
                + "       enrollment.is_paid_subscription,\n"
                + "       enrollment.id AS enrollment_id,\n"
                + "       courses.title AS CourseBought,\n"
                + "       courses.fee AS FeeOfCourse\n"
                + "FROM courses\n"
                + "    INNER JOIN enrollment\n"
                + "        ON courses.id = enrollment.course_id\n"
                + "    INNER JOIN user_student\n"
                + "        ON enrollment.student_id = user_student.id\n"
                + "WHERE student_id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Enrollment e = new Enrollment();
                e.setCourse_id(rs.getInt("course_id"));
                e.setIs_paid_subscription(rs.getBoolean("is_paid_subscription"));
                e.setCourse_bought(rs.getString("CourseBought"));
                e.setFee(rs.getFloat("FeeOfCourse"));
                enrollments.add(e);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return enrollments;
    }


    public static void main(String[] args) {
        EnrollmentDAO edb = new EnrollmentDAO();
        System.out.println(edb.getEnrollByStudentId("1").get(1).getCourse_bought());
    }
}
