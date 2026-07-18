import letras.*
import niveles.*

object carrilSpace {
    method y() = 7
    method crearTeclaComun(posicion) = new TeclaSpace(position = posicion)
}

object carrilA {
    method y() = 6
    method crearTeclaComun(posicion) = new TeclaA(position = posicion)
}

object carrilW {
    method y() = 4
    method crearTeclaComun(posicion) = new TeclaW(position = posicion)
}

object carrilS {
    method y() = 3
    method crearTeclaComun(posicion) = new TeclaS(position = posicion)
}

object carrilD {
    method y() = 1
    method crearTeclaComun(posicion) = new TeclaD(position = posicion)
}