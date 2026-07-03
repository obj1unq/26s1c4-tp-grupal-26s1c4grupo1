import puntos.*

class NotaMusical {
   var property position
   var property fueAtrapada = false
   const pasoDeMovimiento = 0.1

   method image() 

   method caer() {
    position = game.at(position.x() - pasoDeMovimiento, position.y())
    } 

    method iniciarMovimiento() {
     const velocidadRandom = (20..45).anyOne() 
     game.onTick(velocidadRandom, "caida_" + self.identity().toString(), { self.caer() })
    } 

    method detener() {
        game.removeTickEvent("caida_" + self.identity().toString())
    }

    method puntosAObtener() {
        marcador.sumar(100) 
    } 

    method puntosARestar() {
        marcador.restar(50) // Lo implemento otro dia
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