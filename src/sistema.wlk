import alumnos.*
import carreras.*
import materias.*
import registros.*
import requisitos.*

object sistema {
	var registros = []
	method registrar(unAlumno, unaMateria, unaNota) {
		
		var registro = new Registro(alumno = unAlumno, materia = unaMateria, nota = unaNota)
		registros.add(registro)
		unAlumno.materiasAprobadas().add(unaMateria)
		unaMateria.alumnosInscriptos().add(unAlumno)
	}
	
	method notaDelEstudianteEnLaMateria(unAlumno, unaMateria) {
		 return registros.find({registro => ((registro.alumno() == unAlumno) && (registro.materia() == unaMateria))}).nota()
	
	}
	
	
}
