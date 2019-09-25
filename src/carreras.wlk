import materias.*
import alumnos.*
import requisitos.*
import registros.*
import sistema.*

class Carrera {

	var property materias = []

	method materiasDelAnio(unAnio) {
		return materias.filter({ materia => (materia.anio() == unAnio) })
	}

}

