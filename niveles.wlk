import menus.*
import wollok.game.*
import letras.*
import puntos.*
import sectorDeAgarre.*

class Fondo {
    const property image
    method position() = game.origin()
}

class Nivel {
    method iniciar(){
        game.clear()
        self.configurarFondo()
        
        marcador.reiniciar()
        game.addVisual(marcador)
        
        self.cargarNotas()
        self.iniciarMusica()
    }

    method configurarFondo() {
        const fondoDelNivel = new Fondo(image = self.rutaImagen())
        game.addVisual(fondoDelNivel)
    }

    method configurarSectorDeAgarre ()


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
        const notasSpace = (1..5).map({ i => new TeclaSpace(position = game.at(14, 7)) })
        const notasA     = (1..5).map({ i => new TeclaA(position = game.at(14, 6)) })
        const notasW     = (1..5).map({ i => new TeclaW(position = game.at(14, 4)) })
        const notasS     = (1..5).map({ i => new TeclaS(position = game.at(14, 3)) })
        const notasD     = (1..5).map({ i => new TeclaD(position = game.at(14, 1)) })
        

        const todasLasNotas = notasA + notasW + notasS + notasD + notasSpace

        todasLasNotas.forEach({ nota => 
            game.addVisual(nota)
            nota.iniciarMovimiento() 
        })
    }
    override method configurarSectorDeAgarre(){
        sectorDeAgarreTeclaSpace.position(game.at(2,7))
        sectorDeAgarreTeclaA.position(game.at(2,6))
        sectorDeAgarreTeclaW.position(game.at(2,4))
        sectorDeAgarreTeclaS.position(game.at(2,3))
        sectorDeAgarreTeclaD.position(game.at(2,1))
        game.addVisual(sectorDeAgarreTeclaA)
        game.addVisual(sectorDeAgarreTeclaS)
        game.addVisual(sectorDeAgarreTeclaW)
        game.addVisual(sectorDeAgarreTeclaD)
        game.addVisual(sectorDeAgarreTeclaSpace)
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
        const notasSpace = (1..3).map({ i => new TeclaSpace(position = game.at(14, 8)) })
        const notasA = (1..3).map({ i => new TeclaA(position = game.at(14, 7)) })
        const notasW = (1..3).map({ i => new TeclaW(position = game.at(14, 5)) })
        const notasS = (1..3).map({ i => new TeclaS(position = game.at(14, 3)) })
        const notasD = (1..3).map({ i => new TeclaD(position = game.at(14, 1)) })
        
        const todasLasNotas = notasSpace + notasA + notasW + notasS + notasD
        
        todasLasNotas.forEach({ nota => 
            game.addVisual(nota)
            nota.iniciarMovimiento()
        })
    }

    override method configurarSectorDeAgarre(){
        sectorDeAgarreTeclaSpace.position(game.at(2,8))
        sectorDeAgarreTeclaA.position(game.at(2,7))
        sectorDeAgarreTeclaW.position(game.at(2,5))
        sectorDeAgarreTeclaS.position(game.at(2,3))
        sectorDeAgarreTeclaD.position(game.at(2,1))
        game.addVisual(sectorDeAgarreTeclaA)
        game.addVisual(sectorDeAgarreTeclaS)
        game.addVisual(sectorDeAgarreTeclaW)
        game.addVisual(sectorDeAgarreTeclaD)
        game.addVisual(sectorDeAgarreTeclaSpace)
    }
}

object nivel3 inherits Nivel {
    override method rutaImagen() = "nivel3.jpg"
    override method iniciarMusica() {}
    override method cargarNotas() {}
    override method configurarSectorDeAgarre(){}
}