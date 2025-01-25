var textlines = 43;

if(curtext!=""&&array_length(splittext)==0) {
	while(string_length(curtext)!=0) {
		var addl = 0;
		while(addl<textlines) {
			if(string_pos_ext(" ",curtext,addl)==0) {
				if(string_length(curtext)<textlines) {
					addl = string_length(curtext)+1
					break;
				}
			} else 
				if(string_pos_ext(" ",curtext,addl)+1<textlines) {
					addl = string_pos_ext(" ",curtext,addl)+1
				} else break;
		}
		array_push(splittext,string_copy(curtext,0,addl-1));
		curtext = string_copy(curtext,addl,string_length(curtext)-addl+1)
	}
	curtext = "";
	oPlayer.generalstate = playergeneralstate.dialogue
}
