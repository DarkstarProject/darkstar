-----------------------------------
--
-- Zone: Eastern_Altepa_Desert (114)
--
-----------------------------------

package.loaded["scripts/zones/Eastern_Altepa_Desert/TextIDs"] = nil;

require("scripts/zones/Eastern_Altepa_Desert/TextIDs");
require( "scripts/globals/icanheararainbow");
require("scripts/globals/zone");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17244649,17244650,17244651};
    
    SetFieldManual(manuals);
    
    -- Cactrot Rapido
    SetRespawnTime(17244539, 900, 10800);
    
    -- Centurio XII-I
    SetRespawnTime(17244372, 900, 10800);
    
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

	local cs = -1;

	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( 260.09, 6.013, 320.454, 76);
	end
	
	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0002;
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

	if( csid == 0x0002) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow	
	end		
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)			
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);

	if( csid == 0x0002) then
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end		
end;
