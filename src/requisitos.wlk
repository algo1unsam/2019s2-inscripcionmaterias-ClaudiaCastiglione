import alumnos.*
import carreras.*
import materias.*

object requisitoCreditos {
	var property creditosNecesarios = 0
	
	method cumpleRequisito(unAlumno) {
		return self.tieneCreditosSuficientes(unAlumno)
	}
	
	method tieneCreditosSuficientes(unAlumno) {
		return self.creditosNecesarios() == unAlumno.creditos()
	}
}

object requisitoCorrelativas {
	var property correlativas = []
	
	method cumpleRequisito(unAlumno) {
		return self.tieneAprobadasCorrelativas(unAlumno)
	}
	
	method tieneAprobadasCorrelativas(unAlumno) {
		return correlativas.all({materia => unAlumno.materiasAprobadas().contains(materia)}) 
	}
}

object requisitoAnioAnteriorAprobado {
	var anio = materia.anio()
	var carrera = materia.carrera()
	
	method cumpleRequisito(unAlumno) {
		return self.tieneAprobadoAnioAnterior(unAlumno)
	}
	
	method tieneAprobadoAnioAnterior(unAlumno) {
		return unAlumno.tieneAprobadoAnioAnterior(anio-1, carrera)
	}
}

object requisitoNada {
	
	method cumpleRequisito(unAlumno) = true
}