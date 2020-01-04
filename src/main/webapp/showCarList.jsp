<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jstl/sql" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<sql:setDataSource dataSource="jdbc:komis" var="db"/>

<sql:query var="tb" dataSource="${db}">
    SELECT * FROM pojazd
</sql:query>
<table>
    <tr>
        <th>Marka</th>
        <th>Typ</th>
        <th>Rok</th>
        <th>Przebieg</th>
        <th>Pojemnosc</th>
        <th>Edytuj</th>
    </tr>
<c:forEach var="item" items="${tb.rows}">
    <tr>
        <td><c:out value="${item.marka}"/></td>
        <td><c:out value="${item.typ}"/></td>
        <td><c:out value="${item.rok}"/></td>
        <td><c:out value="${item.przebieg}"/></td>
        <td><c:out value="${item.pojemnosc}"/></td>
        <td><form><input type="submit" value="Edytuj"></form></td>
    </tr>
</c:forEach>
</table>
</body>
</html>
