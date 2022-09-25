import wollok.game.*
import carpincho.*
import obstaculos.*
import items.*


object juego{

	method configurar(){
		game.width(12)
		game.height(8)
		game.title("Capy Game")
		game.addVisual(capy)
		game.addVisual(naranja)
		
<<<<<<< HEAD
	}		keyboard.space().onPressDo{ self.jugar()}
		
		game.onCollideDo(capy,{ obstaculo => obstaculo.chocar()})
=======
	}		
		keyboard.space().onPressDo{self.jugar()}
		game.onCollideDo(dino,{ obstaculo => obstaculo.chocar()})
>>>>>>> c1a91aac70b013c942d10ba0dca036814ad38e68
		
	} 
	
	method iniciar(){
		dino.iniciar()
		reloj.iniciar()
		cactus.iniciar()
	}
	
	method jugar(){
		game.removeVisual(gameOver)
		self.iniciar()
	}
	
	method terminar(){	
		capy.morir()
		if (not capy.estaVivo())
			game.addVisual(gameOver)
			obst.detener()
			puntuacin.detener()
			capy.morir()
	}
	
}

object gameOver {
	method position() = game.center()
	method text() = "GAME OVER"
	

}


object puntuacion {
	
	var puntos = 0
	
	method text() = puntos.toString()
	method position() = game.at(1, game.height()-1)
	
	method sumarPuntos() {
		puntos = puntos +1
	}
	method sumarPuntos(item) {
		puntos = puntos + item.puntos()
	}
	method iniciar(){
		puntos = 0
		game.onTick(100,"puntos",{self.sumarPuntos()})
	}
	method detener(){
		game.removeTickEvent("puntos")
	}
}
