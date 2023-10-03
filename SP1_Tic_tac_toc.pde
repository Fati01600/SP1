//SPL 1 TIC TAC TOE 
// 2 players: Player1 Tess, player2 Fatima 
int boardSize = 3; // Størelsen af brættet nemlig 3x3 gitter
String[][] board = new String[boardSize][boardSize]; //dobble array af string, til at initialisere det tomme string, som skal være tic tac toe brættet.
String player1 = "Tess";  // Player1 er den som starter spillet, hvilet er Tess.

boolean gameFinished = false; //Vi laver en boolean varibel til at vise om spillet er finished, eller ej. 

void setup() { // void setop... med andre ord vores opsætningskode, som vi jo kender den.
  size(600, 650); //Rammens/brættet størelse
  
  for (int i = 0; i < boardSize; i++) { // Det her er den ydre loop. Den Initialiserer en variabel i til 0. 
                                        //Så længe i er mindre en boardSize som er 3 i koden, vil loopen forsætte. 
                                        //Efter hver omgang øges i med 1 altså det vi kender for at være i++
                                       
    for (int j = 0; j < boardSize; j++) { // I den indre loop, starter der en anden loop j, det nøjagtig det samme bare med j.
                                          // Dog vil den i hver værdi af i, vi j formåde at løbe igennem sine værdier il boardSize - 1, som i det her tilfælde er 0 til 2. 
                                          
      
      board[i][j] = ""; // Inden i det indre loop, hvor i og j har sine værdier, har vi linjen board [i][j] ="" den tomme string. 
                        // Det er bare placeringen på boarded arrayet er bestemt af [i] [j]
    }
  }
}

void draw() { //Tegnekoden 
  background(#545D67);  // Vi ændre baggrundsfarven af vores ramme til "grey"
  
  for (int i = 0; i < boardSize; i++) { //Vi skriver koden for vores loops ind her, fordi vi skal bruge den til at tegne spillestatusen. 
    for (int j = 0; j < boardSize; j++) {
      
      // For vores første player1 (Tess) tegnes et x
      if (board[i][j].equals("Tess")) {
        stroke(#1EF744);  // Alien green color X for Tess
        line(i * 200 + 50, j * 200 + 50, i * 200 + 150, j * 200 + 150);
        line(i * 200 + 150, j * 200 + 50, i * 200 + 50, j * 200 + 150);
      
      // For vores anden Player2 Fatima tegner vi en cirkel O
      } else if (board[i][j].equals("Fatima")) {
        stroke(255);  // Purple color O (cirkel) for Fatima
        fill(#6F1FAA); 
        ellipse(i * 200 + 100, j * 200 + 100, 140, 140);
      }
      
      noFill(); //Det bare en funktion som man bruger til at være sikker på at der ikke bliver tegnet indvendig udfyldninger. 
      stroke(0); // Strengene tegnes sorte 
      rect(i * 200, j * 200, 200, 200); //Hvert felt er 200x200 pixels
    }
  }
}

void mouseClicked() { //Definerere mouseClicked
//musens pixelkoordinater skrives ind her. Bruges til at lave hvert felt på brættet til at være 200 pixels bredt og højt
  int x = mouseX / 200;
  int y = mouseY / 200;
  
//Vi bruger if statmenten til at sikre os at x og y er inde for brættets grænser
  if (x < boardSize && y < boardSize && board[x][y].equals("")) { //empty
    
 // SÆtter player1 Tess på den valgte position på brættet
    board[x][y] = player1;

///if statement for at kunne tjekke om spilleren har vundet. Gør de det, afsluttes spillet og vinderen bliver skreve forneden. 
    if (checkForWin(player1)) {
      gameFinished = true;
      print(player1 + " wins!");
      noLoop();

// Hvis ingen vinder og der står uafgjort, stoppes loopen. 
    } 
    else if (checkForDraw()) {
      gameFinished = true;
      print("It's a draw!");
      noLoop();

//Er spillet ikke afsluttet, skiftes der mellem spillerene indtil der findes en vinder. 
    } 
    else {
      player1 = player1.equals("Tess") ? "Fatima" : "Tess"; // Switching players
    }
  }
}


boolean checkForWin(String player) {
  for (int i = 0; i < boardSize; i++) {
    if (board[i][0].equals(player) && board[i][1].equals(player) && board[i][2].equals(player) || // || bruges til at fortælle at hvis spilleren har enten den primære ELLER tabt 
    board[0][i].equals(player) && board[1][i].equals(player) && board[2][i].equals(player)) {
      return true; 
    }
  }
  if (board[0][0].equals(player) && board[1][1].equals(player) && board[2][2].equals(player) ||
      board[0][2].equals(player) && board[1][1].equals(player) && board[2][0].equals(player)) {
    return true;
  }
  return false; //hvis ingen af det foroven er opfyldt, retuneres false, hvilket bare betyder at spilleren ikke har vuundet
}

boolean checkForDraw() {
  for (int i = 0; i < boardSize; i++) {
    for (int j = 0; j < boardSize; j++) {
      if (board[i][j].equals("")) {
        return false;
      }
    }
  }
  return true;
}
