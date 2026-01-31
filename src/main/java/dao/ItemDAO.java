package dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ItemDAO {

    // ================== INSERT ==================
    public static void insertItem(String name, String category, double price) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(
                         "INSERT INTO item(name, category, price) VALUES (?, ?, ?)")) {

            ps.setString(1, name);
            ps.setString(2, category);
            ps.setDouble(3, price);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================== SELECT (ALL ITEMS) ==================
    public static List<String[]> getAllItems() {
        List<String[]> list = new ArrayList<>();

        try (Connection con = DBConnection.getConnection();
             Statement st = con.createStatement();
             ResultSet rs = st.executeQuery("SELECT * FROM item")) {

            while (rs.next()) {
                list.add(new String[]{
                        rs.getString("id"),
                        rs.getString("name"),
                        rs.getString("category"),
                        rs.getString("price")
                });
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return list;
    }

    // ================== SELECT FOR TestCRUD ==================
    public static void selectItems() {
        getAllItems();
    }

    // ================== UPDATE ==================
    public static void updateItem(int id, String name, String category, double price) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(
                         "UPDATE item SET name=?, category=?, price=? WHERE id=?")) {

            ps.setString(1, name);
            ps.setString(2, category);
            ps.setDouble(3, price);
            ps.setInt(4, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    // ================== DELETE ==================
    public static void deleteItem(int id) {
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps =
                     con.prepareStatement(
                         "DELETE FROM item WHERE id=?")) {

            ps.setInt(1, id);
            ps.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
