<examen> {
for $alumno in doc('ejercicio-planilla-correccion-examen.xml')/correccionExamen/resultadosPorAlumno/alumno
where starts-with($alumno/@nombre, 'Cal')
return <alumno>{ data($alumno/@nombre) }</alumno>
} </examen>