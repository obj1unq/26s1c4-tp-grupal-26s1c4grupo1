import letras.*
import puntos.*


class SectorDeAgarre {
    
    var property position 

    method intentarAgarrar() {
        const posicionesDeZona = [
            self.position(),
            self.position().right(1)
        ]

        const objetosEnZona = posicionesDeZona.flatMap({ pos => game.getObjectsIn(pos) })

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
            self.agarrar(notaValida)
        }
    }
    
    method agarrar(nota) {
        nota.puntosAObtener()
        nota.detener()
        game.removeVisual(nota)
    }
    
}