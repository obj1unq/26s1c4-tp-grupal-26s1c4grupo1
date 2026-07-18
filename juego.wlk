import letras.*
import vidas.*
import sectorDeAgarre.*
import niveles.*
import menus.*


object juego {
  const niveles = [nivel1, nivel2, nivel3, nivelTutorial] 
  var property nivelActual = null

  const property musicaMenu = game.sound("guitar-hero.mp3")
  
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
  }

  method iniciarMusicaMenu() {
    if (!musicaMenu.played()) { 
      musicaMenu.shouldLoop(true)
      musicaMenu.volume(0.4)
      game.schedule(1, { musicaMenu.play() })
    }
  }

  method detenerMusicaMenu() {
    if (musicaMenu.played()) {
      musicaMenu.stop()
    }
  }

  method cargarNivel(nivel){
    self.detenerMusicaMenu()
    const nivelElegido = niveles.get(nivel - 1)
    nivelActual = nivelElegido
    nivelElegido.iniciar()
    nivelElegido.nivelActual(nivel)
    administradorDeVidas.nivelActual(nivel)
  }

  method pausarMusicaNivel(nivel) {
    const nivelElegido = niveles.get(nivel - 1)
    nivelElegido.pausarMusica()
  }

}
