import juego.*
import menus.*

class Corazon {
    var property position  
    var property image = "corazonFinal1.png"     
}

object administradorDeVidas {
    const property corazones = []
    const corazonesMaximos = []
    var property nivelActual = 0

    method registrarCorazon(corazon) {
        corazones.add(corazon)
        corazonesMaximos.add(corazon)
    }

    method perderVida() {
        self.perderVida(true)
    }

    method perderVida(reproducirSonido) {
        if (not corazones.isEmpty()) {
            const corazonAPerder = corazones.last()
            corazonAPerder.image("corazon_gris_Final.png") 
            corazones.remove(corazonAPerder) 

            // Reproduce el sonido de perder vida si tiene que hacerlo (cuando se agarra una TeclaBomba suena otro sonido)
            if (reproducirSonido) {
                game.sound("perderVida.mp3").play()
            }

            if (corazones.isEmpty()) {
                self.perderJuego()
            }
        }
    }

    method ganarVida() {
        if (corazones.size() < 3) {
            const corazonARecuperar = corazonesMaximos.get(corazones.size())
            corazonARecuperar.image("corazonFinal1.png") 
            corazones.add(corazonARecuperar)             
            game.sound("heal2.mp3").play()        
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
        corazonesMaximos.clear()
    }
}