-----------------------------------
--
-- Zone: Yuhtunga_Jungle (123)
--
-----------------------------------
package.loaded["scripts/zones/Yuhtunga_Jungle/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Yuhtunga_Jungle/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/zone");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)		

    local manuals = {17281641,17281642,17281643,17281644};
    
    SetFieldManual(manuals);

	local Rose_Garden = 17281357;
	GetMobByID(Rose_Garden):setLocalVar("1",os.time() + math.random((36000), (37800)));
    
    SetRegionalConquestOverseers(zone:getRegionID())
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
-- onZoneIn		
-----------------------------------		

function onZoneIn( player, prevZone)

	cs = -1;

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( 116.825, 6.613, 100, 140);
	end

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x000b;
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

	if (csid == 0x000b) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);		
--printf("RESULT: %u",option);

	if (csid == 0x000b) then		
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end		
end;
