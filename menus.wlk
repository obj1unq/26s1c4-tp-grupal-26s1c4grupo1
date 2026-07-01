import direccionesRecuadro.*
import niveles.*
import wollok.game.*
import juego.*

class Menu {
  method image()
  method position()
  method configurarMenu()
}

object menuPrincipal inherits Menu{
  override method image() = "menuPrincipal.jpg"   
  override method position() = game.origin()

  override method configurarMenu() {
    // elegir nivel
    keyboard.num1().onPressDo({ juego.cargarElMenu(menuNiveles) })
    // keyboard.num2().onPressDo({ self.creadores() })
  }
}

object menuNiveles inherits Menu{
  override method image() = "menuNiveles.jpg"   
  override method position() = game.origin()

  override method configurarMenu() {
    keyboard.num1().onPressDo({ juego.cargarNivel(1) })
    keyboard.num2().onPressDo({ juego.cargarNivel(2) })
    keyboard.num3().onPressDo({ juego.cargarNivel(3) })
  }
}
