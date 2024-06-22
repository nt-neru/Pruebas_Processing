/** Clase que Puerta se dibuja y verifica colisiones con el jugador */
class Door extends GameObject {
  /** Representa el nombre de la direccion de la puerta */
  private String direction;
  /** Representa el estado de la puerta, si esta abierta o cerrada */
  private boolean isOpen;
  
  private Collider collider;

  /* -- CONSTRUCTORES -- */
  /** Constructor por defecto */
  public Door(PVector posicion, String direction) {
    this.posicion = posicion;
    this.ancho = 70;
    this.direction = direction;
    this.isOpen = true;
    this.collider = new Collider(this.posicion,this.ancho-5);
  }
  /* -- METODOS -- */
  /** Metodo que dibuja a la habitacion*/
  public void display() {
    noStroke();
    if (isOpen) {
      fill(0, 255, 0); // Color verde para puertas abiertas
    } else {
      fill(255, 0, 0); // Color rojo para puertas cerradas
    }
    circle(this.posicion.x, this.posicion.y, this.ancho);
    collider.displayCircle(#150C6C);
  }

  /* -- ASESORES -- */
  /* Getters */
  /** Devuelve el nombre de la direccion en donde se encuentra la puerta*/
  public String getDirection() {
    return this.direction;
  }
  /** Devuelve si la puerta esta abierta */
  public boolean getIsOpen() {
    return this.isOpen;
  }
  /** Devuelve el colisionador */
  public Collider getCollider() {
    return this.collider;
  }

  /* Setings */
  /** Asigna un nuevo estado a la puerta */
  public void setIsOpen(boolean state) {
    this.isOpen = state;
  }
}
