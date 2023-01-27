int playerChoice, computerChoice; // stores the player's and computer's choice
float rButtonX, rButtonY, rButtonW, rButtonH, pButtonX, pButtonY, pButtonW, pButtonH, sButtonX, sButtonY, sButtonW, sButtonH; // stores the co-ordinates and the size of the buttons
int a;
int playerScore = 0; // stores the player's score after winning a round 
int computerScore = 0; // stores the computer's score after winning a round
int winScore = 5; // stores the score that the player or the computer have to reach to win the game
color green = color(0,255,0); // stores the colour green
color red = color(255,0,0); // stores the colour red
color blue = color(0,0,255); // stores the colour blue
PImage rock; 
PImage paper;
PImage scissors;

void setup()
{
  size(500, 500); // set the size of the window size
  playerChoice = 0; // set the player's choice to default
  computerChoice = 0; // set the computer's choice to default
  a = -1;
  
  //location and size of the buttons
  //button for rock
  rButtonX = width/13; // x-position
  rButtonY = height/1.4; // y-position
  rButtonW = width/5; // width of the button
  rButtonH = height/5; // height of the button
  
  //button for paper
  pButtonX = width/2.6; // x-position
  pButtonY = height/1.4; // y-position
  pButtonW = width/5; // width of the button
  pButtonH = height/5; // height of the button
  
  //button for scissors
  sButtonX = width/1.4; // x-position
  sButtonY = height/1.4; // y-position
  sButtonW = width/5; // width of the button
  sButtonH = height/5; // height of the button
  
  rock = loadImage("rock.jpg"); // importing the image for rock
  rock.resize(100,100); // resizing the image to an ideal size
  paper = loadImage("paper.jpg"); // importing the image for paper
  paper.resize(100,100); // resizing the image to an ideal size
  scissors = loadImage("scissors.jpg"); // importing the image for scissors
  scissors.resize(100,100); // resizing the image to an ideal size
}

void draw()
{
  background(255);
  a();
  buttons();
  buttonsClicked();
  results();
  score();
  gameOver();
}

void buttons() // draw the 3 buttons on the screen
{
  fill(255);
  textSize(width/16.67);
  textAlign(CENTER);
  fill(0);
  image(rock, width/13, height/1.4); //rock button
  image(paper, width/2.6, height/1.4); //paper button
  image(scissors, width/1.4, height/1.4); //scissors button
}

void buttonsClicked() // this is what happens when 1 of the buttons is pressed
{
  if(mousePressed)
  {
    // this is the part where the player picks their choice and the computer will pick a random number 
    if(mouseX > rButtonX && mouseX < rButtonX + rButtonW && mouseY > rButtonY && mouseY < rButtonY + rButtonH && computerChoice == 0)
    {
      playerChoice = 1; // value for rock
      computerChoice = (int)random(1,4); // random value decided by the computer
    }
    
    if(mouseX > pButtonX && mouseX < pButtonX + pButtonW && mouseY > pButtonY && mouseY < pButtonY + pButtonH && computerChoice == 0)
    {
      playerChoice = 2; // value for paper
      computerChoice = (int)random(1,4); // random value decided by the computer
    }
    
    if(mouseX > sButtonX && mouseX < sButtonX + sButtonW && mouseY > sButtonY && mouseY < sButtonY + sButtonH && computerChoice == 0)
    {
      playerChoice = 3; // value for scissors
      computerChoice = (int)random(1,4); // random value decided by the computer
    }
  }
}

void a() // prints the computers choice on the screen
{
  if(a == -1)
  {
    if(computerChoice == 1)
    {
      textSize(width/16.67);
      textAlign(CENTER);
      fill(0);
      text("Computer has played rock", width/2, 150);
    }
    
    if(computerChoice == 2)
    {
      textSize(width/16.67);
      textAlign(CENTER);
      fill(0);
      text("Computer has played paper", width/2, 150);
    }
    
    if(computerChoice == 3)
    {
      textSize(width/16.67);
      textAlign(CENTER);
      fill(0);
      text("Computer has played scissors", width/2, 150);
    }
  }
}

void results() // this is where the player's and computer's get compared and all the possible outcomes are looked at
{
  //when the player's and the computer's choice is the same 
  if((playerChoice == 1 && computerChoice == 1) || (playerChoice == 2 && computerChoice == 2) || (playerChoice == 3 && computerChoice == 3))
  {
    textSize(width/12.5); // set the size of the text
    textAlign(CENTER); // centers the text
    fill(blue); // sets the text colour to blue
    text("Draw \n Press any key to restart", width/2, height/2); // prints the outcome of the round and tell the player to press any button to restart the round
    if(keyPressed) // resets the game
    {
      playerChoice = 0; // resets the playerChoice to 0
      computerChoice = 0; // resets the computerChoice to 0
    }
  }
  // When the player wins
  if((playerChoice == 1 && computerChoice == 3) || (playerChoice == 2 && computerChoice == 1) || (playerChoice == 3 && computerChoice == 2))
  {
    textSize(width/12.5); // set the size of the text
    textAlign(CENTER); // centers the text
    fill(green); // sets the text colour to green
    text("You win \n Press any key to restart", width/2, height/2); // prints the outcome of the round and tell the player to press any button to restart the round
    if(keyPressed) // resets the game
    {
      playerScore = playerScore + 1; // increases the player's score by one
      playerChoice = 0; // resets the playerChoice to 0
      computerChoice = 0; // resets the computerChoice to 0
    }
  }
  // When the computer wins
  if((playerChoice == 1 && computerChoice == 2) || (playerChoice == 2 && computerChoice == 3) || (playerChoice == 3 && computerChoice == 1))
  {
    textSize(width/12.5); // set the size of the text
    textAlign(CENTER); // centers the text
    fill(red); // sets the text colour to red
    text("Computer win \n Press any key to restart", width/2, height/2); // prints the outcome of the round and tell the player to press any button to restart the round
    if(keyPressed) // resets the game
    {
      computerScore = computerScore + 1; // increases the computer's score by one
      playerChoice = 0;  // resets the playerChoice to 0
      computerChoice = 0; // resets the computerChoice to 0
    }
  }
}

void score() //prints the scoreboard on the screen 
{
  fill(0);
  textSize(20);
  text("Player's Score: " + playerScore, 100, 50); // player's score
  text("Computer's Score: " + computerScore, width-100, 50); // computer's score
  
}

void gameOver() //End of the game when the player's or computer's score is 5
{
  if(playerScore == winScore) // if player wins it sets "gameOverPage" to the following message in green, wich will be used in the void gameOverPage()
  {
    gameOverPage("Player wins!!!",green); 
  }
  
  if(computerScore == winScore) // if computer wins it sets "gameOverPage" to the following message in red, wich will be used in the void gameOverPage()
  {
    gameOverPage("Computer wins :(", red);
  }
}

void gameOverPage(String text, color c) // End page of the game (prints the following text on the page)
{
  textSize(50);
  textAlign(CENTER, CENTER);
  text("Game Over", width/2,height/3 -40);
  text("Click to exit the game", width/2,height/3 +40);
  fill(c); //sets the colour of the text depending on the outcome of the game, if the player wins the colour sets to green and if the computer wins the colour sets to red
  text(text, width/2, height/3); // prints the massage set in void gameOver() depending on the outcome of the rounds
  
  if(mousePressed)
  {
    exit(); // Exit the game when mouse is pressed
  }
}
