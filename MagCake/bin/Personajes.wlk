import wollok.game.*
import ConfiguracionInicial.*
import Fondos.*



//  Personajes

object chef{	
	var property position = game.at(0,0)
	const ingredientes = []
	method image() = "chef.png"
	
	method capturarIngrediente(ingrediente){
		ingredientes.add(ingrediente)
	}
	method perderIngrediente(){
		const elementoRandom = ingredientes.anyOne()
		ingredientes.remove(elementoRandom)
	}
	method ingredientes() = ingredientes
	
	//metodo aux
	method text(){
		const posicion = self.position()
		return "Mi posicion es: " + posicion + "Ingredientes: " + ingredientes
	}

		
}

object devorador{   
	var property position = game.at(20,5)
	
	method image() = "devorador.png"
	method moverseRandom(){
	const x = 0.randomUpTo(game.width()).truncate(0)
    const y = 0.randomUpTo(9).truncate(0)
	position = game.at(x,y)
	}
	
	method devorar(personaje) {
		if ( personaje.ingredientes().isEmpty() ) {
		game.say(self, "pobre de ingredientes")}
		else {
		personaje.perderIngrediente()
		game.say(self, "ñam ñam")
		}
	}	
	
	
	}
/* 
//	Agregados en pos en funcionalidad
class Invisible{
	var desplazamiento
	method position()= chef.position().up(11).right(desplazamiento)
}
const inv1 = new Invisible(desplazamiento = 0)
const inv2 = new Invisible(desplazamiento = 1)
const inv3 = new Invisible(desplazamiento = 2)
const inv4 = new Invisible(desplazamiento = 3)
*/

 
object invisible{
	method position() = chef.position().up(11) }
	
	
	
	
	
	
	
	
	
	
	
	
	
	