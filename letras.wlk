import vidas.administradorDeVidas
import puntos.*
import wollok.game.*
import niveles.*

class NotaMusical {
   var property position
   var property fueAtrapada = false

   method image() 

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
            self.detener() 
            marcador.sumar(100)   
            game.removeVisual(self)
            self.removerDeNotasEnPantalla()
            game.sound("sonidoAgarrartecla.mp3").play()
        } 
   }

   method pasarseDeLargo() {
        if (not fueAtrapada) {
            self.detener()
            game.removeVisual(self) 
            marcador.restar(50)            
            administradorDeVidas.perderVida() 
            self.removerDeNotasEnPantalla()
        }
   }

   method removerDeNotasEnPantalla() {
        if (administradorDeVidas.nivelActual() == 1) nivel1.notasEnPantalla().remove(self)
        if (administradorDeVidas.nivelActual() == 2) nivel2.notasEnPantalla().remove(self)
        if (administradorDeVidas.nivelActual() == 3) nivel3.notasEnPantalla().remove(self)
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
