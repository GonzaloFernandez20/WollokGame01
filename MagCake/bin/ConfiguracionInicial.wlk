import wollok.game.*
import Personajes.*
import Fondos.*
import AquellosQueCaen.*
import Factory.*

object partida {
	
//      Dimensiones
		//const altoPiso = 10
		const anchoTablero = 75
		const altoTablero = 50
	
	method iniciarJuego(){
//      Configuracion inicial del juego
		
		game.title("Operacion CupCakes")
		game.boardGround("PantallaInicio.png")
		game.cellSize(20)
		game.height(altoTablero)
		game.width(anchoTablero)
		
		game.addVisual(chef)
		
		keyboard.enter().onPressDo{self.escenario1()}
		keyboard.i().onPressDo { game.say(chef, "hola!") }
	}
	
	method escenario1(){
		game.clear()
		game.addVisual(new Visual( image = "FondoBase.png", position = game.origin()) )
		game.cellSize(20)
		game.height(altoTablero)
		game.width(anchoTablero)
		
		[Receta1, Receta2, Receta3].forEach{it => game.addVisual(it)}
		
		keyboard.enter().onPressDo{self.escenario2()}
	}
	
 	
	
	method escenario2(){
		
		game.clear()
		game.addVisual(new Visual( image = "FondoCaida.png", position = game.origin()) )
		game.cellSize(20)
		game.height(altoTablero)
		game.width(anchoTablero)	
		
//      Personajes		
		game.addVisualCharacter(chef)
		game.addVisual(devorador)
		game.addVisual(invisible)
		
		
		game.onTick(3000, "Generar", {
			generador.insertarElemento()
		})
		
	
		game.onTick(4000,"movimiento", {
		devorador.moverseRandom()
		})
		
		
		game.whenCollideDo(invisible, {elemento => 
			elemento.colisionadoPor(chef)
			game.removeVisual(elemento) 
			
		})
		
		game.whenCollideDo(devorador, {i =>
			devorador. devorar(i)
		})
	}
	
	
}
