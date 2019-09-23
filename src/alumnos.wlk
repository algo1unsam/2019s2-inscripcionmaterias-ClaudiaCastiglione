import materias.*
import carreras.*
import requisitos.*

class Alumno {
	var carrerasInscripto = []
	var materiasAprobadas = []
	var materiasInscripto = []
	var materiasCondicional = []
	var property creditos = 0
	
	method puedeCursar(unaMateria) {}
	
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
	
}
