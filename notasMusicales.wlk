

class NotaMusical {
    var property position
    method image() = "notaVerde.png"
    
    method caer() {
        position = game.at(position.y(), position.x() - 1)
    }

    method puntosQueOtorga() = 10  

    
}


class TeclaPrincipal{

}

class TeclaA inherits TeclaPrincipal {
  method image() = "tecla a.png"
}

class TeclaW inherits TeclaPrincipal {
   method image() = "tecla w.png"
}

class TeclaS inherits TeclaPrincipal{
   method image() = "tecla s.png"
}

class TeclaD inherits TeclaPrincipal {
   method image() = "tecla d.png"
}