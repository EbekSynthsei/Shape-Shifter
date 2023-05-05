/// @description Inserisci qui la descrizione
//Puoi scrivere il tuo codice in questo editor

/* draw_self() - Draws the instance sprite exactly like the default draw would*/
var msg = ""
	 if (playerStates.idleBlob){
	 msg = "Sono in idle state"
	 draw_self();
	 draw_text(x,y,msg);
	 } 
	 
	 if (playerStates.walkBlob) {
		 msg = "Sono in walk state"
	 draw_self();
	 draw_text(x,y,hspeed);
	 } 
	 