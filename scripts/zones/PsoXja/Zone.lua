-----------------------------------
--
-- Zone: PsoXja (9)
--
-----------------------------------
package.loaded["scripts/zones/PsoXja/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/status");
require("scripts/zones/PsoXja/TextIDs");
require("scripts/globals/missions");

-----------------------------------
-- onInitialize
-----------------------------------

function onInitialize(zone)
end;

-----------------------------------		
-- onZoneIn		
-----------------------------------		

function onZoneIn(player,prevZone)		
	cs = -1;	
	local playerX = player:getXPos();

	if ((playerX == 0) and (player:getYPos() == 0) and (player:getZPos() == 0)) then
		player:setPos(-29.956,-1.903,212.521,188);
	end
	if(ENABLE_COP_ZONE_CAP == 1)then
		local LVLcap = player:getVar("PSOXJA_RESTRICTION_LVL");
		if (LVLcap > 0)then
			player:addStatusEffect(EFFECT_LEVEL_RESTRICTION,LVLcap,0,0);-- ZONE LEVEL RESTRICTION
		end
	 end
	if(playerX == -300 and player:getCurrentMission(COP) == THE_ENDURING_TUMULT_OF_WAR and player:getVar("PromathiaStatus")==2)then
		cs = 0x0001; -- COP event
	elseif(playerX == 220 and player:getCurrentMission(COP) == THREE_PATHS and player:getVar("COP_Tenzen_s_Path") == 8)then
	    cs = 0x0004;
	end
	return cs;
end;

-----------------------------------
-- onRegionEnter
-----------------------------------

function onRegionEnter(player,region)
--print(region:GetRegionID());

----------------------------------------------------------------

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
	if(csid == 0x0001)then
	  player:setVar("PromathiaStatus",3);
	elseif(csid == 0x0004)then
	  player:setVar("COP_Tenzen_s_Path",9);
	end
end;
