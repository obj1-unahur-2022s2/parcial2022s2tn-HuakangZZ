/*
 * ``` method parcelaEsIdeal(unaParcela)``` Debía ser un método abstracto de Plata y sobreescribirlo en las subclases.
 */
class Plantas{
	var property anioDeObtencion
	var property altura
	
	method horasDeSolTolera()
	method espacioQueOcupa()
	method esFuerte() = self.horasDeSolTolera()>10
	method daNuevasSemillas() = self.esFuerte()
	method parcelaEsIdeal(unaParcela)
}

class Menta inherits Plantas{
	override method horasDeSolTolera() = 6
	override method daNuevasSemillas() = super() or altura > 0.4
	override method espacioQueOcupa() = altura * 3
	override method parcelaEsIdeal(unaParcela) =
		unaParcela.superficie() > 6
}

class Soja inherits Plantas{
	override method horasDeSolTolera() =
		if (altura < 0.5) 6
		else if(altura > 1) 9
		else 7
	
	override method daNuevasSemillas() = super() or self.condicionExtraParaSemillas()
	
	override method espacioQueOcupa() = altura / 2
	
	method condicionExtraParaSemillas() =
		anioDeObtencion > 2007 and altura > 1
	
	override method parcelaEsIdeal(unaParcela) =
		self.horasDeSolTolera() == unaParcela.horasDeSolQueRecibe()
}

class Quinoa inherits Plantas{
	const horasDeSol
	
	override method horasDeSolTolera() = horasDeSol
	override method espacioQueOcupa() = 0.5
	override method daNuevasSemillas() = super() or anioDeObtencion < 2005
	
	override method parcelaEsIdeal(unaParcela) = 
		unaParcela.ningunaSuperaAltura(1.5)
}

class SojaTransgenica inherits Soja{
	override method daNuevasSemillas() = false
	override method parcelaEsIdeal(unaParcela) =
		unaParcela.cantidadMaxima() == 1
	 
}

class HierbaBuena inherits Menta{
	override method espacioQueOcupa() = super() * 2
}