import letras.*
import direccionesRecuadro.*
import nivel1.*
import sectorDeAgarre.*


import niveles.*
import menus.*


object juego {
  const niveles = [nivel1, nivel2, nivel3] 
  
  method iniciar() {
    game.width(15)
    game.height(15)
    game.title("Guitar Hero")
    game.addVisual(menu)
    self.elegirNivel()
    game.start()

  }
  
  method elegirNivel(){
    keyboard.num1().onPressDo({self.cargarNivel(1)})
    keyboard.num2().onPressDo({self.cargarNivel(2)})
    keyboard.num3().onPressDo({self.cargarNivel(3)})
  }

  method cargarNivel(nivel){
    const nivelElegido = niveles.get(nivel - 1)
    nivelElegido.iniciar()
  }

}   


//revisar para no repetir codigo

object modoFacil {
  method iniciar() {
  game.removeVisual(menu)
  game.addVisual(fondoNivel1)
  keyboard.a().onPressDo({sectorDeAgarreTeclaA.intentarAgarrar()})
  keyboard.w().onPressDo({sectorDeAgarreTeclaW.intentarAgarrar()})
  keyboard.s().onPressDo({sectorDeAgarreTeclaS.intentarAgarrar()})
  keyboard.d().onPressDo({sectorDeAgarreTeclaD.intentarAgarrar()})
  level1.init()
  }
} 
