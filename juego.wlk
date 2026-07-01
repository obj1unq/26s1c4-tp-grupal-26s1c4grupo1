import letras.*
import direccionesRecuadro.*
import sectorDeAgarre.*
import niveles.*
import menus.*


object juego {
  const niveles = [nivel1, nivel2, nivel3] 
  
  
  method iniciar() {
    game.cellSize(50)
    game.width(15)
    game.height(15)
    game.title("Wollok Hero")
    self.cargarElMenu() //carga menu con posibilidad de reinciar 
    game.start()

  }
  
  method configurarTeclasMenu() {
    // elegir nivel
    keyboard.num1().onPressDo({ self.cargarNivel(1) })
    keyboard.num2().onPressDo({ self.cargarNivel(2) })
    keyboard.num3().onPressDo({ self.cargarNivel(3) })
  }

  method cargarElMenu() {
    game.clear()
    game.addVisual(menu) 
    self.configurarTeclasMenu() 
    keyboard.r().onPressDo({ self.cargarElMenu() })
  }

  method cargarNivel(nivel){
    const nivelElegido = niveles.get(nivel - 1)
    nivelElegido.iniciar()
    self.configurarTeclasJuego()
  }

  method configurarTeclasJuego() {
    keyboard.a().onPressDo({ sectorDeAgarreTeclaA.intentarAgarrar() })
    keyboard.w().onPressDo({ sectorDeAgarreTeclaW.intentarAgarrar() })
    keyboard.s().onPressDo({ sectorDeAgarreTeclaS.intentarAgarrar() })
    keyboard.d().onPressDo({ sectorDeAgarreTeclaD.intentarAgarrar() })
    keyboard.space().onPressDo({ sectorDeAgarreTeclaSpace.intentarAgarrar() })
    keyboard.r().onPressDo({ self.cargarElMenu() })
  }

}
