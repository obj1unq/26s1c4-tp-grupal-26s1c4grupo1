class SectorDeAgarre {
 
    method agarrar() {
        const hayTecla = game.uniqueCollider(self)
        hayTecla.puntosAObtener()
        game.removeVisual(hayTecla)
        
    }


    method intentarAgarrar() {
        try {
        self.agarrar()
        } catch e : wollok.lang.Exception {
            
        }
    }
    
}

object sectorDeAgarreTeclaW inherits SectorDeAgarre {
    var property position = game.at(0,0)

}

object sectorDeAgarreTeclaA inherits SectorDeAgarre {
    var property position = game.at(0,0)
     
}

object sectorDeAgarreTeclaS inherits SectorDeAgarre {
    var property position = game.at(0,0)
     
}

object sectorDeAgarreTeclaD inherits SectorDeAgarre {
    var property position = game.at(0,0)
     
}
object sectorDeAgarreTeclaSpace inherits SectorDeAgarre {
    var property position = game.at(0,0)
     
}