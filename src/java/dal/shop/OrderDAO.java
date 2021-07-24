/*
 * Created: 03-22-2021 by truongnq2k.
 *
 * Github: https://github.com/truongnq2k
 * Facebook: https://www.facebook.com/truongnq2k
 * Zalo: https://zalo.me/0352918986
 *
 */
package dal.shop;

import dal.DBContext;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.Student;
import model.shop.Cart;
import model.shop.Item;

public class OrderDAO extends DBContext {

    public void addOrder(Student student, Cart cart) {
        try {
            //- student_id-- totalmoney
            String sql = "INSERT INTO dbo.orders VALUES(?, ?)";
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setInt(1, student.getId());
            ps.setFloat(2, cart.getTotalMoney());
            ps.executeUpdate();
            //get id of new order just add
            String sql1 = "SELECT TOP 1 id FROM dbo.orders ORDER BY id DESC";
            PreparedStatement ps1 = connection.prepareStatement(sql1);
            ResultSet rs = ps1.executeQuery();
            //add to orderdetail table
            if (rs.next()) {
                int orderid = rs.getInt("id");
                for (Item i : cart.getItems()) {
                    //order_id -- course_id -- price
                    String sql2 = "INSERT INTO dbo.order_detail VALUES(?, ?, ?, GETDATE())";
                    PreparedStatement ps2 = connection.prepareStatement(sql2);
                    ps2.setInt(1, orderid);
                    ps2.setInt(2, i.getCourse().getId());
                    ps2.setFloat(3, i.getPrice());
                    ps2.executeUpdate();

                    //add to enrollment table
                    String sql3 = "INSERT INTO dbo.enrollment VALUES(?, ?, ?)";
                    PreparedStatement ps3 = connection.prepareStatement(sql3);
                    ps3.setInt(1, student.getId());
                    ps3.setInt(2, i.getCourse().getId());
                    ps3.setBoolean(3, false);
                    ps3.executeUpdate();
                }
            }

        } catch (SQLException e) {
            System.out.println(e);
        }
    }
}


//id = 9
