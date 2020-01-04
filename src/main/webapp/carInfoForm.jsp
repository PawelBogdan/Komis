<%@ page import="java.util.List" %>
<%@ page import="java.util.Arrays" %>
<%@ page import="pl.altkom.web.CarBean" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jstl/fmt" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dodaj auto</title>
</head>
<body>

<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate var="currentYear" value="${now}" pattern="yyyy" />

<c:set var="makes" value="Fiat,Volkswagen,Ford,Volvo,Honda,Citroen"/>

<jsp:useBean id="autko" class="pl.altkom.web.CarBean" scope="session"/>

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
        <c:forEach var="i" begin="0" end="49">
            <option
                    <c:if test="${currentYear - i == autko.year}">
                        selected="selected"
                    </c:if>
            >
                <c:out value="${currentYear - i}"/></option>
<%--            <c:choose>--%>
<%--                <c:when test="${currentYear - i == autko.year}">--%>
<%--                    <option selected="selected"><c:out value="${currentYear - i}"/></option>--%>
<%--                </c:when>--%>
<%--                <c:otherwise>--%>
<%--                    <option><c:out value="${currentYear - i}"/></option>--%>
<%--                </c:otherwise>--%>
<%--            </c:choose>--%>
        </c:forEach>
<%--        <%for (int i = 2019; i >= 1980; i--) { %>--%>
<%--            <% if (car.getYear() == i) { %>--%>
<%--                <option selected="selected"><%=i%></option>--%>
<%--            <% } else { %>--%>
<%--                <option><%=i%></option>--%>
<%--            <% } %>--%>
<%--        <% } %>--%>
    </select><br>
    Przebieg
    <select name="distance">
        <c:forEach var="i" begin="0" end="1000000" step="100000">
            <option <c:if test="${i == autko.distance}">
                selected="selected"
            </c:if>><c:out value="${i}"/></option>
        </c:forEach>
    </select><br>
    Pojemność
    <select name="capacity">
        <c:forEach var="i" begin="1" end="7">
            <option
                <c:if test="${i == autko.capacity}">
                    selected="selected"
                </c:if>
            >
            <c:out value="${i}"/></option>
        </c:forEach>
    </select>
    <input type="submit" value="Wyślij">
</form>

<%@include file="footer.html"%>
</body>
</html>
