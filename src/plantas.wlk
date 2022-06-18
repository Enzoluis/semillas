import parcelas.*
class Planta {
	
	var altura
	const property anioCosecha
	
	method altura(unCanidad) {
		altura = 0.max(unCanidad) 
	}
	
	method horasToleraSol()
	method esFuerte() = self.horasToleraSol() > 10
	

	method daSemillasNuevas() = self.esFuerte() || self.condicionAlternativa()
	
	method condicionAlternativa()
	
	method espacio()
	
	method parcelaIdeal(parcela)
	
}

class Menta inherits Planta {
	
	override method horasToleraSol() = 6
	override method condicionAlternativa() = altura > 0.4
	override method espacio()= altura * 3
	override method parcelaIdeal(parcela) = parcela.superficie() > 6
	
}


class Soja inherits Planta {
	
	override method horasToleraSol(){
		
		if (altura <= 0.4)
			return 6
		else if (altura.between(0.5,1)){
			return 7
		}
		else return 9
	}
	
	override method condicionAlternativa() = anioCosecha > 2007 && altura > 1
	
	override method espacio()= altura * 0.5
	
	override method parcelaIdeal(parcela) = parcela.solHoras() == self.horasToleraSol()
}



class Quinoa inherits Planta {
	
	const property horasToleraSol
	
	override method condicionAlternativa() = anioCosecha < 2005
	
	override method espacio()= 0.5
	
	override method parcelaIdeal(parcela) = not parcela.hayAlgunaQueSupere(1.5)
}

class Transgenica inherits Soja {
	override method daSemillasNuevas() = false
	override method parcelaIdeal(parcela) = parcela.maxCultivos() == 1
}

class HierbaBuena inherits Menta {
	override method espacio() = super() * 2
	
}

