<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<jsp:useBean id="autko" class="pl.altkom.web.CarBean" scope="session"/>
<%--<jsp:setProperty name="autko" property="make"/>--%>
<%--<jsp:setProperty name="autko" property="type"/>--%>
<%--<jsp:setProperty name="autko" property="year"/>--%>
<%--<jsp:setProperty name="autko" property="distance"/>--%>
<%--<jsp:setProperty name="autko" property="capacity"/>--%>

<jsp:setProperty name="autko" property="*" />

<table>
    <tr>
        <td>Marka</td>
        <td><c:out value="${autko.make}" /></td>
    </tr>
    <tr>
        <td>Typ</td>
        <td><jsp:getProperty name="autko" property="type"/></td>
    </tr>
    <tr>
        <td>Rok produkcji</td>
        <td><c:out value="${autko.year}"/></td>
    </tr>
    <tr>
        <td>Przebieg</td>
        <td><c:out value="${autko.distance}"/></td>
    </tr>
    <tr>
        <td>Pojemność</td>
        <td><c:out value="${autko.capacity}"/></td>
    </tr>
</table>
<form action="carInfoForm.jsp">
    <input type="submit" value="Edytuj">
</form>
<form action="add_car_info">
    <input type="submit" value="Zapisz samochód">
</form>

<%@include file="footer.html"%>
</body>
</html>
