/// @description Draw Hologram

if (drawHologram) {
	#region DO NOT MODIFY - Hologram Draw
	var spr				= sprite_index;
	var sprWhite		= asset_get_index(string(sprite_get_name(sprite_index)) + "White");
	var sprLight		= sLight;
	
	var spriteHeight	= sprite_get_bbox_bottom(spr) + 1 - sprite_get_bbox_top(spr);
	var spriteWidth		= sprite_get_bbox_right(spr) + 1 - sprite_get_bbox_left(spr);
	var sprWidth		= sprite_get_width(spr);
	var sprHeight		= sprite_get_height(spr);
	
	#region Draw Back Light
		if (backLight > 0) {
			draw_sprite_ext(sprLight, 0, x - 1, y - 1, backLightScale, 1, 0, backLightColor, backLight);
		}
		if (reflection > 0) {
			draw_sprite_ext(sprLight, 0, x - 1, y + 1, backLightScale, 1, 180, backLightColor, backLight * reflection);
		}
	#endregion

	#region Fade Hologram Up Preset
	if (fade == fadePresets.fadeUp) {
		for (var t = 0; t <= sprHeight; t++) {
			if (t mod (skip + 1) == 0) {
				#region Draw Hologram
			    draw_sprite_part_ext(
					spr,											// sprite
					image_index,									// subimage
					0,												// left
					sprite_get_height(spr) - t,						// top
					sprite_get_width(spr),							// width
					1,												// height
					x - (sprite_get_width(spr) / 2),				// x position
					y - t,											// y position
					image_xscale,									// xscale
					image_yscale,									// yscale
					color,											// color
					t / sprHeight * opacity							// alpha
				);
				#endregion
			
				#region Draw Reflection
				draw_sprite_part_ext(
					spr,											// sprite
					image_index,									// subimage
					0,												// left
					sprite_get_height(spr) - t,						// top
					sprite_get_width(spr),							// width
					1,												// height
					x - (sprite_get_width(spr) / 2),				// x position
					y + t - 1,										// y position
					image_xscale,									// xscale
					image_yscale,									// yscale
					color,											// color
					(t / sprHeight) * reflection * opacity			// alpha
				);
				#endregion
			}
		}
	
		#region Draw Scan Lines
		if (scanIteration mod (skip + 1) == 0 && sprWhite != -1) {
			draw_sprite_part_ext(
				sprWhite,																	// sprite
				image_index,																// subimage
				0,																			// left
				sprite_get_height(spr) - scanIteration,										// top
				sprite_get_width(spr),														// width
				scanLineWidth,																// height
				x - (sprite_get_width(spr) / 2),											// x position
				y - scanIteration,															// y position
				image_xscale,																// xscale
				image_yscale,																// yscale
				scanLineColor,																// color
				scanLineOpacity * (1 - ((sprHeight - scanIteration) / sprHeight)) * opacity	// alpha
			);
		}
		
		// Draw scan lines on reflection
		if (reflection > 0) {
			if (scanIteration mod (skip + 1) == 0 && sprWhite != -1) {
				draw_sprite_part_ext(
					sprWhite,																						// sprite
					image_index,																					// subimage
					0,																								// left
					sprite_get_height(spr) - scanIteration,															// top
					sprite_get_width(spr),																			// width
					scanLineWidth,																					// height
					x - (sprite_get_width(spr) / 2),																// x position
					y + scanIteration,																				// y position
					image_xscale,																					// xscale
					-image_yscale,																					// yscale
					scanLineColor,																					// color
					scanLineOpacity * (1 - ((spriteHeight - scanIteration) / spriteHeight)) * reflection * opacity	// alpha
				);
			}	
		}
		#endregion
		
		#region Artifact Glitch
		if (artifactSpeed > 0 && alarm[3] > 0) {
		
			// Get new random values
			if (artifactIter mod artifactSpeed == 0) {
				artL = irandom_range(sprite_get_bbox_left(spr), sprite_get_bbox_right(spr));
				artT = irandom_range(sprite_get_bbox_top(spr), sprite_get_bbox_bottom(spr));
				artW = irandom_range(1, artifactWidth);
				artH = irandom_range(1, artifactHeight);
				artX = irandom_range(-spriteWidth / 2 - (artW / 2), spriteWidth / 2 - (artW / 2));
				artY = irandom_range(sprHeight - sprite_get_bbox_bottom(spr), sprHeight - sprite_get_bbox_bottom(spr) + spriteHeight + (artH / 2));
			}

			draw_sprite_part_ext(
				spr,																				// sprite
				image_index,																		// subimage
				artL,																				// left
				artT,																				// top
				artW,																				// width
				artH,																				// height
				x + artX,																			// x position
				y - artY,																			// y position
				image_xscale,																		// xscale
				image_yscale,																		// yscale
				color,																				// color
				artifactOpacity * (1 - ((spriteHeight - (artY - artH)) / spriteHeight))	* opacity	// alpha
			);
			
			// Draw artifacts in reflection
			if (reflection > 0) {
				draw_sprite_part_ext(
					spr,																							// sprite
					image_index,																					// subimage
					artL,																							// left
					artT,																							// top
					artW,																							// width
					artH,																							// height
					x + artX,																						// x position
					y + artY,																						// y position
					image_xscale,																					// xscale
					-image_yscale,																					// yscale
					color,																							// color
					artifactOpacity * (1 - ((spriteHeight - (artY - artH)) / spriteHeight)) * reflection * opacity	// alpha
				);	
			}
		}
		#endregion
	}
	#endregion

	#region Fade Hologram Down Preset
	else if (fade == fadePresets.fadeDown) {
		for (var t = 0; t <= sprHeight; t++) {
			if (t mod (skip + 1) == 0) {
				#region Draw Hologram
			    draw_sprite_part_ext(
					spr,											// sprite
					image_index,									// subimage
					0,												// left
					sprite_get_height(spr) - t,						// top
					sprite_get_width(spr),							// width
					1,												// height
					x - (sprite_get_width(spr) / 2),				// x position
					y - t,											// y position
					image_xscale,									// xscale
					image_yscale,									// yscale
					color,											// color
					1 - (t / sprHeight)	* opacity					// alpha
				);
				#endregion
			
				#region Draw Reflection
				draw_sprite_part_ext(
					spr,											// sprite
					image_index,									// subimage
					0,												// left
					sprite_get_height(spr) - t,						// top
					sprite_get_width(spr),							// width
					1,												// height
					x - (sprite_get_width(spr) / 2),				// x position
					y + t - 1,										// y position
					image_xscale,									// xscale
					image_yscale,									// yscale
					color,											// color
					(1 - (t / sprHeight)) * reflection	* opacity	// alpha
				);
				#endregion
			}
		}
	
		#region Draw Scan Lines
		if (scanIteration mod (skip + 1) == 0  && sprWhite != -1) {
			draw_sprite_part_ext(
				sprWhite,																// sprite
				image_index,															// subimage
				0,																		// left
				sprite_get_height(spr) - scanIteration,									// top
				sprite_get_width(spr),													// width
				scanLineWidth,															// height
				x - (sprite_get_width(spr) / 2),										// x position
				y - scanIteration,														// y position
				image_xscale,															// xscale
				image_yscale,															// yscale
				scanLineColor,															// color
				scanLineOpacity * ((sprHeight - scanIteration) / sprHeight)	* opacity	// alpha
			);
		}
		
		// Draw scan lines on reflection
		if (reflection > 0) {
			if (scanIteration mod (skip + 1) == 0 && sprWhite != -1) {
				draw_sprite_part_ext(
					sprWhite,																			// sprite
					image_index,																		// subimage
					0,																					// left
					sprite_get_height(spr) - scanIteration,												// top
					sprite_get_width(spr),																// width
					scanLineWidth,																		// height
					x - (sprite_get_width(spr) / 2),													// x position
					y + scanIteration,																	// y position
					image_xscale,																		// xscale
					-image_yscale,																		// yscale
					scanLineColor,																		// color
					scanLineOpacity * ((sprHeight - scanIteration) / sprHeight) * reflection * opacity	// alpha
				);
			}	
		}
		#endregion
		
		#region Artifact Glitch
		if (artifactSpeed > 0 && alarm[3] > 0) {
			// Get new random values
			if (artifactIter mod artifactSpeed == 0) {
				artL = irandom_range(sprite_get_bbox_left(spr), sprite_get_bbox_right(spr));
				artT = irandom_range(sprite_get_bbox_top(spr), sprite_get_bbox_bottom(spr));
				artW = irandom_range(1, artifactWidth);
				artH = irandom_range(1, artifactHeight);
				artX = irandom_range(-spriteWidth / 2 - (artW / 2), spriteWidth / 2 - (artW / 2));
				artY = irandom_range(sprHeight - sprite_get_bbox_bottom(spr), sprHeight - sprite_get_bbox_bottom(spr) + spriteHeight + (artH / 2));
			}

			draw_sprite_part_ext(
				spr,																		// sprite
				image_index,																// subimage
				artL,																		// left
				artT,																		// top
				artW,																		// width
				artH,																		// height
				x + artX,																	// x position
				y - artY,																	// y position
				image_xscale,																// xscale
				image_yscale,																// yscale
				color,																		// color
				artifactOpacity * ((spriteHeight - (artY - artH)) / spriteHeight) * opacity	// alpha
			);
			
			// Draw artifacts in reflection
			if (reflection > 0) {
				draw_sprite_part_ext(
					spr,																						// sprite
					image_index,																				// subimage
					artL,																						// left
					artT,																						// top
					artW,																						// width
					artH,																						// height
					x + artX,																					// x position
					y + artY,																					// y position
					image_xscale,																				// xscale
					-image_yscale,																				// yscale
					color,																						// color
					artifactOpacity * ((spriteHeight - (artY - artH)) / spriteHeight) * reflection * opacity	// alpha
				);	
			}
		}
		#endregion
	}
	#endregion
	
	#region No Hologram Fade Preset
	else if (fade == fadePresets.none) {
		for (var t = 0; t <= sprHeight; t++) {
			if (t mod (skip + 1) == 0) {
				#region Draw Hologram
			    draw_sprite_part_ext(
					spr,											// sprite
					image_index,									// subimage
					0,												// left
					sprite_get_height(spr) - t,						// top
					sprite_get_width(spr),							// width
					1,												// height
					x - (sprite_get_width(spr) / 2),				// x position
					y - t,											// y position
					image_xscale,									// xscale
					image_yscale,									// yscale
					color,											// color
					opacity											// alpha
				);
				#endregion
			
				#region Draw Reflection
				draw_sprite_part_ext(
					spr,											// sprite
					image_index,									// subimage
					0,												// left
					sprite_get_height(spr) - t,						// top
					sprite_get_width(spr),							// width
					1,												// height
					x - (sprite_get_width(spr) / 2),				// x position
					y + t - 1,										// y position
					image_xscale,									// xscale
					image_yscale,									// yscale
					color,											// color
					reflection * opacity							// alpha
				);
				#endregion
			}
		}
	
		#region Draw Scan Lines
		if (scanIteration mod (skip + 1) == 0 && sprWhite != -1) {
			draw_sprite_part_ext(
				sprWhite,											// sprite
				image_index,										// subimage
				0,													// left
				sprite_get_height(spr) - scanIteration,				// top
				sprite_get_width(spr),								// width
				scanLineWidth,										// height
				x - (sprite_get_width(spr) / 2),					// x position
				y - scanIteration,									// y position
				image_xscale,										// xscale
				image_yscale,										// yscale
				scanLineColor,										// color
				scanLineOpacity	* opacity							// alpha
			);
		}
		
		// Draw Scan lines on reflection
		if (reflection > 0) {
			if (scanIteration mod (skip + 1) == 0 && sprWhite != -1) {
				draw_sprite_part_ext(
					sprWhite,											// sprite
					image_index,										// subimage
					0,													// left
					sprite_get_height(spr) - scanIteration,				// top
					sprite_get_width(spr),								// width
					scanLineWidth,										// height
					x - (sprite_get_width(spr) / 2),					// x position
					y + scanIteration,									// y position
					image_xscale,										// xscale
					-image_yscale,										// yscale
					scanLineColor,										// color
					scanLineOpacity * reflection * opacity				// alpha
				);
			}		
		}
		#endregion
		
		#region Artifact Glitch
		if (artifactSpeed > 0 && alarm[3] > 0) {
		
			// Get new random values
			if (artifactIter mod artifactSpeed == 0) {
				artL = irandom_range(sprite_get_bbox_left(spr), sprite_get_bbox_right(spr));
				artT = irandom_range(sprite_get_bbox_top(spr), sprite_get_bbox_bottom(spr));
				artW = irandom_range(1, artifactWidth);
				artH = irandom_range(1, artifactHeight);
				artX = irandom_range(-spriteWidth / 2 - (artW / 2), spriteWidth / 2 - (artW / 2));
				artY = irandom_range(sprHeight - sprite_get_bbox_bottom(spr), sprHeight - sprite_get_bbox_bottom(spr) + spriteHeight + (artH / 2));
			}

			draw_sprite_part_ext(
				spr,								// sprite
				image_index,						// subimage
				artL,								// left
				artT,								// top
				artW,								// width
				artH,								// height
				x + artX,							// x position
				y - artY,							// y position
				image_xscale,						// xscale
				image_yscale,						// yscale
				color,								// color
				artifactOpacity	* opacity			// alpha
			);
			
			// Draw artifacts in reflection
			if (reflection > 0) {
				draw_sprite_part_ext(
					spr,									// sprite
					image_index,							// subimage
					artL,									// left
					artT,									// top
					artW,									// width
					artH,									// height
					x + artX,								// x position
					y + artY,								// y position
					image_xscale,							// xscale
					-image_yscale,							// yscale
					color,									// color
					artifactOpacity * reflection * opacity	// alpha
				);	
			}
		}
		#endregion
	}
	#endregion

	#region Draw Static Fuzz
	if (static_fuzz > 0 && sprWhite != -1) {
		for (var i = 0; i < sprWidth; i++) {
			for (var j = sprHeight; j >= 0; j--) {
				draw_sprite_part_ext(
					sprWhite,								// sprite
					image_index,							// subimage
					i,										// left
					j,										// top
					1,										// width
					1,										// height
					x + i - (sprWidth / 2),					// x position
					y + j - sprHeight,						// y position
					image_xscale,							// xscale
					image_yscale,							// yscale
					make_color_hsv(0, 0, irandom(255)),		// color
					static_fuzz								// alpha
				);
			}
		}
	
		// Draw Static Fuzz on reflection
		if (reflection > 0) {
			for (var i = 0; i < sprWidth; i++) {
				for (var j = sprHeight; j >= 0; j--) {
					draw_sprite_part_ext(
						sprWhite,								// sprite
						image_index,							// subimage
						i,										// left
						j,										// top
						1,										// width
						1,										// height
						x + i - (sprWidth / 2),					// x position
						(y - j) + sprHeight - 1,				// y position
						image_xscale,							// xscale
						image_yscale,							// yscale
						make_color_hsv(0, 0, irandom(255)),		// color
						static_fuzz * reflection				// alpha
					);
				}
			}	
		}
	}
	#endregion
	
	#region Draw Front Light
		if (frontLight > 0) {
			draw_sprite_ext(sprLight, 0, x - 1, y - 1, frontLightScale, 1, 0, frontLightColor, frontLight);
		}
		if (reflection > 0) {
			draw_sprite_ext(sprLight, 0, x - 1, y + 1, frontLightScale, 1, 180, frontLightColor, frontLight * reflection);
		}
	#endregion
	
#endregion
}	