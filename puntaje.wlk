object barraEnergia {
    var property puntos = 0
    var property position = game.at(1, 8)
    const puntosMaximos = 500
  
    method image() {
        const nivel = (puntos * 5 / puntosMaximos).min(5)
        return "barra_" + nivel.toString() + ".png"
    }
  
    method sumar(cantidad) {
        puntos += cantidad
    }
  
    method reiniciar() {
        puntos = 0
    }
}