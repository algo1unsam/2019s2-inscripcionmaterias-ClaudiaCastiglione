import alumnos.*
import carreras.*
import requisitos.*

class Materia {
	var property carrera
	var property requisito = requisitoNada
	var alumnosInscriptos = []
	var alumnosEnListaEspera = []
//	var property correlativas = []
//	var property creditosNecesarios = 0
	var property anio 
	var property cupo 
	
	method inscribir(unAlumno) {
		if (self.sePuedeInscribir(unAlumno)&& self.hayCupo()) alumnosInscriptos.add(unAlumno)
		if (self.sePuedeInscribir(unAlumno) && not self.hayCupo()) alumnosEnListaEspera.add(unAlumno)
			else self.error("No se puede inscribir a este alumno en esta materia")
	}
	
	method darDeBaja(unAlumno) {
		if (not unAlumno.estaInscripto(self)){
			self.error("Este alumno no esta inscripto en esta materia")
		}
		else {
			alumnosInscriptos.remove(unAlumno)
			if(self.hayAlumnosEnEspera()) alumnosInscriptos.add(alumnosEnListaEspera.first())
			}
	}
	
	method sePuedeInscribir(unAlumno) {
		return (requisito.cumpleRequisito(unAlumno) && not self.yaEstaInscripto(unAlumno) && not unAlumno.tieneAprobada(self))
		
	}
	
	method yaEstaInscripto(unAlumno) {
		return alumnosInscriptos.any({alumno => alumno == unAlumno})
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
	
	method hayCupo(){
		return (cupo == alumnosInscriptos.size())
	}
	
	
//	method tieneAprobadoAnioAnterior(unAlumno) {
//		return unAlumno.tieneAprobadoAnioAnterior(anio-1, carrera)
//	}
	
//	method tieneAprobadasCorrelativas(unAlumno) {
//		return correlativas.all({materia => unAlumno.materiasAprobadas().contains(materia)}) 
//	}
	
}
	
	
	
	
	

	

