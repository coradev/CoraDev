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
import model.Category;
import model.CountCategory;

public class CategoryDAO extends DBContext {

    public void insert(Category c) {
        String sql = "INSERT INTO dbo.category VALUES(?)";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, c.getName());
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void update(Category c) {
        String sql = "UPDATE dbo.category SET name = ? WHERE id = ?";
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
        String sql = "DELETE FROM dbo.category WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public Category findById(String id) {
        String sql = "SELECT * FROM dbo.category WHERE id = ?";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                return c;
            }
        } catch (SQLException e) {
        }
        return null;
    }

    public List<Category> listAll() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM dbo.category";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Category c = new Category();
                c.setId(rs.getInt("id"));
                c.setName(rs.getString("name"));
                categories.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return categories;
    }

    //Trong moi category co bao nhieu khoa hoc
    public List<CountCategory> listCateChart() {
        List<CountCategory> countCates = new ArrayList<>();
        String sql = "SELECT COUNT(cacount.name) AS CateNum, cacount.name AS CateName\n"
                + "FROM\n"
                + "(\n"
                + "    SELECT DISTINCT\n"
                + "           category.id,\n"
                + "           category.name,\n"
                + "           courses.title\n"
                + "    FROM category\n"
                + "        INNER JOIN courses\n"
                + "            ON category.id = courses.category_id\n"
                + ") AS cacount\n"
                + "GROUP BY cacount.name;";
        try {
            PreparedStatement ps = connection.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                CountCategory c = new CountCategory();
                c.setCatename(rs.getString("CateName"));
                c.setCatenum(rs.getInt("CateNum"));
                countCates.add(c);
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return countCates;
    }

}
