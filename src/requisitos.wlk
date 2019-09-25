import alumnos.*
import carreras.*
import materias.*

object requisitoCreditos {

	method cumpleRequisito(unAlumno, unaMateria) {
		return  unaMateria.creditosNecesarios() <= unAlumno.creditos()
	}

}

object requisitoCorrelativas {

	method cumpleRequisito(unAlumno, unaMateria) {
		return unaMateria.correlativas().all({ materia => unAlumno.materiasAprobadas().contains(materia) })
	}

}

object requisitoAnioAnteriorAprobado {

	method cumpleRequisito(unAlumno,unaMateria) {
		return unAlumno.tieneAprobadoAnioAnterior(unaMateria.anio(), unaMateria.carrera())
	}

}

object requisitoNada {

	method cumpleRequisito(unAlumno, unaMateria) {
		return true
	} 

}

