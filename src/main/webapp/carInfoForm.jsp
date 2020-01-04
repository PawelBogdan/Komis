<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="pl.altkom.web.CarBean" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj auto</title>
</head>
<body>

<%!
    List<String> makes = Arrays.asList("Fiat", "Volkswagen",
            "Ford", "Volvo", "Honda", "Citroen");
%>

<jsp:useBean id="autko" class="pl.altkom.web.CarBean" scope="session">
    <% autko.setType(""); %>
    <% autko.setYear(2019); %>
    <% autko.setMake(makes.get(0)); %>
    <% autko.setCapacity("1"); %>
    <% autko.setDistance("0"); %>
</jsp:useBean>

<% CarBean car = (CarBean) session.getAttribute("autko"); %>

<form action="checkInfoForm.jsp" method="post">
    Marka
    <select name="make">
        <% for (String m : makes) { %>
            <% if (m.equals(car.getMake())) {%>
                <option selected="selected"><%=m%></option>
            <% } else { %>
                <option><%=m%></option>
            <% } %>
        <% } %>
    </select>
    <br>
    Typ
    <input type="text" name="type" value="<jsp:getProperty name="autko" property="type"/>"> <br>
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
