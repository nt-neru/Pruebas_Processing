class Bullet {
  private float speed;
  private PVector position;
  private float ancho;
  private Vector direccion;

  public Bullet() {
    this.position = new PVector(width/2, height/2);
    this.ancho = 10;
  }

  public Bullet( PVector position, String direccion) {
    this.position = position;
    this.direccion = new Vector(this.position, direccion);
    this.ancho = 15;
    this.speed = 5; // si se normaliza poner velocidad a 300
  }

  public void display() {
    fill(255, 0, 0);
    circle(this.position.x, this.position.y, this.ancho);
    this.direccion.display();
  }
  
  public void move(){
    /*if (this.direccion.obtenerMagnitud() != 0) {
      this.direccion.getDestino().normalize(); //normalizar la this.direccion para que no valla muy rapido en la suma
    }*/
    this.position.add(this.direccion.getDestino().copy().mult(speed * deltaTime));
  }
}
