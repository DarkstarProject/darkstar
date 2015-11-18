-----------------------------------
-- Area: Dynamis Xarcabard
-- NPC:  ??? (Spawn when mega is defeated)
-----------------------------------
package.loaded["scripts/zones/Dynamis-Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/titles");
require("scripts/globals/keyitems");
require("scripts/zones/Dynamis-Xarcabard/TextIDs");

-----------------------------------
-- onTrade
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger
-----------------------------------

function onTrigger(player,npc)
	
	player:addTitle(DYNAMISXARCABARD_INTERLOPER); -- Add title
	
	if (player:hasKeyItem(HYDRA_CORPS_BATTLE_STANDARD) == false) then
		player:setVar("DynaXarcabard_Win",1);
		player:addKeyItem(HYDRA_CORPS_BATTLE_STANDARD);
		player:messageSpecial(KEYITEM_OBTAINED,HYDRA_CORPS_BATTLE_STANDARD);
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