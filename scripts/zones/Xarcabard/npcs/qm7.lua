-----------------------------------
-- Area: Xarcabard
-- NPC:  ??? (RNG AF3 quest)
-- Involved in Quests: unbridled Passion
-- @zone 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Xarcabard/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	local UnbridledPassionCS = player:getVar("unbridledPassion");	

	if(UnbridledPassionCS == 4) then
		player:startEvent(0x0008);
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

	if(csid == 0x0008) then
		SpawnMob(17236205,240):updateEnmity(player);
	end

end;