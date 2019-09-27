import alumnos.*
import carreras.*
import requisitos.*
import sistema.*
import registros.*

class OrdenDeLlegada {
	var property materia
	var property alumnosInscriptos = []
	var property alumnosEnListaEspera = []
	var property cupo = 0
	
	method inscribir(unAlumno) {
		if (self.materia().sePuedeInscribir(unAlumno)) {
			if(self.materia().hayCupo()){
				self.materia().alumnosInscriptos().add(unAlumno)
				unAlumno.materiasInscripto().add(self.materia())
				}
			else {
				self.materia().alumnosEnListaEspera().add(unAlumno)
				unAlumno.materiasCondicional().add(self.materia())
			}
		} 
		else self.error("No se puede inscribir a este alumno en esta materia")
	}
	
	
}

class Elitista {
	var property materia
	var property alumnosInscriptos = []
	var property alumnosEnListaEspera = []
	var property cupo = 0
	
	method promedio(unAlumno) {
		return unAlumno.materiasAprobadas().filter({materia => materia.esDeLaCarrera(self.materia().carrera())}).sum()/unAlumno.materiasAprobadas().filter({materia => materia.esDeLaCarrera(self.materia().carrera())}).size()
	}
	
	method alumnoInscriptoConMenorPromedio() {
		return self.materia().alumnosInsriptos().min({alumno => self.promedio(alumno)})
	}
	
	method menorPromedioDeLosInscriptos() {
		return self.promedio(self.alumnoInscriptoConMenorPromedio())
	}
	
	method inscribir(unAlumno) {
		if (self.materia().sePuedeInscribir(unAlumno)) {
			if(self.materia().hayCupo()){
				self.materia().alumnosInscriptos().add(unAlumno)
				unAlumno.materiasInscripto().add(self.materia())
				}
			else {
				if(self.promedio(unAlumno) <= self.menorPromedioDeLosInscriptos()) {
					self.materia().alumnosEnListaEspera().add(unAlumno)
					unAlumno.materiasCondicional().add(self.materia())
					}
				else {
					self.materia().alumnosInscriptos().remove(self.alumnoInscriptoConMenorPromedio())
					self.materia().alumnosInscriptos().add(unAlumno)
					self.materia().alumnosEnListaEspera().add(self.alumnoInscriptoConMenorPromedio())
				}
			}
		} 
		else self.error("No se puede inscribir a este alumno en esta materia")
	}
	
	
	
}

class GradoDeAvance {
	var property materia
	var property alumnosInscriptos = []
	var property alumnosEnListaEspera = []
	var property cupo = 0
	
}
