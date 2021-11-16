import wollok.game.*
import direcciones.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición
object pirata {

	var property position = game.at(10, 8)
	const property image = "pirataConFondo.png"
	var property direccion
	const property llaves = []
	var property salud 
	var property energia 
	var property dinero 

	method cambiarPosicion(pos) {
		if (self.puedeMoverseAl(direccion)) self.position(pos)
	}

	method moverA(direc) {
		direccion = direc
		self.cambiarPosicion(direccion.siguiente(self.position()))
		energia -= 1
	}

	method agarrarLlave(llave) {
		llaves.add(llave)
		llave.serAgarrada()
	}
	
	method agarrarMoneda(moneda) {
		//llaves.add(moneda)
		moneda.serAgarrada()
		dinero += 1
	}
	
	method agarrarBanana(banana) {
		llaves.add(banana)
		banana.serAgarrada()
		energia += 1
	}

	method agarrarLlaveAl(direc) {
		if (self.hayObjetoAl(direc) and self.objetosAl(direc).all({ elem => elem.esLlave() })) self.agarrarLlave(self.objetosAl(direc).get(0)) else game.say(self, "No hay llave en esta direccion.")
	}
	
	method agarrarMonedaAl(direc) {
		if (self.hayObjetoAl(direc) and self.objetosAl(direc).all({ elem => elem.esMoneda() })) self.agarrarMoneda(self.objetosAl(direc).get(0)) else game.say(self, "No hay moneda en esta direccion.")
	}
	
	method agarrarBananaAl(direc) {
		if (self.hayObjetoAl(direc) and self.objetosAl(direc).all({ elem => elem.esBanana() })) self.agarrarBanana(self.objetosAl(direc).get(0)) else game.say(self, "No hay banana en esta direccion.")
	}

	method puedeMoverseAl(direc) = self.objetosAl(direc).all({ elem => elem.sePuedePisar() or elem.puedeMoverseAl(direc) })

	method objetosAl(direc) = game.getObjectsIn(direc.siguiente(position))

	method hayObjetoAl(direc) = not game.getObjectsIn(direc.siguiente(position)).isEmpty()

}

