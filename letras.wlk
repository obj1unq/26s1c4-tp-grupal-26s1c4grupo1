import vidas.*
import vidas.Corazon
import puntos.*

class NotaMusical {
   var property position


   method image() 

   method caer() {
      position = game.at(position.x() - 1, position.y())
      if (position.x() < 2) {
            self.pasarseDeLargo()
        }
    } 

    method pasarseDeLargo() {
        game.removeTickEvent(self.nombreTick()) 
        game.removeVisual(self)
        administradorDeVidas.perderVida()                 
    }

    method nombreTick() = "caida_" + self.identity().toString()

    method iniciarMovimiento() {
     const velocidadRandom = (300..450).anyOne() 
     game.onTick(velocidadRandom, self.nombreTick(), { self.caer() })
    } 

    method puntosAObtener() {
        game.removeTickEvent(self.nombreTick())
        marcador.sumar(100) 
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