-----------------------------------
--
-- Zone: North_Gustaberg (106)
--
-----------------------------------

package.loaded["scripts/zones/North_Gustaberg/TextIDs"] = nil;

require("scripts/zones/North_Gustaberg/TextIDs");
require( "scripts/globals/icanheararainbow");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize( zone)		
end;		

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn( player, prevZone)

	cs = -1;

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( -518.867, 35.538, 588.64, 50);
	end

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x00f4;
	end

	return cs;		
end;			

-----------------------------------			
-- onRegionEnter			
-----------------------------------			

function onRegionEnter( player, region)			
end;			

-----------------------------------			
-- onEventUpdate			
-----------------------------------			

function onEventUpdate( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if (csid == 0x00f4) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow	
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);	
--printf("RESULT: %u",option);

	if (csid == 0x00f4) then		
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end		
end;			
