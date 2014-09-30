-----------------------------------
--
-- Zone: West_Sarutabaruta (115)
--
-----------------------------------
package.loaded[ "scripts/zones/West_Sarutabaruta/TextIDs"] = nil;
-----------------------------------

require( "scripts/zones/West_Sarutabaruta/TextIDs");
require( "scripts/globals/icanheararainbow");
require("scripts/globals/zone");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17248864,17248865,17248866};
    
    SetFieldManual(manuals);
    
    SetRegionalConquestOverseers(zone:getRegionID())
    
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn( player, prevZone)

	local cs = -1;

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( -374.008, -23.712, 63.289, 213);
	end

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0030;
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

	if (csid == 0x0030) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if (csid == 0x0030) then		
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end		
end;			
