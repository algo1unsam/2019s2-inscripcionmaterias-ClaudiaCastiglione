import alumnos.*
import carreras.*
import requisitos.*
import sistema.*
import registros.*

class Materia {

	const property carrera
	var property requisito = requisitoNada
	const property alumnosInscriptos = []
	const property alumnosEnListaEspera = []
	var property correlativas = []
	var property creditosNecesarios = 0
	var property anio
	var property cupo

	
	method inscribir(unAlumno) {
		if (self.sePuedeInscribir(unAlumno)) {
			if(self.hayCupo()){
				self.alumnosInscriptos().add(unAlumno)
				unAlumno.materiasInscripto().add(self)
				}
			else {
				self.alumnosEnListaEspera().add(unAlumno)
				unAlumno.materiasCondicional().add(self)
			}
		} 
		else self.error("No se puede inscribir a este alumno en esta materia")
	}

	method darDeBaja(unAlumno) {
		if (not unAlumno.estaInscripto(self)) {
			self.error("Este alumno no esta inscripto en esta materia")
		} else {
			alumnosInscriptos.remove(unAlumno)
			if (self.hayAlumnosEnEspera()) alumnosInscriptos.add(alumnosEnListaEspera.first())
		}
	}

	method sePuedeInscribir(unAlumno) {
		return (requisito.cumpleRequisito(unAlumno, self) && not self.yaEstaInscripto(unAlumno) && not unAlumno.tieneAprobada(self) && unAlumno.estaInscriptoEnCarrera(self.carrera()))
	}

	method yaEstaInscripto(unAlumno) {
		return alumnosInscriptos.contains( unAlumno )
	}

//	method tieneCreditosSuficientes(unAlumno) {
//		return self.creditosNecesarios() == unAlumno.creditos()
//	}
	method hayAlumnosEnEspera() = (alumnosEnListaEspera.size() > 0)

	method esDelAnio(unAnio) {
		return (anio == unAnio)
	}

	method esDeLaCarrera(unaCarrera) {
		return (carrera == unaCarrera)
	}

	method hayCupo() {
		return (cupo > self.alumnosInscriptos().size())
	}

//	method tieneAprobadoAnioAnterior(unAlumno) {
//		return unAlumno.tieneAprobadoAnioAnterior(anio-1, carrera)
//	}
//	method tieneAprobadasCorrelativas(unAlumno) {
//		return correlativas.all({materia => unAlumno.materiasAprobadas().contains(materia)}) 
//	}
}

