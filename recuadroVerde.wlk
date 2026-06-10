import direccionesRecuadro.*



object recuadroVerde {
    var property position = game.at(0, 0)
    var puntaje = 0 
    method image() = "recuadro_verdeModi.jpg"
    method puntaje() = puntaje

    method mover(direccion) {
		const siguientePosicion = direccion.siguiente(position)
		if (tablero.dentro(siguientePosicion)) {
            position = siguientePosicion
        }
	}

    method colisionar(tecla) {
      const hayTecla = game.uniqueCollider(self)
      if(hayTecla != null){
        self.agarrar(tecla)
      }
    }

    method agarrar(tecla) {
       puntaje += tecla.puntosQueOtorga()
       game.removeVisual(tecla)
    }

    
}
