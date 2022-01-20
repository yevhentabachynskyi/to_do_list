<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
<head>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/css/bootstrap.min.css"
          integrity="sha384-B0vP5xmATw1+K9KRQjQERJvTumQW0nPEzvF6L/Z6nronJ3oUOFUFpCjEUQouq2+l" crossorigin="anonymous">
    <!-- Bootstrap CSS -->
    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/5.0.0-alpha1/css/bootstrap.min.css" integrity="sha384-r4NyP46KrjDleawBgD5tp8Y7UzmLA05oM1iAEQ17CSuDqnUK2+k9luXQOfXJCJ4I" crossorigin="anonymous"> -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.6.0/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- google fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
</head>
<body>
<%--<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>--%>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-Piv4xVNRyMGpqkS2by6br4gNJ7DXjqk09RmUpJ8jgGtD7zP9yug3goQfGII0yAns"
        crossorigin="anonymous"></script>
<script src="webjars/bootstrap/4.6.0/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.22.2/moment.min.js"></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/js/tempusdominus-bootstrap-4.min.js"></script>
<link rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/tempusdominus-bootstrap-4/5.0.1/css/tempusdominus-bootstrap-4.min.css"/>
<script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.11.2/js/all.js"
        integrity="sha256-2JRzNxMJiS0aHOJjG+liqsEOuBb6++9cY4dSOyiijX4=" crossorigin="anonymous"></script>


<div class="container">
    <h2>Task info</h2>
    <br>
    <form:form action="saveTask" modelAttribute="taskToDo">

        <form:hidden path="id"/>
<%--
          <div class="form-group">
              <label for="taskName">Task</label>
              <form:input path="task" class="form-control" value="${taskToDo.task}" type="text" size="100" id="taskName" required="Set task"/>
          </div>--%>
    <div class="form-group">
        <textarea class="form-control" id="taskName" name="task"  placeholder="Task... " rows="2" required>${taskToDo.task}</textarea>
    </div>

        <%--     Importance
         <div class="dropdown">
             <form:select path="importance" type="boolean">
                 <form:option value="low" label="Low"/>
                 <form:option value="middle" label="Middle"/>
                 <form:option value="high" label="High"/>
             </form:select>
         </div>--%>
    <div class="row">
        <div class="col-md-4">
            <div class="input-group">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="importance">Importance</label>
                </div>
                <select class="custom-select" id="importance" name="importance" required>
                    <option selected disabled>${taskToDo.importance}</option>
                    <option value="low">low</option>
                    <option value="middle">middle</option>
                    <option value="high">high</option>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="input-group">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="category"> Category </label>
                </div>
                <select class="custom-select" name="category.idCategory" id="category" value="${taskToDo.categoryName}" required>
                    <option selected disabled>${taskToDo.categoryName}</option>
                    <c:forEach var="categories" items="${allCategories}">
                        <option value="${categories.idCategory}">${categories.categoryName}</option>
                    </c:forEach>
                </select>
            </div>
        </div>
        <div class="col-md-4">
            <div class="input-group">
                <div class="input-group-prepend">
                    <label class="input-group-text" for="state">State</label>
                </div>
                <select class="custom-select" id="state" name="state" required>
                    <option value="false" selected>Idle</option>
                    <option value="true">Done</option>
                </select>
            </div>
        </div>
    </div>
    <br>
        <%--
                   <div>
                       <fmt:parseDate value="${taskToDo.startDate}" pattern="yyyy-MM-dd HH:mm:ss"
                                      var="parsedStartDate" type="date"/>
                       <fmt:formatDate value="${parsedStartDate}" var="startDate"
                                       type="both" dateStyle="short" timeStyle="short"/>
                       <p class="alert-info">Start date: ${startDate}</p>
                       <form:input path="startDate" type="datetime-local" required="Set start date"/>
                   </div>
                   <br><br>
                   <div class="form-group">
                       <fmt:parseDate value="${taskToDo.completeDate}" pattern="yyyy-MM-dd HH:mm:ss"
                                      var="parsedCompleteDate" type="date"/>
                       <fmt:formatDate value="${parsedCompleteDate}" var="completeDate"
                                       type="both" dateStyle="short" timeStyle="short"/>
                       <p class="alert-success"> Complete date: ${completeDate}</p>
                       <form:input path="completeDate" type="datetime-local" required="Set finish date"/>
                   </div>
                   <br><br>--%>

    <div class="row">
        <div class="col-md-6">
            <div class="form-group">
                <div class="input-group date" id="datetimepicker1" data-target-input="nearest"
                     data-date-format="YYYY-MM-DD HH:mm">
                    <input type="text" name="startDate" class="form-control datetimepicker-input" value="${taskToDo.startDate}"
                           data-target="#datetimepicker1" required/>
                    <span class="input-group-append" data-target="#datetimepicker1"
                          data-toggle="datetimepicker">
                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                        </span>
                </div>
            </div>
        </div>
        <div class="col-md-6" align="right">
            <div class="form-group">
                <div class="input-group date" id="datetimepicker2" data-target-input="nearest"
                     data-date-format="YYYY-MM-DD HH:mm">
                    <input type="text" name="completeDate" class="form-control datetimepicker-input" value="${taskToDo.completeDate}"
                           data-target="#datetimepicker2" required/>
                    <span class="input-group-append" data-target="#datetimepicker2"
                          data-toggle="datetimepicker">
                            <span class="input-group-text"><i class="fa fa-calendar"></i></span>
                        </span>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        $(function () {
            $('#datetimepicker1').datetimepicker()({
            });
            $('#datetimepicker2').datetimepicker()({
                useCurrent: false
            });

          /*  $("#datetimepicker1").on("dp.change", function (e) {
                $('#datetimepicker2').data("DateTimePicker").minDate(e.date);
            });
            $("#datetimepicker1").on("dp.change", function (e) {
                $('#datetimepicker2').data("DateTimePicker").maxDate(e.date);
            });*/
        });
    </script>

        <%--  State
          <form:select path="state" type="boolean">
              <form:option value="true" label="Done"/>
              <form:option value="false" label="Idle"/>
          </form:select>--%>


            <%--
                    Category
                    <form:select path="category.idCategory" type="number">
                        <form:option value="1" label="Home"/>
                        <form:option value="2" label="Work"/>
                        <form:option value="3" label="Sport"/>
                        <form:option value="4" label="Vacation"/>
                        <form:option value="5" label="Study"/>
                        <form:option value="6" label="Shopping"/>
                        <form:option value="7" label="Other"/>
                    </form:select>
                    <br><br>--%>
        <div align="right">
            <input class="btn btn-primary" type="submit" value="OK">
        </div>
        </form:form>
    </div>
</body>
</html>
