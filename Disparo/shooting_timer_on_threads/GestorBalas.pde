class GestorBalas {
  ArrayList<Bullet> balas;
  public GestorBalas() {
    balas = new ArrayList<Bullet>();
  }

  public void createBullet(PVector position, String direccion) {
    balas.add(new Bullet(position, direccion));
    
  }

  void moverYMostrarBalas() {
    for (int i = balas.size() - 1; i >= 0; i--) {
      Bullet bala = balas.get(i);
      
      bala.display();
      bala.move();
      
      if (bala.position.y < 0) {
        balas.remove(i);
      }
    }
  }
  
}
