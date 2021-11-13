import wollok.game.*
import Direcciones.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición
object personajeSimple {

	var property position = game.at(10, 8)
	const property image = "player.png"
	var property direccion

	method x() = position.x()

	method y() = position.y()

	method cambiarPosicion(pos) {
		if (self.puedeMoverseA(pos)) position = pos else if (self.direccion() == "arriba") position = game.at(self.x(), 0) else if (direccion == "abajo") position = game.at(self.x(), game.height() - 1) else if (direccion == "derecha") position = game.at(0, self.y()) else if (direccion == "izquierda") position = game.at(game.width() - 1, self.y())
	}

	method moverDerecha() {
		direccion = "derecha"
		self.cambiarPosicion(self.position().right(1))
	}

	method moverIzquierda() {
		direccion = "izquierda"
		self.cambiarPosicion(self.position().left(1))
	}

	method moverArriba() {
		self.cambiarPosicion(self.position().up(1))
		direccion = "arriba"
	}

	method moverAbajo() {
		direccion = "abajo"
		self.cambiarPosicion(self.position().down(1))
	}

	method puedeMoverseA(pos) = pos.x().between(0, game.height() - 1) and pos.y().between(0, game.width() - 1)

}

