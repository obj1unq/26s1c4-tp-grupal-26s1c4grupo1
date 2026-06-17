class SectorDeAgarre {
 
    method agarrar() {
        const hayTecla = game.uniqueCollider(self)
        if(hayTecla != null) {
            hayTecla.puntosAObtener()
            game.removeVisual(hayTecla)
        }
    }

    method intentarAgarrar() {
        try {
        self.agarrar()
        } catch e : wollok.lang.Exception {
        console.printString()
        }
    }
    
}

object sectorDeAgarreTeclaW inherits SectorDeAgarre {
    var property position = game.at(2,6)

}

object sectorDeAgarreTeclaA inherits SectorDeAgarre {
    var property position = game.at(2,7)
     
}

object sectorDeAgarreTeclaS inherits SectorDeAgarre {
    var property position = game.at(2,8)
     
}

object sectorDeAgarreTeclaD inherits SectorDeAgarre {
    var property position = game.at(2,9)
     
}