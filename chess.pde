PImage light, dark, pawnbPic, pawnwPic, queenbPic, queenwPic, rookbPic, rookwPic, knightbPic, knightwPic, kingbPic, kingwPic, bishopbPic, bishopwPic;
ArrayList<Piece> pieces;
int pos;

int pos_tox(int pos) {
  int xpos = pos%8;
  if (xpos==0) { 
    xpos=8;
  }
  return xpos;
}

int pos_toy(int pos) {
  int ypos = pos/8;
  if (pos%8!=0) {
    return round(ypos+0.5);
  } else {
    return round(ypos+0.5)-1;
  }
}

int mouse_toid() {
  int xpos = round((mouseX/100)-.5)+1;
  int ypos = round((mouseY/100)-.5);


  return xpos+8*ypos;
}

void setup() {
  size(1300, 710);
  pieces = new ArrayList<Piece>();
  pos=1;

  //Floor images
  light=loadImage("light.jpg");
  dark=loadImage("dark.jpg");

  //Load piece images 
  pawnbPic=loadImage("pawnb.png");
  pawnwPic=loadImage("pawnw.png");

  queenbPic=loadImage("queenb.png");
  queenwPic=loadImage("queenw.png");

  rookbPic=loadImage("rookb.png");
  rookwPic=loadImage("rookw.png");

  knightbPic=loadImage("knightb.png");
  knightwPic=loadImage("knightw.png");

  kingbPic=loadImage("kingb.png");
  kingwPic=loadImage("kingw.png");

  bishopbPic=loadImage("bishopb.png");
  bishopwPic=loadImage("bishopw.png");

  //Create piece objects

  pieces.add(new Piece("black", "rook", 1, 1, rookbPic));
  pieces.add(new Piece("black", "knight", 1, 2, knightbPic));
  pieces.add(new Piece("black", "bishop", 1, 3, bishopbPic));
  pieces.add(new Piece("black", "queen", 1, 4, queenbPic));
  pieces.add(new Piece("black", "king", 1, 5, kingbPic));
  pieces.add(new Piece("black", "bishop", 1, 6, bishopbPic));
  pieces.add(new Piece("black", "knight", 1, 7, knightbPic));
  pieces.add(new Piece("black", "rook", 1, 8, rookbPic));

  for (int i = 9; i<17; i++) {
    pieces.add(new Piece("black", "pawn", 1, i, pawnbPic));
  }
    
  pieces.add(new Piece("white", "rook", 1, 64, rookwPic));
  pieces.add(new Piece("white", "knight", 1, 63, knightwPic));
  pieces.add(new Piece("white", "bishop", 1, 62, bishopwPic));
  pieces.add(new Piece("white", "queen", 1, 60, queenwPic));
  pieces.add(new Piece("white", "king", 1, 61, kingwPic));
  pieces.add(new Piece("white", "bishop", 1, 59, bishopwPic));
  pieces.add(new Piece("white", "knight", 1, 58, knightwPic));
  pieces.add(new Piece("white", "rook", 1, 57, rookwPic));

  for (int i = 49; i<57; i++) {
    pieces.add(new Piece("white", "pawn", 1, i, pawnwPic));
  }
}
void draw() {
  background(255);
  noStroke();
  //Draw board

  for (int i=0; i<8; i++) {
    for (int j=0; j<8; j++) {
      if ((i+j)%2==0) {
        image(light, i*90, j*90);
      } else {
        image(dark, i*90, j*90);
      }
    }
  }
  //pieces.get(0).pos=pos;
  for (int i = 0; i<32; i++) {
    pieces.get(i).draw();
  }


  //Draw Graveyard
  fill(220, 242, 250);
  rect(720, 0, 1300, 710);
}
void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      println("YO");
      pos++;
    }
  }
}