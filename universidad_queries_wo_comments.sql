# 7 not sure
# 10 needs to be done

USE universidad;

    SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' ORDER BY apellido1 ASC, apellido2 ASC, nombre ASC;

    SELECT apellido1, apellido2, nombre FROM persona WHERE tipo = 'alumno' AND telefono IS NULL;

    SELECT * FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';

    SELECT * FROM persona WHERE tipo = 'profesor' AND telefono IS NULL AND RIGHT(nif, 1) = 'K';

    SELECT * FROM asignatura WHERE id_grado = 7 AND curso = 3 AND cuatrimestre = 1;

    SELECT p.apellido1, p.apellido2, p.nombre, d.nombre AS nombre_departamento FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' GROUP BY p.apellido1, p.apellido2, p.nombre, d.nombre ORDER BY p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

    SELECT a.nombre, ce.anyo_inicio, ce.anyo_fin FROM persona p INNER JOIN alumno_se_matricula_asignatura asma ON p.id = asma.id_alumno INNER JOIN asignatura a ON asma.id_asignatura = a.id INNER JOIN curso_escolar ce ON asma.id_curso_escolar = ce.id WHERE p.tipo = 'alumno' AND p.nif = '26902806M';

    SELECT DISTINCT(d.nombre) FROM grado g INNER JOIN asignatura a ON g.id = a.id_grado INNER JOIN profesor p ON a.id_profesor = p.id_profesor INNER JOIN departamento d ON p.id_departamento = d.id WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)';

    SELECT p.apellido1, p.apellido2, p.nombre FROM curso_escolar ce INNER JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar INNER JOIN persona p ON asma.id_alumno = p.id WHERE ce.anyo_inicio = '2018' AND ce.anyo_fin = '2019' GROUP BY p.apellido1, p.apellido2, p.nombre;

    SELECT d.nombre as nombre_departamento, p.apellido1, p.apellido2, p.nombre FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN departamento d ON pr.id_departamento = d.id WHERE p.tipo = 'profesor' ORDER BY d.nombre ASC, p.apellido1 ASC, p.apellido2 ASC, p.nombre ASC;

    SELECT p.* FROM persona p LEFT JOIN profesor pr ON p.id = pr.id_profesor WHERE p.tipo = 'profesor' and pr.id_profesor IS NULL;

    SELECT d.* FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento WHERE p.id_departamento IS NULL;

    SELECT * FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND a.id IS NULL;

    SELECT * FROM asignatura a WHERE id_profesor IS NULL;

    SELECT d.nombre from departamento d LEFT JOIN profesor pr ON d.id = pr.id_departamento LEFT JOIN asignatura a ON pr.id_profesor = a.id_profesor WHERE a.id iS NULL GROUP BY d.nombre;

    SELECT COUNT(id) FROM persona WHERE tipo = 'alumno';

    SELECT COUNT(id) FROM persona WHERE tipo = 'alumno' AND YEAR(fecha_nacimiento) = '1999';

    SELECT d.nombre, COUNT(p.id_profesor) FROM departamento d INNER JOIN profesor p ON p.id_departamento = d.id GROUP BY p.id_departamento ORDER BY COUNT(p.id_profesor) DESC;

    SELECT d.nombre, COUNT(p.id_profesor) FROM departamento d LEFT JOIN profesor p ON d.id = p.id_departamento GROUP BY d.id ORDER BY COUNT(p.id_profesor) DESC;

    SELECT g.nombre, COUNT(a.id) FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id ORDER BY COUNT(a.id) DESC;

    SELECT g.nombre, COUNT(a.id) FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.id HAVING COUNT(a.id) > 40 ORDER BY COUNT(a.id) DESC;

    SELECT g.nombre, a.tipo, SUM(a.creditos) FROM grado g LEFT JOIN asignatura a ON g.id = a.id_grado GROUP BY g.nombre, a.tipo ORDER BY g.nombre ASC, a.tipo ASC;

    SELECT ce.anyo_inicio, COUNT(asma.id_alumno) FROM curso_escolar ce INNER JOIN alumno_se_matricula_asignatura asma ON ce.id = asma.id_curso_escolar GROUP BY ce.anyo_inicio, ce.anyo_fin;

    SELECT p.id,  p.nombre, p.apellido1, p.apellido2, COUNT(a.id) FROM persona p LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' GROUP BY p.id, p.nombre, p.apellido1, p.apellido2 ORDER BY COUNT(a.id) DESC;

    SELECT * FROM persona WHERE tipo = 'alumno' ORDER BY fecha_nacimiento DESC LIMIT 1;

    SELECT p.*, pr.id_departamento, pr.id_profesor, a.id_profesor FROM persona p INNER JOIN profesor pr ON p.id = pr.id_profesor LEFT JOIN asignatura a ON p.id = a.id_profesor WHERE p.tipo = 'profesor' AND a.id_profesor IS NULL;
