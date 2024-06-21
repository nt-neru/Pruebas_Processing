// clase enemy generico
class Enemy extends GameObject{
  protected float speed;
  protected float acceleration;
  protected float topSpeed; 
  protected int cantidadVidas;
  
  public Enemy(){
    this.posicion = new PVector(random(width-(width/3))+width/6,random(height- (height/2))+height/4);
    this.ancho = 25;
    this.speed = 0;
    this.acceleration = 30;
    this.topSpeed= random(200,400);
  }
  
  public void display(){
    fill(255,255,0);
    circle(this.posicion.x,this.posicion.y,this.ancho*2);

  }
  public void move(){
    
    // Operador ternario para acelerar o desacelerar segun si se apreta una tecla
    this.speed = this.speed+acceleration ;

    //this.direccion.display();

    /*if (this.direccion.obtenerMagnitud() != 0) {
      this.direccion.getDestino().normalize(); // Normalizar la dirección para que el movimiento diagonal no sea mas rapido
    }*/
    // Limitar la velocidad
    this.speed = constrain(this.speed, 0, this.topSpeed);

    // Actualizar la posicion del jugador
    //this.posicion.add(this.direccion.getDestino().copy().mult(this.speed * Time.getDeltaTime(frameRate)));

    // Limitar el movimiento del jugador
    this.posicion.x = constrain(this.posicion.x, 0 + this.ancho, width - this.ancho);
    this.posicion.y = constrain(this.posicion.y, 0 + this.ancho, height - this.ancho);
  }
  
  public int getCantidadVidas(){
    return cantidadVidas;
  }
  public void setCantidadVidas(int cantidadVidas){
    this.cantidadVidas=cantidadVidas;
  }
}
