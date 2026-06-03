import wollok.game.*

class NotaMusical {
    var property position
    method image() = "notaVerde.png"
    method caer() {
        position = game.at(position.x(), position.y() - 1)
    }
}