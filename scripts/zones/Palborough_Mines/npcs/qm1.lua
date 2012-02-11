-----------------------------------
-- Area: Palborough Mines
-- NPC:  ???
-- Involved In Quest: The Talekeeper's Truth
-- @zone 143
-- @pos 15 -31 -94
-----------------------------------
package.loaded["scripts/zones/Palborough_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/zones/Palborough_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if(player:getVar("theTalekeeperTruthCS") == 3) then
		player:messageSpecial(SENSE_OF_FOREBODING);
		SpawnMob(17363318,180):updateEnmity(player);
	else
		player:messageSpecial(THERE_IS_NOTHING_ORDINARY);
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