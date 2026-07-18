import niveles.*
import wollok.game.*
import juego.*

class Menu {
  method image()
  method position() = game.origin()
  method configurarMenu() {
    keyboard.r().onPressDo({ juego.cargarElMenu(menuPrincipal) game.sound("menuClick.mp3").play() }) 
  }
}

object menuPrincipal inherits Menu { 
  override method image() = "menuPrincipal.jpg"   

  override method configurarMenu() {
    juego.iniciarMusicaMenu()
    keyboard.num1().onPressDo({ juego.cargarElMenu(menuNiveles) game.sound("menuClick.mp3").play() })
    keyboard.num2().onPressDo({ juego.cargarElMenu(menuCreadores) game.sound("menuClick.mp3").play() })
    keyboard.i().onPressDo({ juego.cargarElMenu(menuInstrucciones) game.sound("menuClick.mp3").play() })
    keyboard.t().onPressDo({ juego.cargarNivel(4) game.sound("menuClick.mp3").play() })
  }
}

object menuNiveles inherits Menu{
  override method image() = "menuNiveles.jpg"   

  override method configurarMenu() {
    super()
    keyboard.num1().onPressDo({ juego.cargarNivel(1) game.sound("menuClick.mp3").play() })
    keyboard.num2().onPressDo({ juego.cargarNivel(2) game.sound("menuClick.mp3").play() })
    keyboard.num3().onPressDo({ juego.cargarNivel(3) game.sound("menuClick.mp3").play() })
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

object menuInstrucciones inherits Menu{
  override method image() = "menuInstrucciones.png"
  override method position() = game.origin()

  override method configurarMenu() {
    super()
    keyboard.num1().onPressDo({ juego.cargarNivel(1) game.sound("menuClick.mp3").play() })
  }
}