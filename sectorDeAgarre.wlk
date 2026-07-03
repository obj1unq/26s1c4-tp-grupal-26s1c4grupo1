import puntos.*
class SectorDeAgarre {
    
    var property position 

    method agarrar() {
        const hayTecla = game.uniqueCollider(self)
        if (hayTecla != null) {
            hayTecla.puntosAObtener() 
            game.removeVisual(hayTecla)
        } else {
            marcador.sumar(-50) 
        }
        
    }


    method intentarAgarrar() {
        self.agarrar()
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