-----------------------------------
--
-- Zone: Konschtat_Highlands (108)
--
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Konschtat_Highlands/TextIDs");
require("scripts/globals/zone");
require("scripts/globals/icanheararainbow");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)		
    local manuals = {17220164,17220165};
    
    SetFieldManual(manuals);
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn( player, prevZone)

	local cs = -1;

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( 521.922, 28.361, 747.85, 45);
	end	

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0068;
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

	if( csid == 0x0068) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if( csid == 0x0068) then		
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end		
end;
