-----------------------------------
--
-- Zone: Tahrongi_Canyon (117)
--
-----------------------------------

package.loaded["scripts/zones/Tahrongi_Canyon/TextIDs"] = nil;

require("scripts/zones/Tahrongi_Canyon/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/zone");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17257073,17257074,17257075};
    
    SetFieldManual(manuals);
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn( player, prevZone)

	local cs = -1;

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( 442.781, -1.641, -40.144, 160);
	end

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0023;
	end
	
	return cs;		
end;			


-----------------------------------		
-- onConquestUpdate		
-----------------------------------		

function onConquestUpdate(zone, updatetype)
    local players = zone:getPlayers();
    
    for name, player in pairs(players) do
        conquestUpdate(zone, player, updatetype, CONQUEST_BASE);
    end
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

	if( csid == 0x0023) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow	
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if( csid == 0x0023) then		
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end		
end;
