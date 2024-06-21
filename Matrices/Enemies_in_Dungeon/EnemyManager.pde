/** Gestiona los estados de los enemigos*/
class EnemyManager {
  /** representa a los enemigos de una habitacion*/
  private ArrayList<Enemy> enemies;

  public EnemyManager() {
    enemies= new ArrayList();
  }

  public void generarFormacion(int nameRoom) {
    Enemy e;
    switch(nameRoom) {
    case 1:
      {// en la habitacion 1
      int cantidadEnemies = 3;
        for (int i=0; i<cantidadEnemies; i++) {
          e= new Enemy();
          e.setPosicion(new PVector((i+1)*width/(cantidadEnemies+1), height/2));
          enemies.add(e);
        }
        break;
      }
    case 2:
      {// en la habitacion 2
      int cantidadEnemies = 4;
        for (int i=0; i<cantidadEnemies; i++) {
          e= new Enemy();
          e.setPosicion(new PVector((i+1)*width/(cantidadEnemies+1), height/4));
          enemies.add(e);
        }
        break;
      }

    default:
      // sin enemigos
      break;
    }//end Switch
  }
  
  public void removeEnemies() {
    enemies.clear(); // Eliminar los enemigos de la lista
  }
  public void display() {
    for (Enemy e : enemies) {
      e.display();
    }
  }//end display

  /*public void validarMuerte(Enemy e, int cantidadVidas) {
    e.setCantidadVidas(cantidadVidas-=1);
    if (cantidadVidas<=0) {
      enemies.remove(e);
      if (enemies.size()<=0) {
        ESTADO=MaquinaEstados.GANANDO_JUEGO;
      }
    }
  }*/
  /*public void collisionEnemies() {
    for (int i= 0; i<enemies.size(); i++) {
      Enemy e= enemies.get(i);
      for (int j=i+1; j<enemies.size(); j++) {
        Enemy other=enemies.get(j);
        float distance= e.getPosition().dist(other.getPosition());
        float radios= e.getRadio()+other.getRadio();
        if (distance<radios) {
          float angle=atan2(other.getPosition().y + e.getPosition().y, other.getPosition().x + e.getPosition().x);
          float targetX=e.getPosition().x+ cos(angle)*radios;
          float targetY=e.getPosition().y + sin(angle)*radios;
          float ax= (targetX - other.getPosition().x)*0.02;
          float ay= (targetY - other.getPosition().y)*0.02;
          e.setVelocity(new PVector(ax, ay));
          other.setVelocity(new PVector(-ax, -ay));
        }
      }
    }
  }//collisionEnemies*/

  /**-------------------------Seccion metodos accesores-------------------------*/
  public ArrayList<Enemy> getEnemies() {
    return enemies;
  }
  public int getCantidadEnemies() {
    return enemies.size();
  }
}
