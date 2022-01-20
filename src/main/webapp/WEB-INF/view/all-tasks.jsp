<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
</head>
<body>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>


<div <%--class="container"--%>>
    <%-- <h2 style="text-align: center;">All Tasks</h2>--%>
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <a class="navbar-brand" href="#">TodoList</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>

        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav mr-auto">
                <li class="nav-item active">
                    <a class="nav-link" href="/"> Home <span class="sr-only">(current)</span></a>
                </li>

                <li class="nav-item active">
                    <a class="nav-link" href="/todayTask">Today tasks</a>
                </li>
                <li class="nav-item active">
                    <a class="nav-link" href="/addNewTask">Add task</a>
                </li>


                <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle active"
                       id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true"
                       aria-expanded="false">
                        Category
                    </a>
                    <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                        <c:forEach var="category" items="${allCategories}">
                            <c:url var="getCategoryTaskButton" value="/getCategoryTask">
                                <c:param name="idCategory" value="${category.idCategory}"/>
                            </c:url>
                            <button class="dropdown-item" type="button" onclick="window.location.href = '${getCategoryTaskButton}'">
                                <c:out value="${category.categoryName}"> ${category.idCategory} </c:out>
                            </button>
                        </c:forEach>
                    </div>
                </li>
            </ul>
            <form class="form-inline my-2 my-lg-0" name="search" action="/searchTask">
                <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search"
                       class="text-body" name="taskName">
                <button class="btn btn-outline-success my-2 my-sm-0" type="submit" value="Search">Search</button>
            </form>
        </div>
    </nav>
    <%--    <form action="/" modelAttribute="allCategories">
            <h3><span>Categories</span></h3>
            <table>
                     <tr>
                         <th>Categories:</th>
                         <td><form:select path="catego" >
                             <form:option value="NONE"> --SELECT--</form:option>
                             <form:options items="${allCategory}" itemValue="category" itemLabel="cate"></form:options>
                         </form:select>
                         </td>
                     </tr>
                <c:forEach var="category" items="${allCategories}">
                    <tr>
                        <td><c:out value="${category.categoryName}" /></td>
                    </tr>
                </c:forEach>
            </table>
        </form>
            </div>
        <br>
        <br>

        <div>
            <form name="search"  action="/searchTask">
                <input type="text" class="text-body"  name="taskName"/>
                <input  class="btn-outline-info" type="submit" value="Search"/>
            </form>
            <form name="todayTask"  action="/todayTask">
                <input  style="float: right;" class="btn-dark" type="submit" value="Today Tasks"/>
            </form>
        </div>
        --%>
    <br>
    <br>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th>Task</th>
            <th>Importance</th>
            <th>Start date</th>
            <th>Complete date</th>
            <th>State</th>
            <th>Category</th>
            <th>Operations</th>
            <th>Done</th>
        </tr>
        </thead>
        <c:forEach var="tasks" items="${allTasks}">
            <c:url var="updateButton" value="/updateInfo">
                <c:param name="taskId" value="${tasks.id}"/>
            </c:url>
            <c:url var="deleteButton" value="/deleteTask">
                <c:param name="taskId" value="${tasks.id}"/>
            </c:url>
            <c:url var="doneButton" value="/doneTask">
                <c:param name="taskId" value="${tasks.id}"/>
            </c:url>
            <tr>
                <td style="font-size:115%">${tasks.task}</td>
                <td>${tasks.importance}</td>
                <td>${tasks.startDate}</td>
                <td>${tasks.completeDate}</td>
                <td>${tasks.state}</td>
                <td>${tasks.category.categoryName}</td>
                <td>
                    <div>
                        <input type="button" class="btn btn-info" value="Update"
                               onclick="window.location.href = '${updateButton}'"/>

                        <input type="button" class="btn btn-danger" value="Delete"
                               onclick="window.location.href = '${deleteButton}'"/>
                    </div>
                </td>
                <td>
                    <div>
                        <input type="button" class="btn btn-outline-success" value="Done"
                               onclick="window.location.href = '${doneButton}'"/>
                    </div>
                </td>
            </tr>
        </c:forEach>
    </table>

    <%-- <br>
     <div>
         <input type="button" class="btn-success" value="Add task" onclick="window.location.href = 'addNewTask'"/>
     </div>
     <br>
     <br>--%>


</div>
</body>
</html>

