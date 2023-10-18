import wollok.game.*
import ConfiguracionInicial.*
import Fondos.*

class Ingrediente inherits Visual(position = new Position(x = 1.randomUpTo(70),y = 45)){
	//const capa
	
	method colisionadoPor(personaje) {
		personaje.capturarIngrediente(self)
		game.say(personaje, "A Casa")	
	}
	
	method caer(){ 
		game.onTick(1000, "caida", {self.position(position.down(1))})
	}

}

const Marmolado = new Ingrediente(image = "caidaCapa1_Marmolado.png")
const Chocolate = new Ingrediente(image = "caidaCapa1_Chocolate.png")
const Frutilla = new Ingrediente(image = "caidaCapa1_Frutilla.png")
const SabFrutilla = new Ingrediente(image = "caidaCapa2_Frutilla.png")
const Salsa = new Ingrediente(image = "caidaCapa3_Salsa.png")
const Arandano = new Ingrediente(image = "caidaCapa4_Arandano.png")
const Chocolatito = new Ingrediente(image = "caidaCapa4_Chocolate.png")
const Naranja = new Ingrediente(image = "caidaCapa4_Naranja.png")

object generador{
	const posibilidades = [Marmolado, Chocolate, Frutilla, SabFrutilla, 
		Salsa, Arandano, Chocolatito, Naranja]
		
		method insertarElemento(){
		if(posibilidades.isEmpty()){
			game.removeTickEvent("Generar")
		}
		else{ 
		const elemento = posibilidades.anyOne()
		game.addVisual(elemento)
		posibilidades.remove(elemento)
		elemento.caer()}
	}
}
