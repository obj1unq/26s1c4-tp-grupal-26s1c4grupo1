class SectorDeAgarre {
    
    var property position 

    method agarrar() {
        const hayTecla = game.uniqueCollider(self)
        hayTecla.puntosAObtener()
        game.removeVisual(hayTecla)
        
    }


    method intentarAgarrar() {
        try {
            self.agarrar()
        } catch e : wollok.lang.Exception {
            // Vacio
        }
    }
    
}

class SectorDeAgarreTeclaW inherits SectorDeAgarre {
    

}

class SectorDeAgarreTeclaA inherits SectorDeAgarre {
    
     
}

class SectorDeAgarreTeclaS inherits SectorDeAgarre {
    
     
}

class SectorDeAgarreTeclaD inherits SectorDeAgarre {
    
     
}
class SectorDeAgarreTeclaSpace inherits SectorDeAgarre {
    
     
}