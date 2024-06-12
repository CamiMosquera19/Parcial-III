# Parcial-III
Parcial Final

1. Se crea la BASE DE DATOS
   create database biblioteca_nombre;

   use biblioteca_nombre;

  CREATE TABLE Libros (
    id INT AUTO_INCREMENT PRIMARY KEY,
    titulo VARCHAR(255) NOT NULL,
    autor VARCHAR(255) NOT NULL,
    paginas int NOT NULL,
    genero VARCHAR (225) NOT NULL,
    fecha DATE
);

-- Se insertan datos -- 
INSERT INTO Libros (id, titulo, autor, paginas, genero, fecha) VALUES
('001', 'Cien años de soledad', 'Gabriel Garcia Marquez', 375, 'Drama', "1920-04-19"),
('002', 'Los siete maridos de Evelyn Hugo', 'Taylor Jenkins Reid', 362, 'Drama', "2020-12-15");

-- Se crea usuario y se le dan permisos -- 
CREATE USER IF NOT EXISTS 'dba'@'localhost' IDENTIFIED BY '123456789.eT';
GRANT ALL PRIVILEGES ON * . * TO 'dba'@'localhost'  WITH GRANT OPTION;
FLUSH PRIVILEGES;

![image](https://github.com/CamiMosquera19/Parcial-III/assets/162646080/6e5f0164-1a8e-438d-aa36-0ece25a50e5f)


2. Se crea el Proyecto en Eclipse
   Se crea un index

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

![image](https://github.com/CamiMosquera19/Parcial-III/assets/162646080/1329a0d8-0617-43b0-8510-ddcb8ea782e0)


3. Se crea el EJB llamado Libro

package ejbs;

import java.sql.Date;

import jakarta.ejb.LocalBean;
import jakarta.ejb.Stateless;

@Stateless
@LocalBean
public class Libro implements LibroRemote {
	public int id, paginas;
	public String titulo, autor, genero;
	public Date fecha;
    /**
     * Default constructor. 
     */
    public Libro() {
        // TODO Auto-generated constructor stub
    }
    
    public interface LibroRemoto {
    	void setLibro(int id, String titulo, String autor, int paginas, String genero, Date fecha);
    	int tiempoPrestamo();
    	double timepoLectura();
    	}
    
    public void setId(int id) {this.id =id;}
    public int getId() {return this.id;}
}

4. Se agrega en el index.jsp la siguente linea

//<sql:update dataSource="${dbSource}">
    INSERT INTO Libros (id, titulo, autor, paginas, genero, fecha) VALUES ('003', 'A través de mi ventana', 'Ni idea', 423, 'Drama, Romance', "2021-03-21");
</sql:update>

![image](https://github.com/CamiMosquera19/Parcial-III/assets/162646080/ba32681d-6610-4379-99d1-4872e508ed37)


5. 

6. 
