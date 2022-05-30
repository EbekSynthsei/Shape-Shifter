/// @description DICHIARAZIONE INPUTS

//PER ORA DICHIARIAMO BASILARMENTE
//PRIMA CHE DIVENTI TROPPO ELABORATO
//VEDIAMO DI FARE UNO SCHEMINO SU UN JOYSTICK/TASTIERA

//CONSIDERATE L'ENUM COME IL VERBO CHE DESCRIVE L'AZIONE!
//

enum inputCommand{
	pauseMenu,
	moveLeft,
	moveRight,
	dash,
	jump,
	skill,
	triangleShape,	
	squareShape,
	circleShape,
	blobShape	
}

//ASSOCIAZIONE TASTIERA - COMANDO
input_default_key(vk_tab, inputCommand.pauseMenu);

input_default_key(vk_left, inputCommand.moveLeft);
input_default_key(ord("A"), inputCommand.moveLeft, 1);
input_default_key(vk_right, inputCommand.moveRight);
input_default_key(ord("S"), inputCommand.moveRight, 1);

input_default_key(vk_shift, inputCommand.dash);
input_default_mouse_button(mb_right, inputCommand.dash, 1);

input_default_key(vk_space, inputCommand.jump);

input_default_key(ord("Q"), inputCommand.skill);
input_default_mouse_button(mb_left, inputCommand.skill, 1);

input_default_key(ord("Z"), inputCommand.triangleShape);
input_default_key(ord("X"), inputCommand.squareShape);
input_default_key(ord("C"), inputCommand.circleShape);
input_default_key(ord("R"), inputCommand.blobShape);


//AGGIUNGIAMO LA TASTIERA ALLE SORGENTI DI INPUT
input_player_source_set(INPUT_SOURCE.KEYBOARD_AND_MOUSE);

//ASSOCIAZIONE GAMEPAD - COMANDO
input_default_gamepad_button(gp_select, inputCommand.pauseMenu);

input_default_gamepad_button(gp_padl, inputCommand.moveLeft);
input_default_gamepad_button(gp_padr, inputCommand.moveRight);

input_default_gamepad_button(gp_shoulderl, inputCommand.dash);

input_default_gamepad_button(gp_padu, inputCommand.jump);
input_default_gamepad_button(gp_face1, inputCommand.jump, 1);

input_default_gamepad_button(gp_shoulderrb, inputCommand.skill);
input_default_gamepad_button(gp_face2, inputCommand.circleShape);
input_default_gamepad_button(gp_face3, inputCommand.squareShape);
input_default_gamepad_button(gp_face4, inputCommand.triangleShape);
input_default_gamepad_button(gp_shoulderlb, inputCommand.blobShape);

//AGGIUNGIAMO IL GAMEPAD ALLE SORGENTI DI INPUT
input_player_source_set(INPUT_SOURCE.GAMEPAD);

//SET AL PRIMO GAMEPAD TROVATO
input_player_gamepad_set(0);
