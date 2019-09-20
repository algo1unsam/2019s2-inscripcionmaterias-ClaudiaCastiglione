import alumnos.*
class Materia {
	var property carrera
	var alumnosInscriptos = []
	var alumnosEnListaEspera = []
	var property correlativas = []
	var property creditos = 0
	var property anio 
	var property cupo 
	
	method inscribir(unAlumno) {
		if (self.sePuedeInscribir(unAlumno)) alumnosInscriptos.add(unAlumno)
		else self.error("No se puede inscribir a este alumno en esta materia")
	}
	
	method darDeBaja(unAlumno) {
		if (not unAlumno.estaInscripto(self)){
			self.error("Este alumno no esta inscripto en esta materia")
		}
		else alumnosInscriptos.remove(unAlumno)
	}
	
	method sePuedeInscribir(unAlumno) {
		
	}
	
}
