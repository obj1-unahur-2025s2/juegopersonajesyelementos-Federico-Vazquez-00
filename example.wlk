// JUGADORA

object luisa {
  var personaje = floki

  method alternarPersonaje(){
    personaje = mario
  }

  method aparece(elemento){
    personaje.encontrar(elemento)
  }
}

// PERSONAJES

object floki {
  var arma = ballesta

  method cambiarArma(nuevaArma){
    arma = nuevaArma
  }

  method armaActual() = arma

  method encontrar(elemento){
    if (arma.estaCargada()) {
      elemento.recibirAtaque(arma.potencia())
      arma.realizarAtaque()
    }
  }
}

object mario {
  var valorRecolectado = 0
  var ultimoElemento = tipa

  method encontrar(elemento){
    elemento.recibirTrabajo()
    valorRecolectado += elemento.otorgarValor()
    ultimoElemento = elemento
  }

  method estaFeliz(){
    return valorRecolectado >= 50 || ultimoElemento.altura() >= 10
  }
}

// ARMAS

object ballesta {
  var flechas = 10
  method potencia() = 4

  method estaCargada(){
    return flechas > 0
  }

  method realizarAtaque(){
    flechas -= 1
  }
}

object jabalina {
  var estaCargada = true
  method potencia() = 30
  method estaCargada() = estaCargada

  method realizarAtaque(){
    estaCargada = false
  }
}

// ELEMENTOS

object castillo {
  var defensa = 150
  method altura() = 20

  method recibirAtaque(potencia){
    defensa = (defensa - potencia).max(0)
  }

  method recibirTrabajo(){
    defensa = (defensa + 20).min(200)
  }

  method otorgarValor(){
    return defensa * 0.2
  }
}

object aurora {
  var estaViva = true
  method altura() = 1
  method estaViva() = estaViva

  method recibirAtaque(potencia){
    if (potencia >= 10){
      estaViva = false
    }
  }

  method recibirTrabajo(){}

  method otorgarValor(){
    return 15
  }
}

object tipa {
  var altura = 8
  method altura() = altura

  method recibirAtaque(potencia){}

  method recibirTrabajo(){
    altura += 1
  }

  method otorgarValor(){
    return altura * 2
  }
}