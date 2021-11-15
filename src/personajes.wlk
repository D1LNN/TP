import wollok.game.*
import direcciones.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición
object pirata {

	var property position = game.at(10, 8)
	const property image = "pirata.png"
	var property direccion
	const property llaves = []
	var property salud = 100
	var property energia = 100

	method cambiarPosicion(pos) {
		if (self.puedeMoverseAl(direccion)) self.position(pos)
	}

	method moverA(direc) {
		direccion = direc
		self.cambiarPosicion(direccion.siguiente(self.position()))
	}

	method agarrarLlave(llave) {
		llaves.add(llave)
		llave.serAgarrada()
	}

	method agarrarLlaveAl(direc) {
		if (self.hayObjetoAl(direc) and self.objetosAl(direc).all({ elem => elem.esLlave() })) self.agarrarLlave(self.objetosAl(direc).get(0)) else game.say(self, "No hay lave en esta direccion.")
	}

	method puedeMoverseAl(direc) = self.objetosAl(direc).all({ elem => elem.sePuedePisar() or elem.puedeMoverseAl(direc) })

	method objetosAl(direc) = game.getObjectsIn(direc.siguiente(position))

	method hayObjetoAl(direc) = not game.getObjectsIn(direc.siguiente(position)).isEmpty()

}

