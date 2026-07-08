import letras.*
import puntos.*
import wollok.game.*
import niveles.*
import vidas.*

class SectorDeAgarre {
    
    var property position 

    method intentarAgarrar() {   
    const celda0 = game.getObjectsIn(self.position())
    const celda1 = game.getObjectsIn(game.at(self.position().x() + 1, self.position().y()))
    const celda2 = game.getObjectsIn(game.at(self.position().x() + 2, self.position().y()))
    
    const objetosEnZona = celda0 + celda1 + celda2
    
    const notaValida = objetosEnZona.findOrDefault(
        { visual => 
            try { 
                not visual.fueAtrapada()
            } catch e : wollok.lang.Exception { 
                false 
            } 
        }, null
    )

    if (notaValida != null) {
        notaValida.puntosAObtener() 
        self.removerNotaDelNivel(notaValida)
    }
}

    method removerNotaDelNivel(nota) {
        
        if (administradorDeVidas.nivelActual() == 1) nivel1.notasEnPantalla().remove(nota)
        if (administradorDeVidas.nivelActual() == 2) nivel2.notasEnPantalla().remove(nota)
        if (administradorDeVidas.nivelActual() == 3) nivel3.notasEnPantalla().remove(nota)
    }
}

