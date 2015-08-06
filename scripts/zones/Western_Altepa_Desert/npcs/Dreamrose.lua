-----------------------------------
-- Area: Western Altepa Desert
-- NPC:  Dreamrose
-- Involved in Mission: San D'Oria 6-1
-----------------------------------
package.loaded["scripts/zones/Western_Altepa_Desert/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/missions");
require("scripts/zones/Western_Altepa_Desert/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
local currentMission = player:getCurrentMission(SANDORIA);
	  MissionStatus = player:getVar("MissionStatus");
	
	if (currentMission == LEAUTE_S_LAST_WISHES and MissionStatus == 2) then
		if (GetMobAction(17289653) == 0) then
			if (player:getVar("Mission6-1MobKilled") == 1) then
				player:addKeyItem(DREAMROSE);
				player:messageSpecial(KEYITEM_OBTAINED,DREAMROSE);
				player:setVar("Mission6-1MobKilled",0);
				player:setVar("MissionStatus",3);
			else
				SpawnMob(17289653):updateClaim(player);
			end
		end
	else
		player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
	end
	
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
end;
