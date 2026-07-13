import niveles.*
import wollok.game.*
import juego.*

class Menu {
  method image()
  method position() = game.origin()
  method configurarMenu() {
    keyboard.r().onPressDo({ juego.cargarElMenu(menuPrincipal) }) 
  }
}

object menuPrincipal inherits Menu { 
  const property musicaMenu = game.sound("guitar-hero.mp3") 

  override method image() = "menuPrincipal.jpg"   

  override method configurarMenu() {
    musicaMenu.shouldLoop(true)
    musicaMenu.volume(0.4)
    game.schedule(1, { musicaMenu.play() })
    keyboard.num1().onPressDo({ musicaMenu.stop() juego.cargarElMenu(menuNiveles) game.sound("menuClick.mp3").play() })
    keyboard.num2().onPressDo({ musicaMenu.stop() juego.cargarElMenu(menuCreadores) game.sound("menuClick.mp3").play() })
  }
}

object menuNiveles inherits Menu{
  override method image() = "menuNiveles.jpg"   

  override method configurarMenu() {
    super()
    keyboard.num1().onPressDo({ juego.cargarNivel(1) })
    keyboard.num2().onPressDo({ juego.cargarNivel(2) })
    keyboard.num3().onPressDo({ juego.cargarNivel(3) })
  }
}

class MenuGameOver inherits Menu {
  override method image() = "fondoGameOver.png" 
  const property nivelActual

  override method configurarMenu() {
    keyboard.f().onPressDo({ juego.cargarNivel(nivelActual) })
    keyboard.m().onPressDo({ juego.cargarElMenu(menuPrincipal) })
  }
}

object menuGanaste inherits Menu {
  override method image() = "ganasteFinal.png" 
  override method configurarMenu() {
    keyboard.m().onPressDo({ juego.cargarElMenu(menuPrincipal) })
  }
}

object menuCreadores inherits Menu{
  override method image() = "creadoresFinal.png"
  override method position() = game.origin()
}