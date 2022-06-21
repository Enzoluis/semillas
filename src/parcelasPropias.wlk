import plantas.*

class Parcelas{
	var property ancho
	var property largo
	var property hsSol
	const plantas =[]
	
	method superficie()= ancho*largo
	
	method cantMaxima(){if(ancho>largo){return self.superficie()/5} else{return self.superficie() / 3 + largo}} 
	
	method complicaciones()= plantas.any{p => hsSol > p.horasToleraSol()}
	
	method plantar(planta){
		
		if(plantas.size() == self.cantMaxima())
			self.error("Error demasiadas cosecha")
		
		if(hsSol - planta.horasToleraSol()>=2)
			self.error("Error muy pocas horas de sol")
			
		plantas.add(planta)
	}
	
	method superaAltura(altura) = plantas.any({p=>p.altura()>altura})
	method seAsociaBien(unaPlanta)	
	method cantPlantas() = plantas.size()
	method porcentajeSeAsociaBien() {
		return self.cantidadPlantaBienAsociadas()  * 100 / self.cantPlantas() 
	}//Saca el  porcentaje
	
	method cantidadPlantaBienAsociadas() {
		return plantas.count { p=> self.seAsociaBien(p)}
	}//cuenta cuantas plantas cumplen con la condicion dada
 	
}

class Ecologica inherits Parcelas{
	
	override method seAsociaBien(unaPlanta)= not self.complicaciones()&& unaPlanta.resultaIdeal(self)
}
 
class Industriales inherits Parcelas{
	
	override method seAsociaBien(unaPlanta)= self.cantMaxima() <= 2 && unaPlanta.esFuerte()
}
 
 object inta{
 	
 	const parcel=[]
 	method promedioPlantas()= parcel.sum({p=>p.cantPlantas()/parcel.size()})
 	
 	method masAutosustentable()= self.masDeXPlantas(4).max({ p => p.porcentajeSeAsociaBien()})
 	
 	method masDeXPlantas(cant)= parcel.filter({p=>p.cantPlantas() > cant})
 	
 }