import parcelasPropias.*

class Planta{
	var property altura
	const property anioCosecha
	
	method hsSolTolera()
	method esFuerte()= self.hsSolTolera() > 10
	method alternativa()
	method daSemillas() = self.esFuerte()|| self.alternativa()
	method espacio()
	method resultaIdeal(parcela)
}

class Menta inherits Planta{
	override method resultaIdeal(parcela)= parcela.superficie() > 6
}

class Soja inherits Planta{
	override method resultaIdeal(parcela)= parcela.hsSol() == self.hsSolTolera()
}

class Quinoa inherits Planta{
	override method resultaIdeal(parcela)= not parcela.superaAltura(1.5)
}

class HierbaBuena inherits Menta{
	
}

class SojaTrans inherits Soja{
	override method resultaIdeal(parcela)= parcela.cantMaxima() == 1
}



