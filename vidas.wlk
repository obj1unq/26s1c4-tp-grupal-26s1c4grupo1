import juego.*
import menus.*

class Corazon {
    var property position  
    var property image = "corazonFinal1.png"     
}

object administradorDeVidas {
    const property corazones = []
    var property nivelActual = null

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
        game.sound("perder.mp3").play()
        game.clear() 
        const fondoGameOver = new MenuGameOver(nivelActual = self.nivelActual())
        juego.cargarElMenu(fondoGameOver)
    }

    method reiniciarVidas() {
        corazones.clear()
    }
}