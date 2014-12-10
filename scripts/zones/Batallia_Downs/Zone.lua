-----------------------------------
--
-- Zone: Batallia_Downs (105)
--
-----------------------------------

package.loaded[ "scripts/zones/Batallia_Downs/TextIDs"] = nil;

require( "scripts/zones/Batallia_Downs/TextIDs");
require("scripts/globals/zone");
require( "scripts/globals/icanheararainbow");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)		
    local manuals = {17207865,17207866};
    
    SetFieldManual(manuals);
    
    -- Ahtu
    SetRespawnTime(17207657, 900, 10800);
end;

-----------------------------------
-- onZoneIn
-----------------------------------

function onZoneIn( player, prevZone)

	local cs = -1;

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( -693.609, -14.583, 173.59, 30);
	end

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0385;
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

	if( csid == 0x0385) then
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
	end
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish( player, csid, option)
--printf("CSID: %u",csid);	
--printf("RESULT: %u",option);

	if( csid == 0x0385) then
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end
end;
