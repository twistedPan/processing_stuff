int columns = 1200;
int rows = columns;
                 
float cellSize = columns/200;   
Cell[][] cellGrid = new Cell[columns][rows]; 
boolean run = false;

// Klasse für Zellen
class Cell {
  int x,y;
  float size;
  int state,nextState,nCount,age;
  
  Cell(int _x, int _y) {
    x = _x;
    y = _y;
    state = int(Math.random() < 0.1);
    nextState = 0;
    nCount = 0;
    size = cellSize;
    age = 0;
  }
// UPDATE GRID
  void update() {      // aktuallisiert die Infos über lebende Zellen
    int living = getNeighbors();
       
    // 1. Conway-Regel B3/S23
    if (living <= 1 || living >= 4) nextState = 0;
    else if (living == 3) nextState = 1;
    else nextState = state;
  

    display();
  }
// GET LIVING NEIGHBORS
  int getNeighbors() {
    int living = 0;
    for (int i = -1; i<=1; i++) {
      for (int j = -1; j<=1; j++) {
        if (i==0 && j==0) continue;
        if (cellGrid[x+i][y+j].state == 1) living++;
      }
    }
    nCount = living;
    return living;
  }
// DISPLAY SHIT
  void display() {
    
    if (state == 1) {
        fill(255,0,0);
    } else fill(0);
  
    rect(x * size, y * size, size-1,size-1);

  }
  
}

Cell c = new Cell(1,1);

// SETUP -----------------------------------------------------------------
void setup() {
  size(1200, 1200);
  frameRate(10);
  background(123);
  stroke(0);


  for (int i = 0; i < cellGrid.length; i++) {              
    for (int j = 0; j < cellGrid[i].length; j++) {       
      cellGrid[i][j] = new Cell(i,j);
    }                                   
  }                                       


// Zeige das Grid an
  for(int i = 1; i<cellGrid.length-1; i++) {
    for (int j = 1; j<cellGrid[i].length-1; j++) {
       cellGrid[i][j].update();
    }
  }
  
  cellGrid[4][4].state = 1;
  cellGrid[4][4].display();
  
  print(cellSize);
}

// DRAW -----------------------------------------------------------------
void draw() {
  text(cellGrid.length,400,400);
  
  if (run) {
    for(int i = 1; i<cellGrid.length-1; i++) {
      for (int j = 1; j<cellGrid[i].length-1; j++) {
        cellGrid[i][j].update();
      }
    }
    updateGrid();
  }
  


    
} // END OF DRAMA

void updateGrid() {
  for(int i = 0; i<cellGrid.length; i++) {
    for (int j = 0; j<cellGrid[i].length; j++) {
      cellGrid[i][j].state = cellGrid[i][j].nextState;
    }
  }
}

void mouseClicked() {
  if (run) run = false;
  else run = true;
}


/*

void startTheGame() {
    if (!run) {
        run = true    // Start Game of Life
        startButton.elt.innerText = "läuft"
    }
    else {
        run = false   // Stop it
        startButton.elt.innerText = "pausiert"
    }
}

void reloadPage() {
    location.reload()       // läd die komplette Seite neu (nicht empfohlen ^^')
}
*/
