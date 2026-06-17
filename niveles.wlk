import menus.*
import wollok.game.*
import letras.*

class Fondo {
    const property image
    method position() = game.origin()
}

class Nivel {
    method iniciar(){
        game.clear()
        self.configurarFondo()
        self.cargarNotas()
        self.iniciarMusica()
    }

    method configurarFondo() {
        const fondoDelNivel = new Fondo(image = self.rutaImagen())
        game.addVisual(fondoDelNivel)
    }

    method rutaImagen()
    method cargarNotas() 
    method iniciarMusica() 
}
object nivel1 inherits Nivel {
    override method rutaImagen() = "nivel1.jpg"

    const cancion = game.sound("musicaNivel1.mp3") // Tenemos que ver que cancion elejimos

    override method iniciarMusica() {
        cancion.shouldLoop(true)
        cancion.volume(0.5)
        game.schedule(100, { cancion.play() })
    }

    override method cargarNotas() {
        const notasA = (1..5).map({ i => new TeclaA(position = game.at(10, 7)) })
        const notasW = (1..5).map({ i => new TeclaW(position = game.at(10, 6)) })
        const notasS = (1..5).map({ i => new TeclaS(position = game.at(10, 8)) })
        const notasD = (1..5).map({ i => new TeclaD(position = game.at(10, 9)) })

        const todasLasNotas = notasA + notasW + notasS + notasD

        todasLasNotas.forEach({ nota => 
            game.addVisual(nota)
            nota.iniciarMovimiento() 
        })
    }
}

object nivel2 inherits Nivel {
    override method rutaImagen() = "nivel2.jpg"

    const cancion = game.sound("musicaNivel2.mp3")

    override method iniciarMusica() {
        cancion.shouldLoop(true)
        cancion.volume(0.5)
        game.schedule(100, { cancion.play() }) // este tengo duda si no ponerlo en la clase porque se repite codigo
    }

    override method cargarNotas() {
        const notasA = (1..3).map({ i => new TeclaA(position = game.at(10, 7)) })
        const notasW = (1..3).map({ i => new TeclaW(position = game.at(10, 6)) })
        
        const todasLasNotas = notasA + notasW
        
        todasLasNotas.forEach({ nota => 
            game.addVisual(nota)
            nota.iniciarMovimiento()
        })
    }
}

object nivel3 inherits Nivel {
    override method rutaImagen() = "nivel3.jpg"
    override method iniciarMusica() {}
    override method cargarNotas() {}
}