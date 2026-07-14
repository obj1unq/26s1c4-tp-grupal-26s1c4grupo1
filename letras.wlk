import vidas.administradorDeVidas
import puntos.*
import wollok.game.*
import niveles.*
import juego.*

class NotaMusical {
   var property position
   var property fueAtrapada = false

   method image() 

   method esAtrapable() = true

   method caer() {
    if (fueAtrapada) {}
    position = game.at(position.x() - 1, position.y()) 
    if (position.x() < 0) { 
        self.pasarseDeLargo() 
    }
   }

   method detener() {
        fueAtrapada = true
   }

   method puntosAObtener() {
        if (not fueAtrapada) {
            self.eliminarNota()
            marcador.sumar(100)   
            game.sound("agarrarTecla.mp3").play()
        } 
   }

   method pasarseDeLargo() {
        if (not fueAtrapada) {
            self.eliminarNota()
            marcador.restar(50)            
            administradorDeVidas.perderVida() 
        }
   }

    method eliminarNota() {
        self.detener()
        game.removeVisual(self)
        self.removerDeNotasEnPantalla()
    }

   method removerDeNotasEnPantalla() {
        juego.nivelActual().notasEnPantalla().remove(self)
   }
}



class TeclaA inherits NotaMusical{
  override method image() = "tecla_aFin.png"
}

class TeclaW inherits NotaMusical {
    override method image() = "tecla_wFin.png"
}

class TeclaS inherits NotaMusical{
    override method image() = "tecla_sFin.png"
}

class TeclaD inherits NotaMusical {
    override method image() = "tecla_dFin.png"
}
class TeclaSpace inherits NotaMusical {
    override method image() = "tecla_dSpace.png"
}

class TeclaCurativa inherits NotaMusical{
    override method image() = "heal.png" 

    override method puntosAObtener() {
        if (not fueAtrapada) {
            self.eliminarNota()
            marcador.sumar(150) 
            administradorDeVidas.ganarVida() 
        }
    }

    override method pasarseDeLargo() {
        if (not fueAtrapada) {
            self.eliminarNota()
        }
    }
}

class TeclaBomba inherits NotaMusical {
    override method image() = "teclaBomba.png" 

    override method puntosAObtener() {
        if (not fueAtrapada) {
            self.eliminarNota()
            marcador.restar(150)
            
            // Le pasamos como parametros "false" para que no reproduzca el sonido de perder vida comun
            administradorDeVidas.perderVida(false)  
            game.sound("teclaBomba.mp3").play() 
        }
    }

    override method pasarseDeLargo() {
        if (not fueAtrapada) {
            self.eliminarNota()
        }
    }
}