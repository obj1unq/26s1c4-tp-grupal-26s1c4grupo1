import wollok.game.*

class NotaMusical {
    var property position
    
    method image() = "notaVerde.png"
    
    method caer() {
        position = game.at(position.x(), position.y() - 1)
    }

    method serTocada() {
        game.removeVisual(self)
    }
}

object receptorVerde {
    var property position = game.at(5, 1)
    method image() = "image.png"
}

object barraEnergia {
    var property puntos = 0
    var property position = game.at(1, 8)
    const puntosMaximos = 500
  
    method image() {
        const nivel = (puntos * 5 / puntosMaximos).min(5)
        return "barra_" + nivel.toString() + ".png"
    }
  
    method sumar(cantidad) {
        puntos += cantidad
    }
  
    method reiniciar() {
        puntos = 0
    }

    method text() = "Puntos: " + puntos.toString()

}
