import niveles.*
import wollok.game.*
import juego.*

class Menu {
  const property musicaMenuPrincipal = game.sound("guitar-hero.mp3") 
  
  method image()
  method position() = game.origin()
  method configurarMenu() {
    keyboard.r().onPressDo({ juego.cargarElMenu(menuPrincipal) game.sound("menuClick.mp3").play() }) 
  }
}

object menuPrincipal inherits Menu { 
  override method image() = "menuPrincipal.jpg"   

  override method configurarMenu() {
    musicaMenuPrincipal.shouldLoop(true)
    musicaMenuPrincipal.volume(0.4)
    game.schedule(1, { musicaMenuPrincipal.play() })
    keyboard.num1().onPressDo({ juego.cargarElMenu(menuNiveles) game.sound("menuClick.mp3").play() })
    keyboard.num2().onPressDo({ juego.cargarElMenu(menuCreadores) game.sound("menuClick.mp3").play() })
  }
}

object menuNiveles inherits Menu{
  override method image() = "menuNiveles.jpg"   

  override method configurarMenu() {
    super()
    keyboard.num1().onPressDo({ juego.cargarNivel(1) game.sound("menuClick.mp3").play() })
    keyboard.num2().onPressDo({ musicaMenuPrincipal.stop() juego.cargarNivel(2) game.sound("menuClick.mp3").play() })
    keyboard.num3().onPressDo({ musicaMenuPrincipal.stop() juego.cargarNivel(3) game.sound("menuClick.mp3").play() })
  }
}

class MenuGameOver inherits Menu {
  const property nivelActual

  override method image() = "fondoGameOver.png" 

  override method configurarMenu() {
    super()
    keyboard.f().onPressDo({ juego.cargarNivel(nivelActual) game.sound("menuClick.mp3").play() })
  }
}

class MenuGanaste inherits Menu {
  const property nivelActual

  override method image() = "ganasteFinal.png" 

  override method configurarMenu() {
    keyboard.r().onPressDo({ juego.cargarNivel(nivelActual) game.sound("menuClick.mp3").play() })
    keyboard.m().onPressDo({ juego.cargarElMenu(menuPrincipal) game.sound("menuClick.mp3").play() })
  }
}

object menuCreadores inherits Menu{
  override method image() = "creadoresFinal.png"
  override method position() = game.origin()
}