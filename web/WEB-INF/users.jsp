<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Users</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    </head>
    <body>
        <div class="container">
            <div class="row">
                <div class="col">        
                    <h1 class="text-center">User Management System</h1>
                    <br><!-- comment -->
                    <form method="post">
                        <input type="submit" name="action" value="Add New User" class="btn btn-primary btn-lg">
                    </form>
                    <br>

                    <table class="table table-striped">
                        <thead>
                            <tr>
                                <th>E-mail</th>
                                <th>First Name</th>
                                <th>Last Name</th>
                                <th>Active</th>
                                <th>Actions</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="user" items="${users}" >
                                <tr>
                                    <td>${user.email}</td>
                                    <td>${user.firstName}</td>
                                    <td>${user.lastName}</td>
                                    <td>${user.active ? "Yes" : "No"}</td>
                                    <td>
                                        <a href="<c:url value="user">
                                               <c:param name="action" value="edit"></c:param>
                                               <c:param name="email" value="${user.email}"></c:param>                                                                                     
                                           </c:url>">Edit</a>
                                        <a href="<c:url value="user">
                                               <c:param name="action" value="delete"></c:param>
                                               <c:param name="email" value="${user.email}"></c:param>
                                           </c:url>">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>                   
                </div>                                            
            </div>
        </div>
        <br>

        <div class="container col-md-10" <c:if test="${email == null}"> hidden </c:if>>


                <form action="user" method="POST">
                    <input type="hidden" name="action" value="update">
                    <h2>Edit User</h2>
                    <table class="table table-striped">
                        <tr><td><label for="email">Email: </label></td><td><input type="text" name="email" value="<%= request.getAttribute("email")%>"  readonly=""></td></tr>
                    <tr><td><label for="editFirstName">First Name: </label></td><td><input type="text" name="editFirstName" value="<%= request.getAttribute("editFirstName")%>"></td></tr>
                    <tr><td><label for="editLastName">Last Name: </label></td><td><input type="text" name="editLastName" value="<%= request.getAttribute("editLastName")%>"></td></tr>
                    <tr><td><label for="editPassword">Password: </label></td><td><input type="text" name="editPassword" value="<%= request.getAttribute("editPassword")%>"></td></tr>
                    <tr><td><label for="editRole"></label></td>
                        <td>
                            <select name="editRole" class="form-select" size="3" aria-label="size 3 select example">
                                
                                    <c:forEach var="role" items="${roles}">
                                    <option>${role.name}</option>
                                    </c:forEach>
                                </select>
                        </td>
                    </tr>
                </table>
                <br>
                <button type="submit"  class="btn btn-primary btn-lg">Update</button>
            </form>
        </div>
    </body>
</html>
