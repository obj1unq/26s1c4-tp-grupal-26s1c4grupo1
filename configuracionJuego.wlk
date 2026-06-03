import juego.*
import direccionesRecuadro.*
import recuadroVerde.*


object juego {
  
  method direccionesRecuadro() {
    keyboard.up().onPressDo({recuadroVerde.mover(arriba)})
	keyboard.down().onPressDo({recuadroVerde.mover(abajo)})
  }
  
  
  
}   