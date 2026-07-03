import menus.*
import wollok.game.*
import letras.*
import puntos.*
import sectorDeAgarre.*
import juego.*
import vidas.*

class Fondo {
    const property image
    method position() = game.origin()
}

class Nivel {
    method cancion()
    method iniciar(){
        game.clear()
        self.configurarFondo()
        self.configurarTeclas()
        
        marcador.reiniciar()
        game.addVisual(marcador)
        
        self.cargarNotas()
        self.iniciarMusica()

        self.IniciarVidas()
    }

    method configurarFondo() {
        const fondoDelNivel = new Fondo(image = self.rutaImagen())
        game.addVisual(fondoDelNivel)
    }

    method configurarTeclas() {
        keyboard.a().onPressDo({ SectorDeAgarreTeclaA.intentarAgarrar() })
        keyboard.w().onPressDo({ SectorDeAgarreTeclaW.intentarAgarrar() })
        keyboard.s().onPressDo({ SectorDeAgarreTeclaS.intentarAgarrar() })
        keyboard.d().onPressDo({ SectorDeAgarreTeclaD.intentarAgarrar() })
        keyboard.space().onPressDo({ SectorDeAgarreTeclaSpace.intentarAgarrar() })
        keyboard.r().onPressDo({ juego.cargarElMenu(menuPrincipal) })
    } 

    method configurarSectorDeAgarre ()


    method rutaImagen()
    method cargarNotas() 
    method iniciarMusica() {
        self.cancion().shouldLoop(true)
        self.cancion().volume(0.5)
        game.schedule(100, { self.cancion().play() })
    }    

    method lanzarTeclas(notas){
        var contador = 0
        const letrasMaximo = 10
        if ( contador < letrasMaximo) {
            const notaActual = notas.randomized().first()
            notas.remove(notaActual)
            game.addVisual(notaActual)
            notaActual.iniciarMovimiento()
            contador += 1
        } else {
            game.removeTickEvent("generador_notas")
        }
    }

    method IniciarVidas() {
        game.addVisual(new Corazon(position = game.at(17,8)))
        game.addVisual(new Corazon(position = game.at(15,8)))
        game.addVisual(new Corazon(position = game.at(13,8)))
       
    } 
                            
}
object nivel1 inherits Nivel {
    override method rutaImagen() = "nivel1.jpg"

    override method cancion() = game.sound("musicaNivel1.mp3")


    override method cargarNotas() {
        const notasSpace = (1..5).map({ i => new TeclaSpace(position = game.at(14, 7)) })
        const notasA     = (1..5).map({ i => new TeclaA(position = game.at(14, 6)) })
        const notasW     = (1..5).map({ i => new TeclaW(position = game.at(14, 4)) })
        const notasS     = (1..5).map({ i => new TeclaS(position = game.at(14, 3)) })
        const notasD     = (1..5).map({ i => new TeclaD(position = game.at(14, 1)) })
        
        
        const todasLasNotas = notasA + notasW + notasS + notasD + notasSpace
        var contador = 0
        const letrasMaximo = 10

        game.onTick(1500, "generador_notas", { self.lanzarTeclas(todasLasNotas) })    
    
    } 


    override method configurarSectorDeAgarre(){
        const sectorDeAgarreTeclaSpace = new SectorDeAgarreTeclaSpace(position = game.at(2,7)) 
        const sectorDeAgarreTeclaA = new SectorDeAgarreTeclaSpace(position = game.at(2,6)) 
        const sectorDeAgarreTeclaW = new SectorDeAgarreTeclaSpace(position = game.at(2,4)) 
        const sectorDeAgarreTeclaS = new SectorDeAgarreTeclaSpace(position = game.at(2,3)) 
        const sectorDeAgarreTeclaD = new SectorDeAgarreTeclaSpace(position = game.at(2,1)) 
        const sectoresDeAgarre = #{sectorDeAgarreTeclaSpace, sectorDeAgarreTeclaA, sectorDeAgarreTeclaW, sectorDeAgarreTeclaS, sectorDeAgarreTeclaD}
        
        sectoresDeAgarre.forEach({ sector => game.addVisual(sector) })
    }
}

object nivel2 inherits Nivel {
    override method rutaImagen() = "nivel2.jpg"

    override method cancion() = game.sound("musicaNivel2.mp3")

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
        const sectorDeAgarreTeclaSpace = new SectorDeAgarreTeclaSpace(position = game.at(2,7)) 
        const sectorDeAgarreTeclaA = new SectorDeAgarreTeclaSpace(position = game.at(2,6)) 
        const sectorDeAgarreTeclaW = new SectorDeAgarreTeclaSpace(position = game.at(2,4)) 
        const sectorDeAgarreTeclaS = new SectorDeAgarreTeclaSpace(position = game.at(2,3)) 
        const sectorDeAgarreTeclaD = new SectorDeAgarreTeclaSpace(position = game.at(2,1)) 
        
        sectorDeAgarreTeclaSpace.position() //game.at(2,8)
        sectorDeAgarreTeclaA.position() //game.at(2,7)
        sectorDeAgarreTeclaW.position() //game.at(2,5)
        sectorDeAgarreTeclaS.position() //game.at(2,3)
        sectorDeAgarreTeclaD.position() //game.at(2,1)
        game.addVisual(sectorDeAgarreTeclaA)
        game.addVisual(sectorDeAgarreTeclaS)
        game.addVisual(sectorDeAgarreTeclaW)
        game.addVisual(sectorDeAgarreTeclaD)
        game.addVisual(sectorDeAgarreTeclaSpace)
    }
}

object nivel3 inherits Nivel {
    override method cancion() = game.sound("musicaNivel3.mp3")
    override method rutaImagen() = "nivel3.jpg"
    override method iniciarMusica() {}
    override method cargarNotas() {}
    override method configurarSectorDeAgarre(){}
}