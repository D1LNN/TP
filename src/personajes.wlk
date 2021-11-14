import wollok.game.*
import direcciones.*

// en la implementación real, conviene tener un personaje por nivel
// los personajes probablemente tengan un comportamiendo más complejo que solamente
// imagen y posición
object personajeSimple {

	var property position = game.at(10, 8)
	const property image = "player.png"
	var property direccion

	method cambiarPosicion(pos) {
		if (self.puedeMoverseA(pos)) self.position(pos) else self.moverAExtremoOpuesto()
	}

	method moverA(direc) {
		direccion = direc
		self.cambiarPosicion(self.direccion().siguiente(self.position()))
	}

	method puedeMoverseA(pos) = pos.x().between(0, game.height() - 1) and pos.y().between(0, game.width() - 1)

	method moverAExtremoOpuesto() {
		self.position(direccion.extremoOpuesto(self.position()))
	}

}

