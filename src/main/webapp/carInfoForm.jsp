<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="pl.altkom.web.CarBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj auto</title>
</head>
<body>

<c:set var="makes" value="Fiat,Volkswagen,Ford,Volvo,Honda,Citroen"/>

<jsp:useBean id="autko" class="pl.altkom.web.CarBean" scope="session">
    <% autko.setType(""); %>
    <% autko.setYear(2019); %>
<%--    <% autko.setMake(makes.get(0)); %>--%>
    <% autko.setCapacity("1"); %>
    <% autko.setDistance("0"); %>
</jsp:useBean>

<% CarBean car = (CarBean) session.getAttribute("autko"); %>

<form action="checkInfoForm.jsp" method="post">
    Marka
    <select name="make">
        <c:forEach var="m" items="${makes}">
            <c:choose>
                <c:when test="${m eq autko.make}">
                    <option selected="selected"> <c:out value="${m}"/> </option>
                </c:when>
                <c:otherwise>
                    <option> <c:out value="${m}"/> </option>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </select>
    <br>
    Typ
    <input type="text" name="type" value="<c:out value='${autko.type}'/>"/> <br>
    Rok produkcji
    <select name="year">
        <%for (int i = 2019; i >= 1980; i--) { %>
            <% if (car.getYear() == i) { %>
                <option selected="selected"><%=i%></option>
            <% } else { %>
                <option><%=i%></option>
            <% } %>
        <% } %>
    </select><br>
    Przebieg
    <select name="distance">
        <%for (int i = 0; i <= 1000000; i+= 100000) { %>
            <% if (String.valueOf(i).equals(car.getDistance())) { %>
                <option selected="selected"><%=i%></option>
            <% } else { %>
                <option><%=i%></option>
            <% } %>
        <% } %>
    </select><br>
    Pojemność
    <select name="capacity">
        <%for (int i = 1; i <= 9; i++) { %>
            <% if (String.valueOf(i).equals(car.getCapacity())) { %>
            <option selected="selected"><%=i%></option>
            <% } else { %>
            <option><%=i%></option>
            <% } %>
        <% } %>
    </select>
    <input type="submit" value="Wyślij">
</form>

<%@include file="footer.html"%>
</body>
</html>
