void setup() {
  size(400, 400);
}

void draw() {  
  background(255);

  noFill();
  stroke(0);
  strokeWeight(2);  // Grosor del borde

  // dibujar un rectangulo con bordes redondeados
  Rect.draw(this, 50, 50, 100, 100, 9);
  Rect.draw(this, 130, 30, 100, 100, 19);
  Rect.draw(this, -20, 90, 100, 100, 40);
  Rect.draw(this, 290, 100, 100, 100, 2);
  
  // Sino puede dejarselo como funcion igual que rect

  stroke(255,0,0);
  redoundedRect(300, 160, 100, 100, 16);
}

/** Dibuja rectangulo con bordes redondeados */
public void redoundedRect(int x, int y, int w, int h, int r) {
  beginShape();
    vertex(x + r, y);  // Esquina superior izquierda
    vertex(x + w - r, y);  // Esquina superior derecha
    bezierVertex(x + w - r/2, y, x + w, y + r/2, x + w, y + r);  // Curva superior derecha
    vertex(x + w, y + h - r);  // Esquina inferior derecha
    bezierVertex(x + w, y + h - r/2, x + w - r/2, y + h, x + w - r, y + h);  // Curva inferior derecha
    vertex(x + r, y + h);  // Esquina inferior izquierda
    bezierVertex(x + r/2, y + h, x, y + h - r/2, x, y + h - r);  // Curva inferior izquierda
    vertex(x, y + r);  // Esquina superior izquierda
    bezierVertex(x, y + r/2, x + r/2, y, x + r, y);  // Curva superior izquierda
  endShape();
}
