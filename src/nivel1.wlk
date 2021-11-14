import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import direcciones.*

object nivelBloques {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(image = "arena2.png"))
		game.addVisual(new Deposito(position = game.at((0 .. game.width() - 2).anyOne(), (0 .. game.height() - 1).anyOne())))
			// otros visuals, p.ej. bloques o llaves
		game.addVisual(new Cofre(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Cofre(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Cofre(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
			// Laves
		game.addVisual(new Llave(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
			// personaje, es importante que sea el último visual que se agregue
		game.addVisual(pirata)
			// teclado
			// este es para probar, no es necesario dejarlo
		keyboard.t().onPressDo({ self.terminar()})
			// en este no hacen falta colisiones
		keyboard.right().onPressDo{ pirata.moverA(derecha)}
		keyboard.left().onPressDo{ pirata.moverA(izquierda)}
		keyboard.up().onPressDo{ pirata.moverA(arriba)}
		keyboard.down().onPressDo{ pirata.moverA(abajo)}
		keyboard.space().onPressDo{ pirata.agarrarLlave(game.getObjectsIn(pirata.position().right(1)))}
		game.whenCollideDo(pirata, { elemento => elemento.moverA(pirata.direccion())})
	}

	method terminar() {
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
			// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(image = "arena2.png"))
		game.addVisual(pirata)
			// después de un ratito ...
		game.schedule(2500, { game.clear()
				// cambio de fondo
			game.addVisual(new Fondo(image = "finNivel1.png"))
				// después de un ratito ...
			game.schedule(3000, { // ... limpio todo de nuevo
				game.clear()
					// y arranco el siguiente nivel
				nivelLlaves.configurate()
			})
		})
	}

}

