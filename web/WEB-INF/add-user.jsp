
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
    </head>
    <body>

        <header>
            <nav class="navbar navbar-dark bg-primary"
                 style="background-color: green">
                <div class="position-relative top-0 start-50 translate-middle-x fs-1">
                    <a href="user" class="navbar-brand fs-1"> List Users</a>
                </div>


            </nav>
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <h1 class="h1">Add New User</h1>
                    <br>
                    <form name="user" method="post">
                         <input type="hidden" name="action" value="insert">

                        <fieldset class="form-group">
                            <label>Email</label> <input type="text"
                                                        value="<c:out value='${user.email}' />" class="form-control border border-primary"
                                                        name="email" required="required" >
                        </fieldset>
                        <fieldset class="form-group">
                            <label>First name</label> <input type="text"
                                                             value="<c:out value='${user.firstname}' />" class="form-control border-primary"
                                                             name="firstname">
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Last Name</label> <input type="text"
                                                            value="<c:out value='${user.lastname}' />" class="form-control border-primary"
                                                            name="lastname">
                        </fieldset>
                        <fieldset class="form-group">
                            <label>Password</label> <input type="text"
                                                           value="<c:out value='${user.password}' />" class="form-control border-primary"
                                                           name="password">
                        </fieldset>
                        <fieldset class="form-group">
                            <label for="typerole">Role</label>
                            <select id="typerole" name="typerole" class="form-control border-primary">
                                <option selected>Select a role...</option>
                                <c:forEach var="role" items="${roles}">
                                    <option>${role.name}</option>
                                </c:forEach>
                            </select>
                        </fieldset>
                                             
                        <br>
                        <button type="submit" class="btn btn-primary btn-lg">Add New User</button>
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
