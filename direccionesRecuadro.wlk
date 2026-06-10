object tablero {
    method dentro(position) {
        return position.y().between(0, game.height() -2) 
    }
}

object abajo {
    method siguiente(position) {
        return position.down(1)
    }
}

object arriba {
    method siguiente(position) {
        return position.up(1)
    }
}