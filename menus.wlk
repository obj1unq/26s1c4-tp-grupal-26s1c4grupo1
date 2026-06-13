import recuadroVerde.*
import direccionesRecuadro.*
import niveles.*
import wollok.game.*

object menu {
  method image() = "menu1.jpg"   
  method position() = game.origin()
}

// object modoFacil {
//   method iniciar() {
//     game.removeVisual(menu)
//     game.addVisual(fondoNivel1)
//     game.addVisual(recuadroVerde)
//     keyboard.up().onPressDo({recuadroVerde.mover(arriba)})
// 	keyboard.down().onPressDo({recuadroVerde.mover(abajo)})
//   }
// }