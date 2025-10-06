object knight_Rider {

  method pesaje() {
		return (500) //Kg
	}


  method peligrosidad() {
	 return (10)
	}

  method bulto() {
  	 return (1)
    }

	method aplicarAccidente(){

	}

}

object knight_Rider_Impar {
 
  method pesaje() {
		return (501) //Kg
	}


  method peligrosidad() {
	 return (10)
	}

  method bulto() {
  	 return (1)
    }

	method aplicarAccidente(){

	} 
}

object arena_a_granel {
  var property pesoActual = 0

  method peligrosidad() {
	return (1)
  }
  method bulto() {
  	 return (1)
    }
	method aplicarAccidente(){
		pesoActual = pesoActual +20
	}
}

object bumblebee{
	var property  esAutoSinoTransformado = true

    method pesaje() {
		return (800) //Kg
	}
	  method peligrosidad() {
	return (
		if(esAutoSinoTransformado){
			return(15)
		}
		else{
			return(30)
		}
	)
  }
  method bulto() {
  	 return (2)
    }
	method aplicarAccidente(){
		esAutoSinoTransformado = not esAutoSinoTransformado
	}
}


object paquete_de_ladrillos {
  var property cantidad = 0

  method pesaje(){
	return(2*cantidad)//Kg
  } 
  method peligrosidad() {
	return(2 + 2 * (cantidad / 300))
  }
  method bulto() {
		if (cantidad <= 100) return (1)
  		 else if (cantidad <= 300) return (2)
  		 else return (3)
	
    }
	method aplicarAccidente(){
		if(cantidad > 12){
		cantidad = cantidad -12
		}
	     else {cantidad = 0}
	
	}
}

object batería_antiaérea {
 var property tieneMisilesCargados = true
  
 method pesaje(){
	if(tieneMisilesCargados){
	return(300)
	}
	else{return(200)}
 }

 method peligrosidad() {
	if(tieneMisilesCargados){
	return(100)
	}
	else{return(0)}
 }
method bulto() {
  if (tieneMisilesCargados) return (2)
  else return (1)
}
	method aplicarAccidente(){
		tieneMisilesCargados = false
	}

}


object residuos_radiactivo {
  var property pesoAhora = 0

  method peligrosidad(){
	return(200)
  }
  method bulto() {
  	 return (1)
    }
		method aplicarAccidente(){
		pesoAhora = pesoAhora+15
	}
}

object contenedor_Portuario {
  var contieneA = []
  method pesaje() {
		return (100 + contieneA.sum { objectos => objectos.pesaje() }) //Kg
	}


  method peligrosidad() {
	 return (
		if(contieneA.isEmpty()){
		0}
		else (contieneA.max({elemento => elemento.peligrosidad()}))
	 )
	} 
  method bulto() {
   return (contieneA.sum({ cosa => cosa.bulto() }) + 1)
  
    }
	method aplicarAccidente(){
		contieneA = contieneA.map{ elemento => elemento.aplicarAccidente() }
	}
 
}
object embalaje_De_Seguridad{
   var property contieneA = []
   method pesaje() {
		return (contieneA.sum { objectos => objectos.pesaje() }) //Kg
	}
	method peligrosidad() {
		return ((contieneA.sum { objectos => objectos.peligrosidad() }) / 2) //Kg
	}
  method bulto() {
  	 return (2)
    }
	method aplicarAccidente(){
		
	}

}

object bulto{
   const contieneA = []
   method pesaje() {
		return (contieneA.sum { objectos => objectos.pesaje() }) //Kg
	}
	method peligrosidad() {
		return ((contieneA.sum { objectos => objectos.peligrosidad() }) / 2) //Kg
	}
	method aplicarAccidente(){
		
	}

}

