/*
 * Recorda que al lanzar una exepcion el codigo se aborta y no sigue ejecutando.  En el caso de ```method plantar(unaPlanta)``` si inverstias la lógica te ahora el else
 */
import plantas.*

class Parcelas {
	const property ancho
	const property largo
	var property horasDeSolQueRecibe
	const plantas = []
	
	method superficie() = ancho * largo
	
	method cantidadMaxima() = 
		if(ancho > largo) self.superficie().div(5)
		else self.superficie().div(3) + largo
		
	method tieneComplicaciones() = plantas.any({p => p.horasDeSolTolera() < horasDeSolQueRecibe})
	
	method plantar(unaPlanta){
		if(not self.condicionParaPlantar(unaPlanta))
			self.error("No se cumple la condicion para plantar esta planta")
		plantas.add(unaPlanta)
		
	}
	
	method condicionParaPlantar(unaPlanta) =
		not((self.cantidadMaxima() < self.cantidadDePlantas() + 1) or 
		(horasDeSolQueRecibe >= unaPlanta.horasDeSolTolera() + 2))
		
	method ningunaSuperaAltura(altura) = 
		plantas.all({p => p.altura() < altura})
	
	method seAsociaBien(unaPlanta)
	
	method cantidadDePlantas() = plantas.size()
	
	method cantidadDePlantasBienAsociadas() =
		plantas.count({p => self.seAsociaBien(p)})
}

class ParcelasEcologicas inherits Parcelas{
	override method seAsociaBien(unaPlanta) =
		not self.tieneComplicaciones() and unaPlanta.parcelaEsIdeal(self)
}

class ParcelasIndustriales inherits Parcelas{
	override method seAsociaBien(unaPlanta) =
		self.cantidadDePlantas() <= 2 and unaPlanta.esFuerte()
}