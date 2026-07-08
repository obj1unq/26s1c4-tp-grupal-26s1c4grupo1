import vidas.administradorDeVidas
import puntos.*
import wollok.game.*

class NotaMusical {
   var property position
   var property fueAtrapada = false

   method image() 

   method onTickName() = "caida_" + self.identity().toString()

   method caer() {
     position = game.at(position.x() - 1, position.y())
     if (position.x() < 0) {
         self.pasarseDeLargo()
     }
} 

   method iniciarMovimiento() {
     const velocidadRandom = (5..9).anyOne() 
     game.onTick(velocidadRandom, "caida_" + self.identity().toString(), { self.caer() })
    } 

   method detener() {
        fueAtrapada = true
        try {
            game.removeTickEvent(self.onTickName())
        } catch e : wollok.lang.Exception { }
   }

   method puntosAObtener() {
        if (not fueAtrapada) {
            self.detener()          
            marcador.sumar(100)    
            game.removeVisual(self)
            game.sound("sonidoAgarrartecla.mp3").play() 
        } 
   }

   method pasarseDeLargo() {
        if (not fueAtrapada) {
            self.detener()
            game.removeVisual(self) 
            marcador.restar(50)            
            administradorDeVidas.perderVida() 
        }
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
