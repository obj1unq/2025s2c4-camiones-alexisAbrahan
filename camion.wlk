import cosas.*

object camion {
	var property carga = []
	const tara = 1000 //kg


	method cargar(unaCosa) {
		
		if (carga.contains(unaCosa))
		 self.error("Ya esta" + unaCosa + "en el camion")
	    else
		 carga.add(unaCosa)
	    
	}
		method darmeA_(cosa_){
		return(
		carga.find{ cosa => cosa == cosa_  }
		)

	}

	method pesoTotalDelCamión(){
		return(
		(carga.sum { carga => carga.pesaje() }  + tara)
		)
	}

	method seEncuentraExcedidoDePeso() {
		return(self.pesoTotalDelCamión() <= 2500)

	} 
	
	
	method todoPesoPar() {
	   return(
	  	carga.all { cosa => cosa.pesaje()%2==0 }  
		)
	}
     
	method hayAlgunoQuePesaExactamente(pesoExacto) {
		return(
	   carga.any {cosa => cosa.pesaje() == pesoExacto}
		)
	}

		method hayAlgunoQueTengaPeligrosidadExactamente(peligrosidadExacta) {
		return(
	   carga.any {cosa => cosa.peligrosidad() == peligrosidadExacta}
		)
	}
		



	method cosasCargadasQueEsténEnElCamiónQueSuperen_NivelDePeligrosidad(nivelPeligrosidadExacto){
		return(
		carga.find{ cosa => cosa.peligrosidad() > nivelPeligrosidadExacto  }
		)

	}


	method cosasCargadasQueEsténEnElCamiónQueSeanMásPeligrosasQueOtraCosaIndicada(cosa){
		return(
		self.cosasCargadasQueEsténEnElCamiónQueSuperen_NivelDePeligrosidad(cosa.peligrosidad())
		)
	}

	method puedeCircularEn_(camino){
		return(
		carga.all {cosa => cosa.peligrosidad() < camino.nivelPeligrosidadPermitido()})
				&&
		(not self.seEncuentraExcedidoDePeso())
		
	}

	method tieneElCamionAlgoEntrePesaje_Y_(mínimo,máximo){
		return(
		carga.any {cosa => (máximo > cosa.pesaje() > mínimo)  }
		)
	}

	method laCosaMásPesadaQueTengaElCamión(){
		if (carga.isEmpty()){
			self.error("ESTA VACIO, COMO VA A TENER UNA COSA MAS PESADA???????????????? (Emoji enojado)")
		} 
		else{
			return(
		carga.max({ objeto => objeto.pesaje() })
			)
		}
	}



	method todosLosPesos(){
		return(carga.map { elemento => elemento.pesaje() })
	}

	method totalBultos(){
		return (carga.sum({unaCosa => unaCosa.bulto()}))
	}

	method accidente(){
		carga = carga.map{ elemento => elemento.aplicarAccidente() }
	}

	method transportar(destino, camino){

		if (self.puedeCircularEn_(camino)){
			almacen.stock.addAll(carga)
			carga.clear()
		}
		else{
			self.error("No se puede ir, el camino no es el adecuado para circular con cosas tan peligrosos, segun las leyes.")
		}
	}
}

object ruta {
  var property nivelPeligrosidadPermitido = 20
}

object almacen {
  var property stock = []
}


    object caminosVecinales {
      var property pesoMaximoPermitido = 2000

      method nivelPeligrosidadPermitido() { return (999) }

      method soporta(camion) {
        return (camion.pesoTotalDelCamión() <= pesoMaximoPermitido)
      }
    }

