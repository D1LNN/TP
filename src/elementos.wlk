import wollok.game.*
import direcciones.*
import personajes.*

class Elemento {

	var property position
	var property direccion = arriba

	method sePuedePisar()

	method moverA(direc) {
	}

	method cambiarPosicion(pos) {
		if (self.puedeMoverseAl(direccion)) self.position(pos)
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method sePuedeMover()

	method esLlave() = false

	method esCofre() = false
	
	method esLingote() = false

}

class Cofre inherits Elemento {

	const property image = "cofre.png"

	override method sePuedePisar() = false

	override method sePuedeMover() = true

	override method moverA(direc) {
		direccion = direc
		self.cambiarPosicion(direccion.siguiente(self.position()))
	}

	override method esCofre() = true

}

class Deposito inherits Elemento {

	const property image = "pisoDePiedras2.png"

	override method sePuedePisar() = true

	override method sePuedeMover() = false

}

class Llave inherits Elemento {

	var property image = "llave2.png"

	override method sePuedePisar() = false

	override method sePuedeMover() = false

	method serAgarrada() {
		game.removeVisual(self)
	}

	override method esLlave() = true

}

object paleta {

	const property verde = "00FF00FF"

}

object salud {

	const property position = game.at(1, 14)

	method text() = "Salud: " + pirata.salud().printString()

	method textColor() = paleta.verde()

	method sePuedePisar() = true

	method moverA(direc) {
	}

	method cambiarPosicion(pos) {
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method sePuedeMover() = false

	method esLlave() = false

	method esCofre() = false

}

object corazon {

	const property position = game.at(0, 14)
	var property image = "corazon.png"

	method sePuedePisar() = true

	method moverA(direc) {
	}

	method cambiarPosicion(pos) {
	}

	method puedeMoverseAl(direc) = game.getObjectsIn(direc.siguiente(position)).all({ elem => elem.sePuedePisar() }) and self.sePuedeMover()

	method sePuedeMover() = false

	method esLlave() = false

	method esCofre() = false

}

class Lingote inherits Llave {
	override method image() = "oro.png"
	override method esLingote() = true
}











