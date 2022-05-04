/// @description DICHIARAZIONE INPUTS

//PER ORA DICHIARIAMO BASILARMENTE
//PRIMA CHE DIVENTI TROPPO ELABORATO
//VEDIAMO DI FARE UNO SCHEMINO SU UN JOYSTICK/TASTIERA

//CONSIDERATE L'ENUM COME IL VERBO CHE DESCRIVE L'AZIONE!
//

enum inputCommand{
	moveLeft,
	moveRight,
	jump,	
	shiftShape
}

//ASSOCIAZIONE TASTIERA - COMANDO
input_default_key(vk__left, inputCommand.moveLeft);
input_default_key(vk_right, inputCommand.moveRight);
input_default_key(vk_up, inputCommand.jump);
input_default_key(vk_down, inputCommand.shiftShape);

//AGGIUNGIAMO LA TASTIERA ALLE SORGENTI DI INPUT
input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);

//ASSOCIAZIONE GAMEPAD - COMANDO
input_default_gamepad_button(gp_padl, inputCommand.moveLeft);
input_default_gamepad_button(gp_padr, inputCommand.moveRight);
input_default_gamepad_button(gp_padu, inputCommand.jump);
input_default_gamepad_button(gp_padd, inputCommand.shiftShape);

//AGGIUNGIAMO IL GAMEPAD ALLE SORGENTI DI INPUT
input_player_source_set(INPUT_SOURCE.GAMEPAD);
//SET AL PRIMO GAMEPAD TROVATO
input_player_gamepad_set(0);

