/** Clase que define las balas del jugador */
private class Bullet extends GameObject {

  /* -- ATRIBUTOS -- */
  /** Representa la velocidad de la bala */
  private float speed;
  /** Representa la dirección de la bala */
  private PVector direction;
  private float angulo;

  /* -- CONSTRUCTORES -- */
  /** Constructor parametrizado */
  public Bullet(PVector pos, int ancho, int alto, PVector direction, float speed) {
    super(pos, ancho, alto);
    this.direction = direction;
    this.speed = speed;
  }
  /** Constructor para balas con angulo */
  public Bullet(PVector pos, float angulo){
    this.posicion = pos;
    this.ancho = 10;
    this.angulo = angulo;
    this.speed = 150;
  }

  /* -- MÉTODOS -- */
  /** Método para mover las balas (implementando la interfaz IMovable) */
  /*public void mover() {
    this.posicion.add(this.direction.copy().mult(this.speed).copy().mult(Time.getDeltaTime(frameRate)));
  }*/
  
  public void moverAng() {
      this.posicion.x += speed * cos(angulo) * Time.getDeltaTime(frameRate);
      this.posicion.y += speed * sin(angulo) * Time.getDeltaTime(frameRate);
  }

  /** Método para dibujar las balas (implementando la interfaz IVisualizable) */
  public void display() {
    fill(#baa423);
    circle(this.posicion.x, this.posicion.y, this.ancho);
  }
  
  /* -- ACCESORES (GETTERS Y SETTERS) -- */
  /* Getters */
  /* Devuelve la velocidad de la bala */
  public float getSpeed() {
    return this.speed;
  }

  /* Devuelve la dirección de la bala */
  public PVector getDirection() {
    return this.direction;
  }

  /* Setters */
  /* Cambia la velocidad de la bala */
  public void setSpeed(float speed) {
    this.speed = speed;
  }

  /* Cambia la dirección de la bala */
  public void setDirection(PVector direction) {
    this.direction = direction;
  }
}
