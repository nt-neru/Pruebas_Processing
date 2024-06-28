/** Clase que verifica las coliciones entre objetos */
class Collider extends GameObject {

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Collider() {
  }
  /** Constructor para circulos y cuadrados */
  public Collider(PVector posicion, int ancho) {
    super(posicion, ancho);
  }
  /** Constructor para circulos y cuadrados */
  public Collider(PVector posicion, int ancho, int alto) {
    super(posicion, ancho, alto);
  }

  /* -- MÉTODOS -- */
  /** Dibuja el area de colicion */
  public void displayCircle(color Color) {
    stroke(Color);
    strokeWeight(2);
    noFill();
    circle( this.posicion.x, this.posicion.y, this.ancho);
  }
  /** Dibuja el area de colicion rect */
  public void displayRect(color Color) {
    stroke(Color);
    strokeWeight(2);
    noFill();
    rect( this.posicion.x, this.posicion.y, this.ancho, this.alto);
  }
  /** Metodo que comprueba la colision entre dos objetos rectangulos */
  public boolean isRectangulo(GameObject primero, GameObject segundo) {
    return !(primero.getPosicion().x + primero.getAncho() < segundo.getPosicion().x ||
      primero.getPosicion().x > segundo.getPosicion().x + segundo.getAncho() ||
      primero.getPosicion().y + primero.getAlto() < segundo.getPosicion().y ||
      primero.getPosicion().y > segundo.getPosicion().y + segundo.getAlto());
  }

  /** Metodo que comprueba la colisión entre dos objetos círculares */
  public boolean isCircle( GameObject segundo) {
    float distancia = PVector.dist(this.getPosicion(), segundo.getPosicion());
    float radios = (this.getAncho()+segundo.getAncho())/2;
    return distancia <= radios;
  }


  /** Metodo que comprueba la colicion de un objeto rectangulo con otro objeto circular */
  public boolean isCircRect(GameObject circle ,GameObject rectangulo) {
    // Genera una variable que guarda la posicion(x,y) del circulo, que representara el punto mas cercano entre el rectangulo y el circulo
    PVector point = new PVector(circle.getPosicion().x, circle.getPosicion().y);
    /*stroke(0);
     strokeWeight(10);
     point(point.x,point.y);
     strokeWeight(1);*/
    // actualiza la posicion X del punto más cercano a los extremos del rectangulo en el eje x, al ancho lo dividimos en 2 porque la imagen esta en el centro
    if (point.x < rectangulo.getPosicion().x ) {
      point.x = rectangulo.getPosicion().x ;
    } else if (point.x > rectangulo.getPosicion().x + rectangulo.getAncho()) {
      point.x = rectangulo.getPosicion().x + rectangulo.getAncho();
    }
    // actualiza la posicion Y del punto más cercano a los extremos del rectangulo en el eje y
    if (point.y < rectangulo.getPosicion().y ) {
      point.y = rectangulo.getPosicion().y ;
    } else if (point.y > rectangulo.getPosicion().y + rectangulo.getAlto()) {
      point.y = rectangulo.getPosicion().y + rectangulo.getAlto();
    }
    //line(point.x, point.y, this.getPosicion().x, this.getPosicion().y);
    float distance = point.dist(circle.getPosicion()); //Calcula la distancia entre el punto cercano y la posicion del circulo

    return distance <= circle.getAncho()/2;
  }
}
