import wollok.game.*
import fondo.*
import personajes.*
import elementos.*
import nivel2.*
import direcciones.*
//import textosVisibles.*

object nivelBloques {

	method configurate() {
		// Fondos y Depositos
		game.addVisual(new Fondo(position = game.at(0, 0), image = "arena2.png"))
		game.addVisual(new Deposito(position = game.at((0 .. game.width() - 3).anyOne(), (0 .. game.height() - 2).anyOne())))
		// textos informativos
		game.addVisual(corazon)
		//game.addVisual(salud)
		// Cofres
		game.addVisual(new Cofre(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Cofre(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Cofre(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		// Llaves
		game.addVisual(new Llave(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Llave(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Llave(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		// Pirata
		game.addVisual(pirata)
		// teclado
		
		// Flechas
		keyboard.right().onPressDo{ pirata.moverA(derecha)}
		keyboard.left().onPressDo{ pirata.moverA(izquierda)}
		keyboard.up().onPressDo{ pirata.moverA(arriba)}
		keyboard.down().onPressDo{ pirata.moverA(abajo)}
		// Especiales
		keyboard.space().onPressDo{ pirata.agarrarLlaveAl(pirata.direccion())} // Agarrar llave
		keyboard.t().onPressDo({ self.terminar()}) // Terminar
		keyboard.p().onPressDo({ self.perder()}) // Perder
		
		// Coliciones
		game.whenCollideDo(pirata, { elemento => elemento.moverA(pirata.direccion())})
	}

	method terminar() {
		// game.clear() limpia visuals, teclado, colisiones y acciones
		game.clear()
		// después puedo volver a agregar el fondo, y algún visual para que no quede tan pelado
		game.addVisual(new Fondo(position = game.at(0, 0), image = "arena2.png"))
		game.addVisual(pirata)
		// después de un ratito ...
		game.schedule(2500, { game.clear()
		// cambio de fondo
		game.addVisual(new Fondo(position = game.at(0, 0), image = "ganasteNivel1.png"))
		// después de un ratito ...
		// ... limpio todo de nuevo
		game.schedule(3000, { 
		game.clear()
		// y arranco el siguiente nivel
		nivelLlaves.configurate()
			})
		})
	}
	
	method perder(){
		game.clear()
		game.addVisual(new Fondo(position = game.at(0, 0), image = "gameOver.png"))
		game.schedule(3000, {game.stop()})
	}

}

