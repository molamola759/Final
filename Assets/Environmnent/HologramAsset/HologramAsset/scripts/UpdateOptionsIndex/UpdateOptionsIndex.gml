function UpdateOptionsIndex() {
	if (keyboard_check_pressed(vk_down)) {
		if (optionsIndex < nOptions - 1) {
			optionsIndex++;	
			presetIndex = 0;
		}
		else {
			optionsIndex = 0;	
			presetIndex = 0;
		}
	}	

	if (keyboard_check_pressed(vk_up)) {
		if (optionsIndex > 0) {
			optionsIndex--;	
			presetIndex = 0;
		}
		else {
			optionsIndex = nOptions - 1;
			presetIndex = 0;
		}
	}	


}
