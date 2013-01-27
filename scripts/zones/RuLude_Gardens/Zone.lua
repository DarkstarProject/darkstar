-----------------------------------
--
-- Zone: RuLude_Gardens (243)
--
-----------------------------------

package.loaded["scripts/zones/RuLude_Gardens/TextIDs"] = nil;
require("scripts/zones/RuLude_Gardens/TextIDs");
require("scripts/globals/missions");
-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
zone:registerRegion(1,-3,-2,42,3,3,47);
end;

-----------------------------------			
-- onZoneIn			
-----------------------------------			

function onZoneIn(player,prevZone)			
	cs = -1;		
	-- MOG HOUSE EXIT		
	if ((player:getXPos() == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then		
		position = math.random(1,5) + 45;	
		player:setPos(position,10,-73,192);	
		if (player:getMainJob() ~= player:getVar("PlayerMainJob")) then	
			cs = 0x7534;
		end	
		player:setVar("PlayerMainJob",0);	
	end		
	return cs;		
end;	
-----------------------------------		
-- onRegionEnter		
-----------------------------------		

function onRegionEnter(player,region)
local regionID =region:GetRegionID();
--printf("regionID: %u",regionID);
  if(regionID==1 and player:getCurrentMission(COP) ==A_VESSEL_WITHOUT_A_CAPTAIN and player:getVar("PromathiaStatus")==1)then
  player:startEvent(0x0041,player:getNation());
  end	
end;	
-----------------------------------		
-- onRegionLeave		
-----------------------------------		

function onRegionLeave(player,region)	
end;
-----------------------------------	
-- onEventUpdate	
-----------------------------------	

function onEventUpdate(player,csid,option)	
	--printf("CSID: %u",csid);
	--printf("RESULT: %u",option);
end;	

-----------------------------------	
-- onEventFinish	
-----------------------------------	

function onEventFinish(player,csid,option)	
	--printf("CSID: %u",csid);	
	--printf("RESULT: %u",option);
	if(csid == 0x0041) then
	 player:setVar("PromathiaStatus",0);
	    player:completeMission(COP,A_VESSEL_WITHOUT_A_CAPTAIN);		
		player:addMission(COP,THE_ROAD_FORKS); --THE_ROAD_FORKS -- global mission 3.3
		--We can't have more than 1 current mission at the time , so we keep The road forks as current mission
		--progress are recorded in the following two variables
		player:setVar("MEMORIES_OF_A_MAIDEN_Status",1); --MEMORIES_OF_A_MAIDEN--3-3B: Windurst Road
		player:setVar("EMERALD_WATERS_Status",1); --EMERALD_WATERS-- 3-3A: San d'Oria Road	
	elseif (csid == 0x7534 and option == 0) then	
		player:setHomePoint();
		player:messageSpecial(HOMEPOINT_SET);
	end	
end;		
