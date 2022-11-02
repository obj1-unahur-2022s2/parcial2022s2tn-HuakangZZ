object inta{
	const parcelas = []
	
	method meterParcela(unaParcela){
		parcelas.add(unaParcela)
	}
	
	method promedioDePlantas() =
		self.totalDePlantas().div(self.cantidadDeParcelas())
		
	method totalDePlantas() = 
		parcelas.sum({p => p.cantidadDePlantas()})
	
	method cantidadDeParcelas() = parcelas.size()
	
	method parcelaMasAutosustentable() =
		self.parcelasConMasDe_Plantas(5).max({p => p.cantidadDePlantasBienAsociadas()})
		
	method parcelasConMasDe_Plantas(cantidad) =
		parcelas.filter({p => p.cantidadDePlantas()>cantidad}) 
		
}