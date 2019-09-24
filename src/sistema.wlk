import alumnos.*
import carreras.*
import materias.*
import registros.*

object sistema {
	
	method registrar(unAlumno, unaMateria, unaNota) {
		
		var registros = []
		
		var registro = new Registro(alumno = unAlumno, materia = unaMateria, nota = unaNota)
		registros.add(registro)
		unAlumno.materiasAprobadas().add(unaMateria)
	}
	
	
}
