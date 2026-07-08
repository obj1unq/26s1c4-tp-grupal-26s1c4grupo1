import letras.*
import vidas.*
import sectorDeAgarre.*
import niveles.*
import menus.*


object juego {
  const niveles = [nivel1, nivel2, nivel3] 
  
  
  method iniciar() {
    game.cellSize(50)
    game.width(20)
    game.height(11)
    game.title("Wollok Hero")
    self.cargarElMenu(menuPrincipal) //carga menu con posibilidad de reinciar 
    game.start()

  }
  
  method cargarElMenu(menu) {
    game.clear()
    game.addVisual(menu) 
    menu.configurarMenu() 
    keyboard.r().onPressDo({ self.cargarElMenu(menuPrincipal) })
  }

  method cargarNivel(nivel){
    const nivelElegido = niveles.get(nivel - 1)
    nivelElegido.iniciar()
    administradorDeVidas.nivelActual(nivel)
  }

}
