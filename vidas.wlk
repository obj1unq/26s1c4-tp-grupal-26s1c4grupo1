import puntos.marcador
import sectorDeAgarre.*
import juego.*
import menus.*

class Corazon {
    var property position  
    method image() = "corazonFinal1.png"     
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
        keyboard.r().onPressDo({ juego.cargarElMenu(menuPrincipal) })
        const cartelGameOver = object {
            var property position = game.at(game.width() / 2 - 2, game.height() / 2)
            method text() = "¡GAME OVER! Presioná R para reiniciar"
            method textColor() = "FF0000" // Rojo
        }
        game.addVisual(cartelGameOver)
    }

    method reiniciarVidas() {
        corazones.clear()
    }
}
