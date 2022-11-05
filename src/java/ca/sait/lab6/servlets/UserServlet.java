package ca.sait.lab6.servlets;

import ca.sait.lab6.models.Role;
import ca.sait.lab6.models.User;
import ca.sait.lab6.services.RoleService;
import ca.sait.lab6.services.UserService;
import java.io.IOException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author SixtoDev
 */
public class UserServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

   
        try {
            UserService service = new UserService();
            RoleService roleservice = new RoleService();
            List<Role> roles;
            List<User> users;
            String editFirstName = "";
            String editLastName = "";
            String editPassword = "";
            users = service.getAll();
            roles = roleservice.getAll();
            request.setAttribute("users", users);
            request.setAttribute("roles", roles);
            String action = request.getParameter("action");

            if (action != null && action.equals("delete")) {
                String email = request.getParameter("email");
                try {
                    service.delete(email);
                } catch (Exception ex) {
                    Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
                }
                response.sendRedirect("user");
            }
             if (action != null && action.equals("edit")) {
                String userEmail = request.getParameter("email");
                for (int i = 0; i < users.size(); i++) {
                    String emailToEdit = users.get(i).getEmail();
                    if (emailToEdit.equals(userEmail)) {
                        editFirstName = users.get(i).getFirstName();
                        editLastName = users.get(i).getLastName();
                        editPassword = users.get(i).getPassword();
                    }
                }
                request.setAttribute("email", userEmail);
                request.setAttribute("editFirstName", editFirstName);
                request.setAttribute("editLastName", editLastName);
                request.setAttribute("editPassword", editPassword);
                
            }
            
            this.getServletContext().getRequestDispatcher("/WEB-INF/users.jsp").forward(request, response);
        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
            UserService service = new UserService();
            RoleService roleservice = new RoleService();
            List<Role> roles;
            roles = roleservice.getAll();

            String action = request.getParameter("action");

            if (action.equals("Add New User")) {
                request.setAttribute("roles", roles);
                this.getServletContext().getRequestDispatcher("/WEB-INF/add-user.jsp").forward(request, response);
            }

             if (action.equals("insert")) {
                boolean active = true;
                String userEmail = request.getParameter("email");
                String inputFirstName = request.getParameter("firstname");
                String inputLastName = request.getParameter("lastname");
                String inputPassword = request.getParameter("password");
                String inputRole = request.getParameter("typerole");

                Role role = new Role();
                for (int i = 0; i < roles.size(); i++) {
                    if (roles.get(i).getName().equals(inputRole)) {
                        role = roles.get(i);
                    }
                }

                service.insert(userEmail, active, inputFirstName, inputLastName, inputPassword, role);
                response.sendRedirect("user");
            }
            else if (action.equals("update")) {
                boolean active = true;
                String upEmail = request.getParameter("email");
                String upFirstName = request.getParameter("editFirstName");
                String upLastName = request.getParameter("editLastName");
                String upPassword = request.getParameter("editPassword");
                String upRole = request.getParameter("editRole");

                Role editRole = new Role();
                for (int i = 0; i < roles.size(); i++) {
                    if (roles.get(i).getName().equals(upRole)) {
                        editRole = roles.get(i);
                    }
                }

                service.update(upEmail, active, upFirstName, upLastName, upPassword, editRole);
                response.sendRedirect("user");
            }

        } catch (Exception ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
