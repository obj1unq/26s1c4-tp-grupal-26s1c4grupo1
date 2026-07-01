import puntos.*

class NotaMusical {
   var property position


   method image() 

   method caer() {
    position = game.at(position.x() - 1, position.y())
    } 

    method iniciarMovimiento() {
     const velocidadRandom = (300..450).anyOne() 
     game.onTick(velocidadRandom, "caida_" + self.identity().toString(), { self.caer() })
    } 

    method puntosAObtener() {
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