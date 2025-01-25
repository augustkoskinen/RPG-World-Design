var advancetime = 0.25;

if(array_length(splittext)!=0) {
	var ratio = display_get_gui_width()/sprite_get_width(sDialogueBox)
	draw_sprite_stretched(sDialogueBox,0,
		0,display_get_gui_height()-sprite_get_height(sDialogueBox)*ratio,
		display_get_gui_width(),
		sprite_get_height(sDialogueBox)*ratio
	)
	draw_set_color(c_black)
	draw_set_font(txDialogue)
	draw_text_transformed(9*ratio,
		display_get_gui_height()-(sprite_get_height(sDialogueBox)-5)*ratio,
		array_get(splittext,0),
		ratio/1.5,
		ratio/1.5,
		0
	)
	if(1<array_length(splittext))
		draw_text_transformed(9*ratio,
			display_get_gui_height()-(sprite_get_height(sDialogueBox)-14)*ratio,
			array_get(splittext,1),
			ratio/1.5,
			ratio/1.5,
			0
		)
	
	var prevval = advancebuffer;
	
	if(keyboard_check_pressed(vk_space)&&advancebuffer<=0) {
		advancebuffer = advancetime;
	} else if (advancebuffer>0) {
		advancebuffer-= delta_time/1000000
	}
	
	if((advancebuffer<=advancetime/2&&prevval>advancetime/2)||(advancebuffer<=0&&prevval>0)) {
		array_delete(splittext,0,1)
	}
	
	if(array_length(splittext)<=0) {
		advancebuffer = 0
		curtext = "";
		splittext = array_create(0)
		oPlayer.generalstate = playergeneralstate.normal;
	}
}