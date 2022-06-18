import plantas.*
class Parcela {
	var property ancho
	var property largo
	var property solHoras
	const  plantas = []
	
	method superficie() = ancho * largo
	
	method maxCultivos() {
		if(ancho > largo)
			return self.superficie() / 5
		else
			return self.superficie() / 3 + largo
	}
	
	method cultivoComplicado() {
		return plantas.any { p=> solHoras > p.horasToleraSol()}
	}
	
	method agregarCultivo(unaPlanta) {
		
		if (plantas.size() == self.maxCultivos())
			self.error("ERROR: Ups!!! No se pueden agregar más cultivos")
		
		if(solHoras - unaPlanta.horasToleraSol() >= 2)
			self.error("ERROR: el cultivo no puede tolerar el sol de la parcela")
		
		plantas.add(unaPlanta)
			
	}
	
	method hayAlgunaQueSupere(unaCantidad) {
		return plantas.any { p=> p.altura() > unaCantidad }
	}
	
	method seAsociaBien(unaPlanta) 
	
	method cantPlantas() {
		return plantas.size()
	}
	
	method porcentajeSeAsociaBien() {
		return self.cantidadPlantaBienAsociadas()  * 100 / self.cantPlantas() 
	}
	
	method cantidadPlantaBienAsociadas() {
		return plantas.count { p=> self.seAsociaBien(p)}
	}
	
}


class Ecologica inherits Parcela {
	override method seAsociaBien(unaPlanta) {
		return not self.cultivoComplicado() && unaPlanta.parcelaIdeal(self)
	}
}

class Industrial inherits Parcela {
	override method seAsociaBien(unaPlanta) {
		return plantas.size() <= 2 && unaPlanta.esFuerte()
	}
}


object inta {
	const parcelas = []
	
	method promedioPlanta() {
		return parcelas.sum({ p => p.cantPlantas() }) / parcelas.size()
	}
	
	method parcelasAutosustentables() {
		return self.parcelasDeMasDeXPlantas(4).max({ p => p.porcentajeSeAsociaBien()})
	}
	
	method parcelasDeMasDeXPlantas(unaCantidad) {
		return parcelas.filter {p => p.cantPlantas() > unaCantidad }
	}
	
}
