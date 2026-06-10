import recuadroVerde.*
import direccionesRecuadro.*


object juego {
  
  
  method iniciar() {
    game.width(10)
    game.height(10)
    game.title("Guitar Hero")
    game.addVisual(menu)
    keyboard.num1().onPressDo({modoFacil.iniciar()})
    game.start()

  }
  

}   


object menu {
  method image() = "menu1.jpg"   
  method position() = game.origin()
}
//revisar para no repetir codigo
object fondoNivel1 {
    method image() = "fondoGuitar.jpg"   
    method position() = game.origin()
}

object modoFacil {
  method iniciar() {
    game.removeVisual(menu)
    game.addVisual(fondoNivel1)
    game.addVisual(recuadroVerde)
    keyboard.up().onPressDo({recuadroVerde.mover(arriba)})
	keyboard.down().onPressDo({recuadroVerde.mover(abajo)})
  }
} //revisar como hacer para que ya aparezcan las teclas