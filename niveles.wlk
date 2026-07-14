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
    method esAtrapable() = false
}

class Nivel {
    var property sectorA = null
    var property sectorW = null
    var property sectorS = null
    var property sectorD = null
    var property sectorSpace = null
    var contadorLetras = 0
    var property nivelActual = 0
    const property notasEnPantalla = []

    method iniciar(){
        game.clear()
        contadorLetras = 0
        self.configurarFondo()
        self.configurarSectorDeAgarre()
        self.configurarTeclas()

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
        if (contadorLetras >= self.letrasMaximo() and notasEnPantalla.isEmpty()) {
            self.ganarNivel()
        }
    }

    method letrasMaximo()

    method ganarNivel() {
        game.clear()
        juego.pausarMusicaNivel(nivelActual)
        const menuGanaste = new MenuGanaste(nivelActual = self.nivelActual())
        juego.cargarElMenu(menuGanaste)
    }

    method pausarMusica() {
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
        keyboard.r().onPressDo({ juego.cargarElMenu(menuPrincipal) juego.pausarMusicaNivel(nivelActual) })
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
        game.onTick(self.velocidadTics(), "generador_notas", { self.lanzarTeclaAleatoria() })
    }

    method lanzarTeclaAleatoria() {
        if (contadorLetras < self.letrasMaximo()) {
            const carril = [1, 2, 3, 4, 5].randomized().first()
            const nuevaNota = self.crearNotaParaCarril(carril)

            game.addVisual(nuevaNota)
            notasEnPantalla.add(nuevaNota)
            contadorLetras += 1
        } else {
            game.removeTickEvent("generador_notas")
        }
    }

    // Método auxiliar para crear la nota específica según el carril seleccionado
    method crearNotaParaCarril(carril) {
        if (carril == 1) return self.crearNotaAleatoria(7, "space")
        if (carril == 2) return self.crearNotaAleatoria(6, "a")
        if (carril == 3) return self.crearNotaAleatoria(4, "w")
        if (carril == 4) return self.crearNotaAleatoria(3, "s")
        return self.crearNotaAleatoria(1, "d")
    }
    
    // Método auxiliar para decidir si nace una tecla normal, una curativa o una bomba
    method crearNotaAleatoria(y, tipo) {
        const numeroAleatorio = (1..30).anyOne() 
        
        if (self.chanceCuracion().contains(numeroAleatorio)) { // Probabilidad Tecla Curativa
            return new TeclaCurativa(position = game.at(19, y))
        } else if (self.chanceBomba().contains(numeroAleatorio)) { // Probabilidad Tecla Bomba
            return new TeclaBomba(position = game.at(19, y))
        } else { // El resto teclas comunes
            if (tipo == "space") return new TeclaSpace(position = game.at(19, y))
            if (tipo == "a") return new TeclaA(position = game.at(19, y))
            if (tipo == "w") return new TeclaW(position = game.at(19, y))
            if (tipo == "s") return new TeclaS(position = game.at(19, y))
            return new TeclaD(position = game.at(19, y))
        }
    }

    method chanceCuracion()

    method chanceBomba() 

    method velocidadTics()

    method iniciarMusica() {
        self.cancion().shouldLoop(true)
        self.cancion().volume(0.5)
        game.schedule(0, { self.cancion().play() })
    }

    method lanzarTeclas(notas){
        if (contadorLetras < self.letrasMaximo() and not notas.isEmpty()) {
            const notaActual = notas.randomized().first()
            notas.remove(notaActual)
            game.addVisual(notaActual)
            notasEnPantalla.add(notaActual)
            contadorLetras += 1
        } else if (contadorLetras >= self.letrasMaximo()) {
        game.removeTickEvent("generador_notas")
        }
    }

    method iniciarVidas() {
    administradorDeVidas.reiniciarVidas()
    const corazon1 = new Corazon(position = game.at(17, 8))
    const corazon2 = new Corazon(position = game.at(15, 8))
    const corazon3 = new Corazon(position = game.at(13, 8))
    const corazones = [corazon1, corazon2, corazon3]
    corazones.forEach({ corazon => game.addVisual(corazon) administradorDeVidas.registrarCorazon(corazon) })
    } 
}

object nivel1 inherits Nivel {
    override method letrasMaximo() = 215

    override method velocidadTics() = 1000

    override method rutaImagen() = "nivel1.jpg"
    
    const cancion = game.sound("nivel1.mp3") 

    override method cancion() = cancion

    override method chanceCuracion() = 1..2
    
    override method chanceBomba() = 0..0
}

object nivel2 inherits Nivel {
    override method letrasMaximo() = 280

    override method velocidadTics() = 750

    override method rutaImagen() = "nivel2.jpg"

    const cancion = game.sound("nivel2.mp3")

    override method cancion() = cancion

    override method chanceCuracion() = 1..1
    
    override method chanceBomba() = 2..3
}

object nivel3 inherits Nivel {
    override method letrasMaximo() = 420

    override method velocidadTics() = 500

    override method rutaImagen() = "nivel3.jpg"

    const cancion = game.sound("nivel3.mp3")

    override method cancion() = cancion

    override method chanceCuracion() = 1..1
    
    override method chanceBomba() = 1..6
}