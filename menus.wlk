import niveles.*
import wollok.game.*
import juego.*

class Menu {
  method image()
  method position()
  method configurarMenu()
}

object menuPrincipal inherits Menu {  const property musicaMenu = game.sound("guitar-hero.mp3") 

  override method image() = "menuPrincipal.jpg"   
  override method position() = game.origin()

  override method configurarMenu() {
    musicaMenu.shouldLoop(true)
    musicaMenu.volume(0.4)
    game.schedule(100, { musicaMenu.play() })
    keyboard.num1().onPressDo({ 
      musicaMenu.stop() 
      juego.cargarElMenu(menuNiveles) 
    })
    
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
