/// @description INIT DEL PLAYER

//QUESTO CODICE POTRA' MUOVERSI VERSO UN ALTRO SCRIPT
//DEDICATO SOLO AL PLAYER MA E' PER SEGUIRE L'IMPLEMENTAZIONE
//STATI BASILARI - NON ESAUSTIVO
enum playerStates{
	idleBlob,
	movimentoBlob,
	stunBlob,
	dieBlob,
	idleTriangle,
	movimentoTriangle,
	idleSquare,
	movimentoSquare,
	idleCircle,
	movimentoCircle
}

//VARIABILE INTEGRATA DI GAMEMAKER

puntiVita = 100;
//ACCELLERAZIONE - OGNI STATO AVRA' BISOGNO DI SETTARE LA SUA on_enter 
moveSpeed = 0.0;
//VELOCITA' LIMITE - VEDI SOPRA
maxHSpeed = 3;
maxVSpeed = 3;

//FRENO INERZIA ORIZZONTALE - DEVE ESSERE MINORE DI 1 E MAGGIORE DI 0
hDamp = 0.7;

fallSpeed = 1;
jumpSpeed = 2.5;

powerUpPoints = 0;

energia = 100;
velocitaRicaricaTriangolo = 1.0;
velocitaRicaricaQuadrato = 1.0;
velocitaRicaricaCerchio = 1.0;
valoreAttacco = 5;
tempoStun = 1.0;
tempoAttacco = 1.0;

//AGGIUNTA DELLA STATE MACHINE
pStateMachine = new StateMachine();

//DICHIARAZIONE DEGLI STATI
var idleBlob = new State();
var movimentoBlob = new State();
var stunBlob = new State();
var dieBlob = new State();


//IMPLEMENTAZIONE DEL BEHAVIOUR

//BLOB
///////////////////////////
//IDLE
idleBlob.on_enter = function() {
	sprite_index = Blob_idle;
	moveSpeed = 0.0;
	jumpSpeed = 0;
}
idleBlob.on_update = function(){
	//SE NON SIAMO MORTI 
	if( puntiVita > 0){
		//SE CI STIAMO MUOVENDO IN ORIZZONTALE RALLENTIAMO 
		if(hspeed!= 0){
			hspeed *= hDamp;
		}
		//NEL CASO NON ABBIAMO TUTTA L'ENERGIA LA RICARICHIAMO. UN MOLTIPLICATORE SAREBBE L'IDEALE.
		if(energia<100){
			energia++;
		}
		//SE ABBIAMO ENERGIA POSSIAMO SWITCHARE FORMA; ANCORA NON HO MESSO NULLA NEGLI STATI E NON SONO TUTTI
		if( energia >0 ){
			if(input_check(inputCommand.triangleShape)){
				pStateMachine.change(playerStates.idleTriangle);
			}
			if(input_check(inputCommand.squareShape)){
				pStateMachine.change(playerStates.idleSquare);
			}
			if(input_check(inputCommand.circleShape)){
				pStateMachine.change(playerStates.idleCircle);
			}
		}
		//SE DECIDIAMO DI MUOVERCI IN ORIZZONTALE CAMBIAMO STATO;
		if(	input_check(inputCommand.moveRight) || input_check(inputCommand.moveLeft)){
			pStateMachine.change(playerStates.movimentoBlob);
		}
	}
	else{
		pStateMachine.change(playerStates.dieBlob);
	}
}
idleBlob.on_leave = function(){

}

//MOVIMENTO
movimentoBlob.on_enter = function() {
	moveSpeed = 1.0;
	maxHSpeed = 3;
	jumpSpeed = 0.0;
	
}
movimentoBlob.on_update = function() {
	// PER DETERMINARE LA DIREZIONE DEL MOVIMENTO UTILIZZIAMO I BOOLEANI COME DIREZIONI
	dir = input_check(inputCommand.moveRight) - input_check(inputCommand.moveLeft);
	
	//Moltiplicando la direzione per la velocità di movimento otteniamo l'accellerazione
	var walk = dir * moveSpeed;
	
	//PER LIMITARE L'ACCELLERAZIONE PRENDIAMO IL VALORE ASSOLUTO E SOMMIAMO IL RISULTATO PRECEDENTE 
	//SOLO SE IL VALORE ASSOLUTO DELLA VELOCITA ORIZZONTALE E' INFERIORE ALLA VELOCITA' MASSIMA
	if(abs(hspeed)<maxHSpeed){
		hspeed+=walk;
	}
	//SE NON STIAMO PREMENDO NULLA TORNIAMO ALL'IDLE COSI' DA RALLENTARE
	if(!(input_check(inputCommand.moveLeft) || input_check(inputCommand.moveRight))){
		pStateMachine.change(playerStates.idleBlob);
	}
}
movimentoBlob.on_leave = function() {
}

//STUN
stunBlob.on_enter = function() {
}
stunBlob.on_update = function() {
}
stunBlob.on_leave = function(){
}

//DIE 
dieBlob.on_enter = function(){
}
dieBlob.on_update = function(){
}
dieBlob.on_leave = function(){
}

////////////////////////////////
//AGGIUNTA DEGLI STATI ALLA STATE MACHINE
pStateMachine.add(playerStates.idleBlob, idleBlob);
pStateMachine.add(playerStates.movimentoBlob, movimentoBlob);
pStateMachine.add(playerStates.stunBlob, stunBlob);
pStateMachine.add(playerStates.dieBlob, dieBlob);

//INIT DELLO STATO DEL PLAYER
pStateMachine.change(playerStates.idleBlob);
