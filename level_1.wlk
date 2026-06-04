import extras.*
import wollok.game.*

object level1 {
    method init(){
        game.clear()

        // Creo las notas con distintas posiciones en x (de 4 a 8)
        const notas = (4..8).map({ x => new NotaMusical(position = game.at(x, 10)) })

        // Agrego cada nota al juego
        notas.forEach({ nota => self.inicializarNota(nota) })
    }

    method inicializarNota(nota) {
        // Inicializamos la nota agregandola al tablero
        game.addVisual(nota)
        const velocidadRandom = (200..800).anyOne() // Velocidad random para la nota

        // Le asignamos una velocidad random provisional
        game.onTick(velocidadRandom, "movimiento_", { nota.caer() })
    }
}

// Despues cambiamos el movimiento de caer a que vayan hacia la derecha como el fondo