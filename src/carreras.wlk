class Carrera {
	var property materias = []
	
	method cantMateriasDelAnio(unAnio) {
		materias.filter({materia => materia.anio() == unAnio}).size()
	}
	
	
}
