import wollok.game.*
import fondo.*
import personajes.*
import direcciones.*
import elementos.*

object nivelLlaves {

	method configurate() {
		// fondo - es importante que sea el primer visual que se agregue
		game.addVisual(new Fondo(position = game.at(0, 0), image = "arena2.png"))
		// otros visuals, p.ej. bloques o llaves
		
		//-------------------------------------------------------------------------------
		//Solo para probar:
		//Dese aca ↓
		// Cofres
		game.addVisual(new Cofre(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Cofre(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Cofre(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		
		// Lingotes
		game.addVisual(new Lingote(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Lingote(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		game.addVisual(new Lingote(position = game.at((0 .. game.width()).anyOne(), (0 .. game.height()).anyOne())))
		//Hasta aca ↑ 
		//-----------------------------------------------------------------------------------
		
		// personaje, es importante que sea el último visual que se agregue
		game.addVisual(pirata)
		
		// teclado
		keyboard.right().onPressDo{ pirata.moverA(derecha)}
		keyboard.left().onPressDo{ pirata.moverA(izquierda)}
		keyboard.up().onPressDo{ pirata.moverA(arriba)}
		keyboard.down().onPressDo{ pirata.moverA(abajo)}	
		keyboard.g().onPressDo({ self.ganar()})
		keyboard.p().onPressDo({ self.perder()})
	    
	    // colisiones, acá sí hacen falta
	    //...............
	}

	method perder(){
		game.clear()
		game.addVisual(new Fondo(position = game.at(0, 0), image = "gameOver.png"))
		game.schedule(3000, {game.stop()})
		
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

}

