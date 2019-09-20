import materias.*
class Alumno {
	var carrerasInscripto = []
	var materiasAprobadas = []
	var materiasInscripto = []
	var materiasCondicional = []
	var property creditos
	
	method puedeCursar(unaMateria) {}
	
	method tieneAprobada(unaMateria) {
		return materiasAprobadas.any(materia => materia == unaMateria)
	}
	
	method estaInscripto(unaMateria) {
		return materiasInscripto.any(materia => materia == unaMateria)
	}
	
}
