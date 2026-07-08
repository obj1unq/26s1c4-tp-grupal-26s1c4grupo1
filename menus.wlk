import niveles.*
import wollok.game.*
import juego.*

class Menu {
  method image()
  method position() = game.origin()
  method configurarMenu()
}

object menuPrincipal inherits Menu { 
  
  const property musicaMenu = game.sound("guitar-hero.mp3") 

  override method image() = "menuPrincipal.jpg"   

  override method configurarMenu() {
    musicaMenu.shouldLoop(true)
    musicaMenu.volume(0.4)
    game.schedule(100, { musicaMenu.play() })
    keyboard.num1().onPressDo({ 
      musicaMenu.stop() 
      juego.cargarElMenu(menuNiveles) 
    })
    
     keyboard.num2().onPressDo({ 
      musicaMenu.stop()   //si borro esta linea para que siga sonando la musica tira erorr
      juego.cargarElMenu(creadores) })
  }

 
}

object creadores inherits Menu{
  override method image() = "creadoresFin.jpg"   
  override method position() = game.origin()
  override method configurarMenu() { keyboard.r().onPressDo({ juego.cargarElMenu(menuPrincipal) })}
}

object menuNiveles inherits Menu{
  override method image() = "menuNiveles.jpg"   

  override method configurarMenu() {
    keyboard.num1().onPressDo({ juego.cargarNivel(1) })
    keyboard.num2().onPressDo({ juego.cargarNivel(2) })
    keyboard.num3().onPressDo({ juego.cargarNivel(3) })
  }
}

class MenuGameOver inherits Menu {
  override method image() = "menuPerdida.jpg" 
  const property nivelActual

  override method configurarMenu() {
    keyboard.r().onPressDo({ juego.cargarNivel(nivelActual) })
    keyboard.m().onPressDo({ juego.cargarElMenu(menuPrincipal) })
  }
}