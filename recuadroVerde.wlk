import direccionesRecuadro.*


object recuadroVerde {
    var property position = game.at(0, 0)
  
    method image() = "recuadro_verdeModi.jpg"

    method mover(direccion) {
		const siguientePosicion = direccion.siguiente(position)
		if (tablero.dentro(siguientePosicion)) {
            position = siguientePosicion
        }
	}
}
