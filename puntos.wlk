object marcador {
    
    var property position = game.at(13,14) 

    var property puntos = 0
    
    method sumar(cantidad) {
        puntos += cantidad

    }
    
    method text() = "Puntos: " + puntos.toString()

    method textColor() = "FFFFFF"

    method reiniciar() {
        puntos = 0
    }

}