
class Door {
  float x, y;
  String direction;
  int radius = 10;
  
  Door(float x, float y, String direction) {
    this.x = x;
    this.y = y;
    this.direction = direction;
  }
  
  void display() {
    fill(255, 0, 0);
    ellipse(x, y, radius, radius);
  }
  
  //la puerta coliciona con el jugador?
  boolean isColliding(Player player) {
    return dist(x, y, player.x, player.y) < (radius + player.radius) / 2;
  }
}
