import materias.*
import alumnos.*
class Carrera {
	var property materias = []
	
	method cantMateriasDelAnio(unAnio) {
		return materias.filter({materia => (materia.anio() == unAnio)}).size()
	}
	
	
}
