import letras.*
import puntos.*
import wollok.game.*
import niveles.*
import vidas.*
import juego.*

class SectorDeAgarre {
    var property position 

    method esAtrapable() = false

    method intentarAgarrar() {   
        const celda0 = game.getObjectsIn(self.position())
        const celda1 = game.getObjectsIn(game.at(self.position().x() + 1, self.position().y()))
        const celda2 = game.getObjectsIn(game.at(self.position().x() + 2, self.position().y()))
        
        const objetosEnZona = celda0 + celda1 + celda2
        
        const notaValida = objetosEnZona.findOrDefault(
            { visual => visual.esAtrapable() and not visual.fueAtrapada() }, 
            null
        )

        if (notaValida != null) {
            notaValida.puntosAObtener() 
            self.removerNotaDelNivel(notaValida)
        }
    }

    method removerNotaDelNivel(nota) {
        juego.nivelActual().notasEnPantalla().remove(self)
    }
}

