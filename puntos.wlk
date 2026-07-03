object marcador {

    method position() = game.at(self.positionX(), self.positionY()) 

    var property puntos = 0
    
    method positionX() = game.width() - 2

    method positionY() = game.height() - 1

    method sumar(cantidad) {
        puntos += cantidad
    }

    method restar(cantidad) {
        puntos -= cantidad
    }
    
    method text() = "Puntaje: " + puntos.toString()

    method textColor() = "FFFFFF"

    method reiniciar() {
        puntos = 0
    }

}