import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel1.*
import direcciones.*
import indicadores.*

object nivelLlaves {

	method configurate() {
		// Fondos
		game.addVisual(new Fondo(position = game.at(0, 0), image = "arena2.png"))
			// -------------------------------------------------------------------------------
			// Elementos:
			// Monedas
		game.addVisual(new Moneda(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Moneda(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Moneda(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
			// Bananas
		game.addVisual(new Banana(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Banana(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Banana(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
			// Lingotes
		game.addVisual(new Lingote(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Lingote(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Lingote(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Lingote(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
			// Corazones
		game.addVisual(new Corazon(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Corazon(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Corazon(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Corazon(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
			// -----------------------------------------------------------------------------------
			// Textos
		game.addVisual(energia)
		game.addVisual(llaves)
		game.addVisual(salud)
		game.addVisual(dinero)
			// Personaje
		game.addVisual(pirata)
		self.restartPirata()
			// Teclado
		keyboard.right().onPressDo{ pirata.moverA(derecha)}
		keyboard.left().onPressDo{ pirata.moverA(izquierda)}
		keyboard.up().onPressDo{ pirata.moverA(arriba)}
		keyboard.down().onPressDo{ pirata.moverA(abajo)}
		keyboard.space().onPressDo{ pirata.agarrarObjetoAl(pirata.direccion())}
		keyboard.g().onPressDo({ self.ganar()})
		keyboard.p().onPressDo({ self.perder()})
		keyboard.r().onPressDo({ self.restart()})
		keyboard.any().onPressDo{ self.mostrarPuerta()}
		keyboard.any().onPressDo{ self.comprobarSiGane()}
		keyboard.o().onPressDo{ game.addVisual(puertaFinal)}
	// Colisiones
	}

	method perder() {
		game.clear()
		game.addVisual(new Fondo(position = game.at(0, 0), image = "gameOver.png"))
		game.schedule(3000, { game.stop()})
	}

	method ganar() {
		// es muy parecido al terminar() de nivelBloques
		// el perder() también va a ser parecido
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
			// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(position = game.at(0, 0), image = "arena2.png"))
			// después de un ratito ...
		game.schedule(2500, { game.clear()
				// cambio de fondo
			game.addVisual(new Fondo(position = game.at(0, 0), image = "ganasteElJuego.png"))
				// después de un ratito ...
			game.schedule(3000, { // fin del juego
			game.stop()})
		})
	}

	method restart() {
		game.clear()
		self.configurate()
	}

	method mostrarPuerta() {
		if (pirata.dinero() >= 100) game.addVisual(puertaFinal)
	}

	method comprobarSiGane() {
		if (pirata.entro()) self.ganar() else if (not pirata.tieneEnergia() or not pirata.tieneSalud()) self.perder()
	}

	method restartPirata() {
		pirata.energia(30)
		pirata.llaves(0)
	}

}

