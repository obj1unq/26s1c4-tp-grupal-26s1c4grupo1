

object marcador {
    var property position = game.at(18, 10) 

    var property puntos = 0

    method positionX() = game.width() - 3 

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
        position = game.at(self.positionX(), self.positionY())
    }
}