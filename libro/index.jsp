<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>BD Libro</title>
</head>
<body>

<H1>Base de datos BIBLIOTECA NOMBRE</H1>

<sql:setDataSource var="dbSource" driver="com.mysql.cj.jdbc.Driver"
                   url="jdbc:mysql://localhost:3306/biblioteca_nombre"
                   user="dba" password="123456789.eT"/>
                   
<sql:query dataSource="${dbSource}" var="result">
    SELECT * FROM libros;
</sql:query>

<table border="1">
    <tr>
        <th>id</th>
        <th>titulo</th>
        <th>autor</th>
        <th>paginas</th>
        <th>genero</th>
        <th>fecha</th>
    </tr>
    <c:forEach var="row" items="${result.rows}">
        <tr>
            <td>${row.id}</td>
            <td>${row.titulo}</td>
            <td>${row.autor}</td>
            <td>${row.paginas}</td>
            <td>${row.genero}</td>
            <td>${row.fecha}</td>
        </tr>
    </c:forEach>
</table>

</body>
</html>