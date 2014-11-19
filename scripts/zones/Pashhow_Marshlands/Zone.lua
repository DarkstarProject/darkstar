-----------------------------------
--
-- Zone: Pashhow_Marshlands (109)
--
-----------------------------------
package.loaded[ "scripts/zones/Pashhow_Marshlands/TextIDs"] = nil;
package.loaded[ "scripts/globals/missions"] = nil;
-----------------------------------

require("scripts/globals/zone");
require("scripts/globals/settings");
require("scripts/globals/missions");
require("scripts/globals/quests");
require("scripts/zones/Pashhow_Marshlands/TextIDs");
require("scripts/globals/icanheararainbow");
require("scripts/globals/conquest");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)		
    local manuals = {17224349,17224350};
    
    SetFieldManual(manuals);
    
    SetRegionalConquestOverseers(zone:getRegionID())
    
end;

-----------------------------------			
-- onZoneIn			
-----------------------------------			

function onZoneIn( player, prevZone)			
	
	cs = -1;
	
	if( player:getXPos() == 0 and player:getYPos() == 0 and player:getZPos() == 0) then
		player:setPos( 547.841, 23.192, 696.323, 136);	
	end
	
	if( prevZone == 147 and player:getCurrentMission( BASTOK) == THE_FOUR_MUSKETEERS) then		
		missionStatus = player:getVar("MissionStatus");	
		if(missionStatus < 22) then	
			cs = 0x000a;
		elseif(missionStatus == 22) then	
			cs = 0x000b;
		end	
	elseif( triggerLightCutscene( player)) then -- Quest: I Can Hear A Rainbow
		cs = 0x000d;
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
	
	if( csid == 0x000d) then		
		lightCutsceneUpdate( player);  -- Quest: I Can Hear A Rainbow
	end	
	
end;			

-----------------------------------			
-- onEventFinish			
-----------------------------------			

function onEventFinish( player, csid, option)		
--printf("CSID: %u",csid);	
--printf("RESULT: %u",option);	
	
	if( csid == 0x000a) then	
		player:setPos( 578, 25, -376, 126);
	elseif( csid == 0x000b) then	
		finishMissionTimeline( player, 1, csid, option);
		player:setPos( 578, 25, -376, 126);
	elseif( csid == 0x000d) then	
		lightCutsceneFinish( player);  -- Quest: I Can Hear A Rainbow
	end	
	
end;
