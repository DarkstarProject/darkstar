-----------------------------------
-- Area: Quicksand Caves
-- NPC:  Fountain of Kings
-- @pos 567 18 -939 208
-----------------------------------
package.loaded["scripts/zones/Quicksand_Caves/TextIDs"] = nil;
-----------------------------------

require("scripts/zones/Quicksand_Caves/TextIDs");
require("scripts/globals/missions");
require("scripts/globals/keyitems");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if (player:getCurrentMission(SANDORIA) == COMING_OF_AGE and player:getVar("MissionStatus") == 2) then
		SpawnMob(17629185,180);
		SpawnMob(17629186,180);
	elseif (player:getCurrentMission(SANDORIA) == COMING_OF_AGE and player:getVar("MissionStatus") == 3) then
		player:addKeyItem(DROPS_OF_AMNIO);
		player:messageSpecial(KEYITEM_OBTAINED,DROPS_OF_AMNIO);
	else
		player:messageSpecial(POOL_OF_WATER);
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