import extras.*
import wollok.game.*

object level1 {
    method init(){
        game.clear()

        // Creo las notas con distintas posiciones en x (de 4 a 8)
        const notas = (4..8).map({ x => new NotaMusical(position = game.at(x, 10)) })

        // Agrego cada nota al juego
        notas.forEach({ nota => game.addVisual(nota) })

        // Le aplico el movimiento de caer a cada nota
        game.onTick(1000, "movimiento de nota", { notas.forEach({ nota => nota.caer() }) })
    }
}

// Despues cambiamos el movimiento de caer a que vayan hacia la derecha como el fondo