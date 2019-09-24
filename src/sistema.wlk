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
	}
	
	method notaDelEstudianteEnLaMateria(unAlumno, unaMateria) {
		 var nota = registros.find({registro => ((registro.alumno() == unAlumno) && (registro.materia() == unaMateria))}).nota()
		 if (nota == null) {
		 	self.error("El alumno no tiene esta materia aprobada")
		 	}
		 else return nota
	}
	
	
}
