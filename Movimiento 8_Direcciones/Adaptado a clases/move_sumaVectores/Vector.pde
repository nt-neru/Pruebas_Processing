/** Clase que representa a un vector */
class  Vector {
  /* -- ATRIBUTOS -- */
  /** Representa las coordenadas del origen del vector*/
  private PVector origen;
  /** Representa las coordenadas del destino del vector */
  private PVector destino;
  /** Representa el tamaño de la flecha del vector */
  private Integer tamañoFlecha = 13;
  /** Repreesnta los componentes x e y del vector */
  private PVector componentes;

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Vector() {
    this.origen = new PVector(0, 0);
    this.destino = new PVector(0, 0);
    this.componentes = this.destino;
  }
  /** Constructor parametrizado, Vector con origen y destino */
  public Vector(PVector origen, PVector destino) {
    this.origen = origen;
    this.destino = destino;
    this.componentes = destino;
  }
  /** Constructor parametrizado con origen y nombre de la direccion*/
  public Vector(PVector origen, String direccion) {
    this.origen = origen;
    if (direccion=="up") {
      this.destino = new PVector(0, -60);
    } else if (direccion=="down") {
      this.destino = new PVector(0, 60);
    } else if (direccion=="right") {
      this.destino = new PVector(60, 0);
    } else if (direccion=="left") {
      this.destino = new PVector(-60, 0);
    }
    this.componentes = this.destino;
  }

  /* -- METODOS --*/
  /** Metodo que dibuja al vector */
  public void display() {
    strokeWeight(2);
    stroke(#EBFF6A);
    line(this.origen.x, this.origen.y, this.origen.x + this.destino.x, this.origen.y + this.destino.y);

    // Dibujar la flecha al final del vector
    float angle = atan2(this.destino.y, this.destino.x ); //Calcula angulo entre la linea Esto nos dará el ángulo en radianes.
    strokeWeight(3);
    fill(#EBFF6A);
    pushMatrix(); // Todos los cambios aplicados no afectaran a otros objetos que se dibujen después.
      translate(this.origen.x + this.destino.x, this.origen.y + this.destino.y); // Se traslada el origen del sistema de coordenadas al punto final del vector
      rotate(angle); //Se rota el sistema de coordenadas al ángulo del vector
      triangle(-this.tamañoFlecha, this.tamañoFlecha/2, -this.tamañoFlecha, -this.tamañoFlecha/2, 0, 0);
    popMatrix();
  }

  /** Metodo que suma dos Vectores*/
  public Vector sumar(Vector sumando) {
    Vector vectorSuma = new Vector(this.origen,
      PVector.add(this.destino, sumando.getComponentes())
      );
    return vectorSuma;
  }

  /** Metodo que devuelve el producto punto de dos vectores*/
  public float obtenerProductoPunto(Vector vector) {
    return PVector.dot(this.destino, vector.getDestino());
  }

  /** Metodo que devuelve la magnitud del vector */
  public float obtenerMagnitud() {
    return this.destino.mag();
  }

  /* -- ASESORES -- */
  /* Getters */
  /** Devuelve las coordenadas del punto origen del vector */
  public PVector getOrigen() {
    return this.origen;
  }
  /** Devuelve las coordenadas del punto destino del vector */
  public PVector getDestino() {
    return this.destino;
  }
  /** Devuelve los componentes del vector */
  public PVector getComponentes() {
    return this.componentes;
  }

  /* Setters */
  /** Asigna un nuevo destino al vector */
  public void setDestino(PVector nuevaPos) {
    this.destino = nuevaPos.mult(60);
  }

  /** Asigna un nuevo origen al vector */
  public void setOrigen(PVector nuevaPos) {
    this.origen = nuevaPos;
  }
} //end class Vector
