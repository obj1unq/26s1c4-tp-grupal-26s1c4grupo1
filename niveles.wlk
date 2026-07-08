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
    var property sectorA = null
    var property sectorW = null
    var property sectorS = null
    var property sectorD = null
    var property sectorSpace = null
    var contadorLetras = 0
    const property notasEnPantalla = []


    method iniciar(){
        game.clear()
        self.configurarFondo()
        self.configurarSectorDeAgarre()
        self.configurarTeclas()
        contadorLetras = 0
        notasEnPantalla.clear()
        
        marcador.reiniciar()
        game.addVisual(marcador)
        
        self.cargarNotas()
        self.iniciarMusica()

        self.iniciarVidas()

        game.onTick(120, "movimiento_global", { self.actualizarMovimiento() })
    }

    method actualizarMovimiento() {
        notasEnPantalla.forEach({ nota => nota.caer() })
        if (contadorLetras >= 10 and notasEnPantalla.isEmpty()) {
            self.ganarNivel()
        }
    }

    method ganarNivel() {
        
        game.removeTickEvent("movimiento_global")
        self.detenerMusica()
        game.clear()
        juego.cargarElMenu(menuGanaste)
    }

    method detenerMusica() {
            self.cancion().stop()

    }

    method cancion()

    method configurarFondo() {
        const fondoDelNivel = new Fondo(image = self.rutaImagen())
        game.addVisual(fondoDelNivel)
    }

    method configurarTeclas() {
        keyboard.a().onPressDo({ sectorA.intentarAgarrar() })
        keyboard.w().onPressDo({ sectorW.intentarAgarrar() })
        keyboard.s().onPressDo({ sectorS.intentarAgarrar() })
        keyboard.d().onPressDo({ sectorD.intentarAgarrar() })
        keyboard.space().onPressDo({ sectorSpace.intentarAgarrar() })

        // Esto vuelve al menú principal
        keyboard.r().onPressDo({ juego.cargarElMenu(menuPrincipal) })
    } 

    method configurarSectorDeAgarre(){
        sectorSpace = new SectorDeAgarre(position = game.at(0,7)) 
        sectorA     = new SectorDeAgarre(position = game.at(0,6)) 
        sectorW     = new SectorDeAgarre(position = game.at(0,4)) 
        sectorS     = new SectorDeAgarre(position = game.at(0,3)) 
        sectorD     = new SectorDeAgarre(position = game.at(0,1))
        
        const listaSectores = [sectorSpace, sectorA, sectorW, sectorS, sectorD]
        
        listaSectores.forEach({ sector => game.addVisual(sector) })
    }

    method rutaImagen()
    method cargarNotas() {
        const notasSpace = (1..5).map({ i => new TeclaSpace(position = game.at(19, 7)) })
        const notasA     = (1..5).map({ i => new TeclaA(position = game.at(19, 6)) })
        const notasW     = (1..5).map({ i => new TeclaW(position = game.at(19, 4)) })
        const notasS     = (1..5).map({ i => new TeclaS(position = game.at(19, 3)) })
        const notasD     = (1..5).map({ i => new TeclaD(position = game.at(19, 1)) })
        
        const todasLasNotas = notasSpace + notasA + notasW + notasS + notasD
        
        game.onTick(1000, "generador_notas", { self.lanzarTeclas(todasLasNotas) })
    }
     
    method iniciarMusica() 

    method lanzarTeclas(notas){
        const letrasMaximo = 10
        if (contadorLetras < letrasMaximo and not notas.isEmpty()) {
            const notaActual = notas.randomized().first()
            notas.remove(notaActual)
            game.addVisual(notaActual)
            notasEnPantalla.add(notaActual)
            contadorLetras += 1
        } else if (contadorLetras >= letrasMaximo) {
        game.removeTickEvent("generador_notas")
        }
    }

    method iniciarVidas() {
    administradorDeVidas.reiniciarVidas()
    const corazon1 = new Corazon(position = game.at(17, 8))
    const corazon2 = new Corazon(position = game.at(15, 8))
    const corazon3 = new Corazon(position = game.at(13, 8))
    game.addVisual(corazon1)
    game.addVisual(corazon2)
    game.addVisual(corazon3)
    administradorDeVidas.registrarCorazon(corazon1)
    administradorDeVidas.registrarCorazon(corazon2)
    administradorDeVidas.registrarCorazon(corazon3)
} 
                            
}
object nivel1 inherits Nivel {
    override method rutaImagen() = "nivel1.jpg"

    override method cancion() = game.sound("musicaNivel1.mp3") 

    override method iniciarMusica() {
        self.cancion().shouldLoop(true)
        self.cancion().volume(0.5)
        game.schedule(100, { self.cancion().play() })
    }
}

object nivel2 inherits Nivel {
    override method rutaImagen() = "nivel2.jpg"

    override method cancion() = game.sound("musicaNivel2.mp3")

    override method iniciarMusica() {
        self.cancion().shouldLoop(true)
        self.cancion().volume(0.5)
        game.schedule(100, { self.cancion().play() })
    }
}

object nivel3 inherits Nivel {
    override method rutaImagen() = "nivel3.jpg"
    override method cancion() = game.sound("musicaNivel3.mp3") 

    override method iniciarMusica() {
        self.cancion().shouldLoop(true)
        self.cancion().volume(0.5)
        game.schedule(100, { self.cancion().play() })
    }
}