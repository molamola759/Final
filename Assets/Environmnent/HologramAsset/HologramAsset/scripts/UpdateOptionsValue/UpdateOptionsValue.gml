function UpdateOptionsValue() {
	if (keyboard_check_pressed(vk_right) || keyboard_check_pressed(vk_left)) {
		switch(optionsIndex) {
		#region // color
			case opt.color:
				if (color == c_white) {
					color = c_aqua;	
				}
				else if (color == c_aqua) {
					color = c_red;	
				}
				else {
					color = c_white;	
				}
				break;
		#endregion
		
		#region // opacity
			case opt.opacity:
				if (opacity < 1) 
					opacity += 0.1;
				else
					opacity = 0;
				break;
		#endregion
		
		#region // fade
			case opt.fade:
				if (fade == fadePresets.none) {
					fade = fadePresets.fadeUp;	
				}
				else if (fade == fadePresets.fadeUp) {
					fade = fadePresets.fadeDown;	
				}
				else {
					fade = fadePresets.none;	
				}
				break;
		#endregion
		
		#region // reflection
			case opt.reflection:
				if (reflection < 1) 
					reflection += 0.1;
				else
					reflection = 0;
				break;
		#endregion
		
		#region // back light
			case opt.backLight:
				if (backLight < 1) 
					backLight += 0.1;
				else
					backLight = 0;
				break;
		#endregion
		
		#region // back light color
			case opt.backLightColor:
				if (backLightColor == c_white) {
					backLightColor = c_aqua;	
				}
				else if (backLightColor == c_aqua) {
					backLightColor = c_red;	
				}
				else {
					backLightColor = c_white;	
				}
				break;
		#endregion
		
		#region // back light scale
			case opt.backLightScale:
				if (backLightScale < 2)
					backLightScale += 0.1;
				else 
					backLightScale = 0;
				break;
		#endregion
		
		#region // front light
			case opt.frontLight:
				if (frontLight < 1) 
					frontLight += 0.1;
				else
					frontLight = 0;
				break;
		#endregion
		
		#region // front light color
			case opt.frontLightColor:
				if (frontLightColor == c_white) {
					frontLightColor = c_aqua;	
				}
				else if (frontLightColor == c_aqua) {
					frontLightColor = c_red;	
				}
				else {
					frontLightColor = c_white;	
				}
				break;
		#endregion
		
		#region // front light scale
			case opt.frontLightScale:
				if (frontLightScale < 2)
					frontLightScale += 0.1;
				else 
					frontLightScale = 0;
				break;
		#endregion
		
		#region // static_fuzz
			case opt.static_fuzz:
				if (static_fuzz < 1) 
					static_fuzz += 0.1;
				else
					static_fuzz = 0;
				break;
		#endregion
		
		#region // artifact width
			case opt.artifactWidth:
				if (artifactWidth < 10)
					artifactWidth += 1;
				else 
					artifactWidth = 0;
				break;
		#endregion
		
		#region // artifact height
			case opt.artifactHeight:
				if (artifactHeight < 10)
					artifactHeight += 1;
				else 
					artifactHeight = 0;
				break;
		#endregion
		
		#region // artifact speed
			case opt.artifactSpeed:
				if (artifactSpeed < 10)
					artifactSpeed += 1;
				else 
					artifactSpeed = 0;
				break;
		#endregion
		
		#region // artifact opacity
			case opt.artifactOpacity:
				if (artifactOpacity < 1)
					artifactOpacity += 0.1;
				else 
					artifactOpacity = 0;
				break;
		#endregion
		
		#region // artifact time on
			case opt.artifactTimeOn:
				if (artifactTimeOn < 100)
					artifactTimeOn += 10;
				else
					artifactTimeOn = 0;
				break;
		#endregion
		
		#region // artifact time off
			case opt.artifactTimeOff:
				if (artifactTimeOff < 100)
					artifactTimeOff += 10;
				else
					artifactTimeOff = 0;
				break;
		#endregion
		
		#region // glitch speed
			case opt.glitchSpeed:
				if (glitchSpeed < 100)
					glitchSpeed += 10;
				else 
					glitchSpeed = 0;
				break;
		#endregion
		
		#region // glitch size
			case opt.glitchSize:
				if (glitchSize < 10)
					glitchSize++;
				else
					glitchSize = 0;
				break;
		#endregion
		
		#region // glitch time on
			case opt.glitchTimeOn:
				if (glitchTimeOn < 100)
					glitchTimeOn += 10;
				else
					glitchTimeOn = 0;
				break;
		#endregion
		
		#region // glitch time off
			case opt.glitchTimeOff:
				if (glitchTimeOff < 100)
					glitchTimeOff += 10;
				else
					glitchTimeOff = 0;
				break;
		#endregion
		
		#region // scanOpacity
			case opt.scanOpacity:
				if (scanLineOpacity < 1)
					scanLineOpacity += 0.1;
				else
					scanLineOpacity = 0;
				break;
		#endregion
		
		#region // scanWidth
			case opt.scanWidth:
				if (scanLineWidth < 10)
					scanLineWidth += 1;
				else
					scanLineWidth = 0;
				break;
		#endregion
		
		#region // scanColor
			case opt.scanColor:
				if (scanLineColor == c_white) {
					scanLineColor = c_aqua;	
				}
				else if (scanLineColor == c_aqua) {
					scanLineColor = c_red;	
				}
				else {
					scanLineColor = c_white;	
				}
				break;
		#endregion	
		
		#region // scanSpeed
			case opt.scanSpeed:
				if (scanLineSpeed < 10)
					scanLineSpeed += 1;
				else
					scanLineSpeed = 0;
				break;
		#endregion	
		
		#region // scanDir
			case opt.scanDir:
				if (scanLineDir == 1)
					scanLineDir = -1;
				else
					scanLineDir = 1;
				break;
		#endregion
		}
	}


}
