/// @description INIT DEL PLAYER

//QUESTO CODICE POTRA' MUOVERSI VERSO UN ALTRO SCRIPT
//DEDICATO SOLO AL PLAYER MA E' PER SEGUIRE L'IMPLEMENTAZIONE
//STATI BASILARI - NON ESAUSTIVO
enum playerStates{
	idle,
	triangle,
	circle,
	square
}
//AGGIUNTA DELLA STATE MACHINE
pStateMachine = new StateMachine();

//DICHIARAZIONE DEGLI STATI
var idleState = new State();
var triangleState = new State();
var circleState = new State();
var squareState = new State();

//IMPLEMENTAZIONE DEL BEHAVIOUR

//IDLE
idleState.on_enter = function(){
	
}

idleState.on_update = function(){
	
	show_debug_message("Sono in IDLE");
	if(
		input_check(inputCommand.moveLeft) 
		|| input_check(inputCommand.moveRight)
		|| input_check(inputCommand.jump)
		|| input_check(inputCommand.shiftShape)
		)
		{
			show_debug_message("INPUT RICEVUTO");
			pStateMachine.change(playerStates.square);
		}
}

idleState.on_leave = function(){
	
}
///////////////////////////////////////

//TRIANGLE
triangleState.on_enter = function(){
	
}
triangleState.on_update = function(){
	show_debug_message("IL TRIANGOLO NO");
}
triangleState.on_leave = function(){
	
}
///////////////////////////////////////

//CIRCLE
circleState.on_enter = function(){
	show_debug_message("Sono diventato un cerchio che bello");
}

circleState.on_update = function(){
	if(input_check(inputCommand.jump)){
		pStateMachine.change(playerStates.triangle);
	}else if(input_check(inputCommand.shiftShape)){
		pStateMachine.change(playerStates.square);
	}
}

circleState.on_leave = function(){
	
}
//////////////////////////////////////

//SQUARE
squareState.on_enter = function(){
	show_debug_message("SONO DIVENTATO QUADRATO");
}

squareState.on_update = function(){
	show_debug_message("Sono un quadrato");
	if(pStateMachine.timer() > 100){
		pStateMachine.change(playerStates.circle);
	}
}
squareState.on_leave = function(){
	
}
////////////////////////////////////


//AGGIUNTA DEGLI STATI ALLA STATE MACHINE
pStateMachine.add(playerStates.idle, idleState);
pStateMachine.add(playerStates.triangle, triangleState);
pStateMachine.add(playerStates.circle, circleState);
pStateMachine.add(playerStates.square, squareState);

//INIT DELLO STATO DEL PLAYER
pStateMachine.change(playerStates.idle);
