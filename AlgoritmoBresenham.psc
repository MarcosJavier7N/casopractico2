Funcion LineaBresenham( X1, Y1, X2, Y2)
      // 0 - Distancias que se desplazan en cada eje
      dY = (Y2 - Y1)
      dX = (X2 - X1)
    
      // 1 - Incrementos para las secciones con avance inclinado
      Si (dY >= 0) entonces
          IncYi = 1
      SiNo
          dY = -dY
          IncYi = -1
      Fin Si
    
      Si (dX >= 0) entonces
          IncXi = 1
      SiNo
          dX = -dX
          IncXi = -1
      Fin Si
    
      // 2 - Incrementos para las secciones con avance recto:
      Si (dX >= dY) entonces
          IncYr = 0
          IncXr = IncXi
      SiNo
          IncXr = 0
          IncYr = IncYi
    
          // Cuando dy es mayor que dx, se intercambian, para reutilizar el mismo bucle.
          // ver octantes blancos en la imagen encima del código
          k = dX: dX = dY: dY = k
      Fin Si
    
      // 3  - Inicializar valores (y de error).
      X = X1: Y = Y1
      avR = (2 * dY)
      av = (avR - dX)
      avI = (av - dX)
    
      // 4  - Bucle para el trazado de las línea.
      Hacer
          DibujarPixel(X, Y, Color) // Como mínimo se dibujará siempre 1 píxel (punto).
          Mensaje(av + " ") // (debug) para ver los valores de error global que van apareciendo.
          Si (av >= 0) entonces
              X = (X + IncXi)     // X aumenta en inclinado.
              Y = (Y + IncYi)     // Y aumenta en inclinado.
              av = (av + avI)     // Avance Inclinado
          SiNo
              X = (X + IncXr)     // X aumenta en recto.
              Y = (Y + IncYr)     // Y aumenta en recto.
              av = (av + avR)     // Avance Recto
          Fin Si
      Repetir hasta que (X = X2) y (Y = Y2) // NOTA: La condición de 'Repetir Hasta' se debe cambiar por (X <> X2) o (Y <> Y2) si se elige en su lugar 'Repetir Mientras'
   Fin funcion