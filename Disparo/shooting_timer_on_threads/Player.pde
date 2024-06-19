class Player {
  private PVector position;
  private float ancho;
  private long retardo = 500;
  boolean canShoot = true; // Bandera para controlar si se puede disparar
  
  boolean canShootUp = false;
  boolean canShootDown = false;

  public Player(PVector pos, float ancho) {
    this.position = pos;
    this.ancho = ancho;
  }

  void dibujarNave() {
    stroke(255);
    fill(100,50);
    rectMode(CENTER);
    rect(this.position.x, this.position.y, this.ancho, this.ancho);
  }
  
  void disparar(GestorBalas gestorBalas, String direccion) {
    if (canShoot == false) return;
    println("Disparo realizado en: " + millis());
    println("Nombre del hilo actual: " + Thread.currentThread().getName());
    
    gestorBalas.createBullet(this.position.copy(), direccion); // copy porque sino el pj se mueve
    canShoot = false;
    // Retardo
    Invoke.schedule(this::enableShooting, retardo, TimeUnit.MILLISECONDS);
  }


  void enableShooting() {
    canShoot = true;
    println("Habilitado para disparar de nuevo en: " + millis());
    println("Nombre del hilo actual: " + Thread.currentThread().getName());
  }

}
