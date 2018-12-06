
//super marios like
//press keys to move 
//press z or mouse click to jump
//http://molleindustria.github.io/p5.play/examples/index.html?fileName=flappyBird.js



var instrcution;
var gameOver = false; 
//characters
var player, alpaca, illama;
var playerImg, alpacaImg, illamaImg;
//setts
var ground, fence; 
var instructionImg, fenceImg, bgImg; groundImg;



function preload(){
	instruction = loadImage("instruction.png")//first page 
 
}

 q

function setup() {
  createCanvas(windowWidth, windowHeigth);




}//end set up

function draw() {
  background(0);//sky 2 mods: day/night 



}

function die (){
	//If user lost, run following
	updateSprites(false);
	  gameOver = true;
}

function newGame() {
  pipes.removeSprites();
  gameOver = false;
  updateSprites(true);
  player.position.x = width/2;
  player.position.y = height/2;
  player.velocity.y = 0;

  ground.position.x = 800/2;
  ground.position.y = GROUND_Y+100;
}
