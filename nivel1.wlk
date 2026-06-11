import letras.*


object level1 {

    const teclasMaximas = 100

    method init(){
       

        
        const notaW = (4..8).map({ y => new TeclaA(position = game.at(10, y))})
        const notaA = (4..8).map({ y => new TeclaW(position = game.at(10, y))})
        const notaS = (4..8).map({ y => new TeclaD(position = game.at(10, y))})
        const notaD = (4..8).map({ y => new TeclaS(position = game.at(10, y))})

        const notasTotales = notaW + notaA + notaS + notaD

        notasTotales.forEach({ nota => self.inicializarNota(nota) })
    }



    method inicializarNota(nota) {

        game.addVisual(nota)
        const velocidadRandom = (300..800).anyOne() 


        game.onTick(velocidadRandom, "movimiento_", { nota.caer() })
    }



}