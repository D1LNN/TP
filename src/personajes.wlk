import wollok.game.*
import direcciones.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición
object pirata {

	var property position = game.at(10, 8)
	const property image = "pirata.png"
	var property direccion
	const llaves = []

	method cambiarPosicion(pos) {
		if (self.puedeMoverseA(pos)) self.position(pos) else if (self.esBorde()) self.moverAExtremoOpuesto()
	}

	method moverA(direc) {
		direccion = direc
		self.cambiarPosicion(direccion.siguiente(self.position()))
	}

	method puedeMoverseA(pos) = pos.x().between(0, game.height() - 1) and pos.y().between(0, game.width() - 1)

	method moverAExtremoOpuesto() {
		self.position(direccion.extremoOpuesto(self.position()))
	}

	method agarrarLlave(llave) {
		if (game.getObjectsIn(position.right(1)).esLlave()) {
			llaves.add(llave)
			llave.serAgarrado()
		}
	}

	method esBorde() = position.x() == 0 or position.x() == 14 or position.y() == 0 or position.y() == 14

}

