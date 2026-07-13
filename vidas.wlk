import juego.*
import menus.*

class Corazon {
    var property position  
    var property image = "corazonFinal1.png"     
}

object administradorDeVidas {
    const property corazones = []
    var property nivelActual = 0

    method registrarCorazon(corazon) {
        corazones.add(corazon)
    }

    method perderVida() {
        if (not corazones.isEmpty()) {
            const corazonAPerder = corazones.last()
            corazonAPerder.image("corazon_gris_Final.png") 
            corazones.remove(corazonAPerder) 
            game.sound("perderVida.mp3").play()
            if (corazones.isEmpty()) {
                self.perderJuego()
            }
        }
    }

    method perderJuego() {
        game.clear() 
        juego.pausarMusicaNivel(nivelActual)
        game.sound("perderAudio.mp3").play()
        const menuGameOver = new MenuGameOver(nivelActual = self.nivelActual())
        juego.cargarElMenu(menuGameOver)
    }

    method reiniciarVidas() {
        corazones.clear()
    }
}