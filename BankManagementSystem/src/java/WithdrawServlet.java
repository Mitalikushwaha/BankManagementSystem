import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class WithdrawServlet extends HttpServlet {

    protected void doPost(HttpServletRequest req, HttpServletResponse res)
            throws ServletException, IOException {

        int amount = Integer.parseInt(req.getParameter("amount"));

        try {

            HttpSession session = req.getSession(false);

            if (session == null || session.getAttribute("user") == null) {
                res.sendRedirect("login.jsp");
                return;
            }

            String email = (String) session.getAttribute("user");

            Connection con = DBConnection.getConnection();

            // Step 1: Get current balance
            PreparedStatement ps1 = con.prepareStatement(
                "SELECT balance FROM users WHERE email=?"
            );

            ps1.setString(1, email);

            ResultSet rs = ps1.executeQuery();

            if (rs.next()) {

                double currentBalance = rs.getDouble("balance");

                // Step 2: Check sufficient balance
                if (amount > currentBalance) {
                    res.getWriter().println("<h3 style='color:red;'>Insufficient Balance</h3>");
                    res.getWriter().println("<a href='dashboard.jsp'>Go Back</a>");
                    return;
                }

                double newBalance = currentBalance - amount;

                // Step 3: Update balance
                PreparedStatement ps2 = con.prepareStatement(
                    "UPDATE users SET balance=? WHERE email=?"
                );

                ps2.setDouble(1, newBalance);
                ps2.setString(2, email);

                int i = ps2.executeUpdate();

                if (i > 0) {
                    res.getWriter().println("<h3>Withdrawal Successful!</h3>");
                    res.getWriter().println("<a href='dashboard.jsp'>Go Back</a>");
                } else {
                    res.getWriter().println("Withdrawal Failed");
                }

            }

        } catch (Exception e) {
            e.printStackTrace();
            res.getWriter().println("Error: " + e.getMessage());
        }
    }
}
