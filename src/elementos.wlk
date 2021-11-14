import wollok.game.*
import direcciones.*
import personajes.*

class Elemento {

	var property position
	var direccion = arriba

	method sePuedePisar()

	method moverA(direc) {
	}

	method hayCeldaLibreAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar( ) })

}

class Cofre inherits Elemento {

	const property image = "cofre.png"

	override method sePuedePisar() = false

	method cambiarPosicion(pos) {
		if (self.puedeMoverseA(pos)) self.position(pos) else if (self.esBorde()) self.moverAExtremoOpuesto()
	}

	override method moverA(direc) {
		direccion = direc
		self.cambiarPosicion(direccion.siguiente(self.position()))
	}

	method puedeMoverseA(pos) = pos.x().between(0, game.height() - 1) and pos.y().between(0, game.width() - 1) and self.hayCeldaLibreAl(direccion)

	method moverAExtremoOpuesto() {
		self.position(direccion.extremoOpuesto(self.position()))
	}

	method esBorde() = position.x() == 0 or position.x() == 14 or position.y() == 0 or position.y() == 14

}

class Deposito inherits Elemento {

	const property image = "deposito2.png"

	override method sePuedePisar() = true

}

class Llave inherits Elemento {

	const property image = "llave2.png"

	override method sePuedePisar() = false

	method serAgarrado() {
		pirata.agarrarLlave(self)
		game.removeVisual(self)
	}

	method esLlave() = true

}

