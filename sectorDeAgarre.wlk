import letras.*
import puntos.*
import wollok.game.*

class SectorDeAgarre {
    
    var property position 

    method intentarAgarrar() {
        const chocando = game.colliders(self)
        const notaValida = chocando.findOrDefault(
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
        }
    }
}

