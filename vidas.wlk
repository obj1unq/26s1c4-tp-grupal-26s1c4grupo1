import juego.*
import menus.*

class Corazon {
    var property position  
    var property image = "corazonFinal1.png"     
}

class PantallaGameOver {
    method image() = "fondePerdida.png" 
    method position() = game.origin() 
}

object administradorDeVidas {
    const property corazones = []

    method registrarCorazon(corazon) {
        corazones.add(corazon)
    }

    method perderVida() {
        if (not corazones.isEmpty()) {
            const corazonAPerder = corazones.last()
            corazonAPerder.image("corazon_gris_Final.png") 
            corazones.remove(corazonAPerder) 
            if (corazones.isEmpty()) {
                self.perderJuego()
            }
        }
    }
    
    method perderJuego() {
    game.clear() 
    const fondoGameOver = new PantallaGameOver()
    game.addVisual(fondoGameOver)
    keyboard.r().onPressDo({ 
        juego.cargarElMenu(menuPrincipal) 
    })
}

    method reiniciarVidas() {
        corazones.clear()
    }
}