import menus.*
import wollok.game.*

class Fondo {
    const property image
    method position() = game.origin()
}

class Nivel {
    method iniciar(){
        game.clear()
        self.configurarFondo()
        // self.cargarNotas()
        // self.iniciarMusica()
        // Los metodos de cargarNotas e iniciarMusica hay que implementarlos
    }

    method configurarFondo() {
        const fondoDelNivel = new Fondo(image = self.rutaImagen())
        game.addVisual(fondoDelNivel)
    }

    method rutaImagen()

}
object nivel1 inherits Nivel {
    override method rutaImagen() = "nivel1.jpg"
}

object nivel2 inherits Nivel {
    override method rutaImagen() = "nivel2.jpg"
}

object nivel3 inherits Nivel {
    override method rutaImagen() = "nivel3.jpg"
}