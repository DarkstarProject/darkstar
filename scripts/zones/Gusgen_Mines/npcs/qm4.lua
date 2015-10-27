-----------------------------------
-- Area: Gusgen Mines
-- NPC:  qm4 (???)
-- Involved In Quest: Ghosts of the Past
-- @pos -174 0 369 196
-----------------------------------
package.loaded["scripts/zones/Gusgen_Mines/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Gusgen_Mines/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(BASTOK,GHOSTS_OF_THE_PAST) == QUEST_ACCEPTED and player:hasItem(13122) == false) then
		if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then -- Trade Pickaxe
			player:tradeComplete();
			SpawnMob(17580337,300):updateClaim(player);
		end
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(NOTHING_OUT_OF_ORDINARY);
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
--printf("CSID2: %u",csid);
--printf("RESULT2: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
--printf("CSID: %u",csid);
--printf("RESULT: %u",option);
end;