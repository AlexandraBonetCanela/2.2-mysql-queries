# NOTES
# We consider precio as euro currency

USE tienda;

    SELECT nombre FROM producto;

    SELECT nombre, precio FROM producto;

    SELECT * FROM producto;

    SELECT  nombre, precio AS precio_euros, ROUND(precio * 1.08, 2) AS precio_dollars FROM producto;

    SELECT nombre AS 'nombre de producto', precio AS euros, ROUND(precio * 1.08, 2) AS dollars FROM producto;

    SELECT UPPER(nombre), precio FROM producto;

    SELECT LOWER(nombre), precio FROM producto;

    SELECT nombre, CONCAT(UPPER(SUBSTR(nombre, 1, 2)), LOWER(SUBSTR(nombre, 3, LENGTH(nombre)))) FROM fabricante;

    SELECT nombre, ROUND(precio, 0) FROM producto;

    SELECT nombre, TRUNCATE(precio, 0) FROM producto;

    SELECT codigo_fabricante FROM producto;

    SELECT DISTINCT(codigo_fabricante) FROM producto;

    SELECT nombre FROM fabricante ORDER BY nombre ASC ;

    SELECT nombre FROM fabricante ORDER BY nombre DESC;

    SELECT nombre FROM producto ORDER BY nombre ASC, precio DESC;

    SELECT * FROM fabricante LIMIT 5;

    SELECT * FROM fabricante LIMIT 2 OFFSET 3;

    SELECT nombre, precio FROM producto ORDER BY precio ASC LIMIT 1;

    SELECT nombre, precio FROM producto ORDER BY precio DESC LIMIT 1;

    SELECT nombre FROM producto WHERE codigo_fabricante = 2;

    SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

    SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY f.nombre ASC;

    SELECT p.codigo AS codigo_producto, p.nombre AS nombre_producto, p.codigo_fabricante AS codigo_fabricante, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo;

    SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio ASC LIMIT 1;

    SELECT p.nombre AS nombre_producto, p.precio, f.nombre AS nombre_fabricante FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo ORDER BY p.precio DESC LIMIT 1;

    SELECT p.*, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Lenovo';

    SELECT p.*, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Crucial' AND p.precio > 200;

    SELECT p.*, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre = 'Asus' OR f.nombre = 'Hewlett-Packardy' OR f.nombre = 'Seagate';

    SELECT p.*, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE  f.nombre IN ('Asus', 'Hewlett-Packardy', 'Seagate');

    SELECT p.nombre, p.precio, f.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante WHERE RIGHT(f.nombre,1) = 'e';

    SELECT p.nombre, p.precio, f.nombre FROM producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE f.nombre like '%w%';

    SELECT p.nombre, p.precio, f.nombre FROM  producto p INNER JOIN fabricante f ON p.codigo_fabricante = f.codigo WHERE p.precio >= 180 ORDER BY p.precio DESC, p.nombre ASC;

    SELECT f.* FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante GROUP BY f.codigo;

    SELECT * FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante;

    SELECT f.* FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE p.codigo IS NULL;

    SELECT p.* FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo';

    SELECT * FROM producto WHERE precio = (SELECT MAX(p.precio) FROM fabricante f LEFT JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo');

    SELECT p.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo' ORDER BY p.precio DESC LIMIT 1;

    SELECT p.nombre FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Hewlett-Packard' ORDER BY p.precio ASC LIMIT 1;

    SELECT * FROM producto WHERE precio >= (SELECT MAX(p.precio) FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Lenovo');

    SELECT * FROM producto WHERE precio > (SELECT AVG(p.precio) FROM fabricante f INNER JOIN producto p ON f.codigo = p.codigo_fabricante WHERE f.nombre = 'Asus');