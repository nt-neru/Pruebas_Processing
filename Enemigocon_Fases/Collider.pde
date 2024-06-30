/** Clase que verifica las coliciones entre objetos */
class Collider extends GameObject{

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Collider(){
  }
  /** Constructor para circulos y cuadrados */
  public Collider(PVector posicion, int ancho){
    super(posicion, ancho); 
  }
  
  /* -- MÉTODOS -- */ 
  /** Dibuja el area de colicion */
  public void displayCircle(color Color){
    stroke(Color);
    strokeWeight(2);
    noFill();
    circle( this.posicion.x, this.posicion.y,this.ancho);
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
  public boolean isCircRect(GameObject circulo, GameObject rectangulo){
    // Genera una variable que guarda la posicion(x,y) del circulo, que representara el punto mas cercano entre el rectangulo y el circulo
    PVector point = new PVector(circulo.getPosicion().x,circulo.getPosicion().y);
    
    // actualiza la posicion X del punto más cercano a los extremos del rectángulo en el eje x, al ancho lo dividimos en 2 porque la imagen esta en el centro
    if(point.x < rectangulo.getPosicion().x - rectangulo.getAncho()/2){
      point.x = rectangulo.getPosicion().x - rectangulo.getAncho()/2;
    }
    if(point.x > rectangulo.getPosicion().x + rectangulo.getAncho()/2){
      point.x = rectangulo.getPosicion().x + rectangulo.getAncho()/2;
    }
    // actualiza la posicion Y del punto más cercano a los extremos del rectángulo en el eje y
    if(point.y < rectangulo.getPosicion().y - rectangulo.getAlto()/2){
      point.y = rectangulo.getPosicion().y - rectangulo.getAlto()/2;
    }
    if(point.y > rectangulo.getPosicion().y + rectangulo.getAlto()/2){
      point.y = rectangulo.getPosicion().y + rectangulo.getAlto()/2;
    }
    float distance = point.dist(circulo.getPosicion()); //Calcula la distancia entre el punto cercano y la posicion del circulo
    return distance <= circulo.getAncho()/2;
  }
}
