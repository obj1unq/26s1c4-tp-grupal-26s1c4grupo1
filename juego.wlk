import recuadroVerde.*
import direccionesRecuadro.*
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


 //revisar como hacer para que ya aparezcan las teclas