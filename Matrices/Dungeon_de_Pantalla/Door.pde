// Clase que Puerta se dibuja y verifica colisiones con el jugador.
class Door {
  private float x, y;
  private String direction;
  private int radius = 20;
  
  public Door(float x, float y, String direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
  }
  
  public void display() {
    fill(255, 0, 0);
    circle(x, y, this.radius);
  }
  
  //la puerta coliciona con el jugador?
  public boolean isColliding(Player player) {
    return dist(x, y, player.x, player.y) < (radius + player.radius) / 2;
  }
}
