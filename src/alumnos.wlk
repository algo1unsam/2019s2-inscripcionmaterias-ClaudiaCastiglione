import materias.*
import carreras.*
import requisitos.*

class Alumno {
	var carrerasInscripto = []
	var materiasAprobadas = []
	var materiasInscripto = []
	var materiasCondicional = []
	var materiasQuePuedeCursar = []
	var property creditos = 0
	
	method puedeCursar(unaMateria) {
		return unaMateria.sePuedeInscribir(self)
	}
	
	method tieneAprobada(unaMateria) {
		return materiasAprobadas.any({materia => (materia == unaMateria)})
	}
	
	method estaInscripto(unaMateria) {
		return materiasInscripto.any({materia => (materia == unaMateria)})
	}
	
	method tieneAprobadoAnioAnterior(unAnio, carrera) {
		var materiasDelAnio = materiasAprobadas.filter({m => m.esDelAnio(unAnio)})
		return (carrera.cantMateriasDelAnio(unAnio) == materiasDelAnio.size())
	}
	
	method estaInscriptoEnCarrera(unaCarrera) {
		return carrerasInscripto.any({carrera => (carrera == unaCarrera)})
	}
	
	method listarMateriasQuePuedeCursar(carrera) {
		if(self.estaInscriptoEnCarrera(carrera)) {
			materiasQuePuedeCursar = carrera.materias().filter({materia => self.puedeCursar(materia)})
		}
		else self.error("No esta inscripto en " + carrera.toString())
		
	}
	
}
