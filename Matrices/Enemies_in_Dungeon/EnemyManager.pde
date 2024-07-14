/** Gestiona los estados de los enemigos */
class EnemyManager {
  /** Representa a los enemigos de una habitación */
  private ArrayList<Enemy> enemies;
  /** Verifica si los enemigos han sido generados en X room */
  private boolean[] enemigosGenerados;
  /** Array de patrones */
  private ArrayList<Patron> patrones;

  public EnemyManager(int tamanio) {
    this.enemies = new ArrayList<>();
    this.enemigosGenerados = new boolean[tamanio]; // Por defecto se inicializan en falso
    this.enemigosGenerados[0] = true;  // habitacion del inicio esta como generada, para que no se genere cuando vuelva a pasar por alli
    this.patrones = new ArrayList<>();
    inicializarPatrones();
  }

  /** Metodo que inicializa los patrones de los enemigos */
  private void inicializarPatrones() {
    // Patrón 1: 3 enemigos alineados horizontalmente
    Patron patron1 = new Patron();
    addPosiciones(patron1, 3, height / 2);
    this.patrones.add(patron1);

    // Patrón 2: 8 enemigos alineados horizontalmente arriba y abajo
    Patron patron2 = new Patron();
    addPosiciones(patron2, 4, height / 3);
    addPosiciones(patron2, 4, height - height / 3);
    this.patrones.add(patron2);
    
    // Patrón 3: Enemigos en forma de triangulo
    Patron patron3 = new Patron();
    addPosicionUnica(patron3, width / 2, height / 3); 
    addPosiciones(patron3, 2, height / 2); 
    addPosiciones(patron3, 3, height - height / 3);
    this.patrones.add(patron3);
    
    // Aquí se pueden agregar mas patrones 
  }
  
  /** Metodo auxiliar para agregar una posición única a un patrón */
  private void addPosicionUnica(Patron patron, float x, float y) {
    patron.addPosicion(new PVector(x, y));
  }

  /** Metodo auxiliar para agregar posiciones a un patrón */
  private void addPosiciones(Patron patron, int cantidadEnemies, float y) {
    for (int i = 0; i < cantidadEnemies; i++) {
      patron.addPosicion(new PVector((i + 1) * width / (cantidadEnemies + 1), y));
    }
  }
  
  /** Metodo que genera enemigos segun la habitacion actual*/
  public void createEnemies(Room room) {
    removeEnemies();
    // Verificar si los enemigos ya han sido generados para esta habitación
    if (this.enemigosGenerados[room.getNameRoom()]) {
      return; // Salir si ya han sido generados
    }
    generarFormacion(room.getNameRoom());
    room.stateDoors(false); // Hay enemigos, cerrar puertas
  }

  public void generarFormacion(int nameRoom) {
    Enemy e;
    // Escoje un patron de la lista de patrones
    Patron patronSeleccionado = this.patrones.get((int) random(this.patrones.size()));

    for (PVector posicion : patronSeleccionado.getPosiciones()) {
      e = new Enemy();
      e.setPosicion(posicion);
      this.enemies.add(e);
    }

    // Marcar la habitación como generada, para que no se genere cuando vuelva a pasar por alli
    this.enemigosGenerados[nameRoom] = true;
  }

  /** Dibuja a los enemigos */
  public void display() {
    for (Enemy e : this.enemies) {
      e.display();
    }
  }

  /** Evaluar muerte de los enemigos */
  public void checkPlayerCollision(Player jugador) {
    if (!hayEnemigos()) return;  // Si no hay enemigos, salir
    for (int i = this.enemies.size() - 1; i >= 0; i--) {
      Enemy enemy = this.enemies.get(i);
      if (enemy.getCollider().isCircle(jugador.getCollider()) && !enemy.getIsInvulnerable()) {
        enemy.setLives(enemy.getLives()-1);
        if (enemy.getLives() <= 0){
          this.enemies.remove(i);
        }
        return;
      }
    }
  }

  /* Devuelve si hay enemigos */
  public boolean hayEnemigos() {
    return !enemies.isEmpty();
  }

  /** Elimina a todos los enemigos de la lista */
  public void removeEnemies() {
    this.enemies.clear(); // Eliminar los enemigos de la lista
  }

  /* -- ASESORES -- */
  public ArrayList<Enemy> getEnemies() {
    return this.enemies;
  }

  public int getCantidadEnemies() {
    return this.enemies.size();
  }
}

/** Clase que representa un patrón de posiciones */
class Patron {
  private ArrayList<PVector> posiciones;

  public Patron() {
    this.posiciones = new ArrayList<>();
  }

  public void addPosicion(PVector posicion) {
    this.posiciones.add(posicion);
  }

  public ArrayList<PVector> getPosiciones() {
    return this.posiciones;
  }
}
