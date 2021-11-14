import wollok.game.*

object izquierda {

	method siguiente(position) = position.left(1)

	method opuesto() = derecha

	method extremoOpuesto(position) = game.at(game.width() - 1, position.y())

}

object derecha {

	method siguiente(position) = position.right(1)

	method opuesto() = izquierda

	method extremoOpuesto(position) = game.at(0, position.y())

}

object abajo {

	method siguiente(position) = position.down(1)

	method opuesto() = arriba

	method extremoOpuesto(position) = game.at(position.x(), game.height() - 1)

}

object arriba {

	method siguiente(position) = position.up(1)

	method opuesto() = abajo

	method extremoOpuesto(position) = game.at(position.x(), 0)

}

