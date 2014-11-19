-----------------------------------
--
-- Zone: Yhoator_Jungle (124)
--
-----------------------------------
package.loaded[ "scripts/zones/Yhoator_Jungle/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Yhoator_Jungle/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/zone");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
    local manuals = {17285694,17285695,17285696};
    
    SetFieldManual(manuals);
    
    -- Bright-handed Kunberry
    SetRespawnTime(17285220, 900, 10800);
    
    -- Bisque-heeled Sunberry
    SetRespawnTime(17285460, 900, 10800);
    
    -- Bright-handed Kunberry
    SetRespawnTime(17285526, 900, 10800);
    
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
		player:setPos( 299.997, -5.838, -622.998, 190);
	end

	if( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x0002;
	end		
	return cs;		
end;	

------------------------
-----------	
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
