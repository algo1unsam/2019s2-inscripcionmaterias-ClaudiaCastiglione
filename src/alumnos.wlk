import materias.*
import carreras.*
import requisitos.*
import sistema.*
import registros.*

class Alumno {

	const property carrerasInscripto = []
	const property materiasAprobadas = []
	var property materiasInscripto = []
	var property materiasCondicional = []
	var property materiasQuePuedeCursar = []
	var property creditos = 0

	method puedeCursar(unaMateria) {
		return unaMateria.sePuedeInscribir(self)
	}

	method tieneAprobada(unaMateria) {
		return materiasAprobadas.contains(unaMateria)
	}

	method estaInscripto(unaMateria) {
		return materiasInscripto.contains(unaMateria) 
	}

	method tieneAprobadoAnioAnterior(unAnio, carrera) {
		return carrera.materiasDelAnio(unAnio - 1).all({materia => self.tieneAprobada(materia)})
	}

	method estaInscriptoEnCarrera(unaCarrera) {
		return carrerasInscripto.contains(unaCarrera)
	}
	

	method listarMateriasQuePuedeCursar(carrera) {
		if (self.estaInscriptoEnCarrera(carrera)) {
			materiasQuePuedeCursar = carrera.materias().filter({ materia => self.puedeCursar(materia) })
		} else self.error("No esta inscripto en " + carrera.toString())
	}
	
	method notaEnLaMateria(unaMateria) {
		return sistema.notaDelEstudianteEnLaMateria(unaMateria, self)
	}

}

