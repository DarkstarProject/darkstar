-----------------------------------
--
-- Zone: Meriphataud_Mountains (119)
--
-----------------------------------
package.loaded["scripts/zones/Meriphataud_Mountains/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Meriphataud_Mountains/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/zone");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17265290,17265291,17265292};
    
    SetFieldManual(manuals);
    
    -- Waraxe Beak
    SetRespawnTime(17264828, 900, 10800);
    
    -- Coo Keja the Unseen
    SetRespawnTime(17264946, 900, 10800);
    
    SetRegionalConquestOverseers(zone:getRegionID())
    
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn( player, prevZone)		

	local cs = -1;

	if (player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then	
		player:setPos( 752.632, -33.761, -40.035, 129);
	end

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x001f;
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

	if (csid == 0x001f) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if( csid == 0x001f) then		
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end		
end;
