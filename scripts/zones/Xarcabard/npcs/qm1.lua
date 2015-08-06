-----------------------------------
-- Area: Xarcabard
-- NPC:  qm1 (???)
-- Involved in Quests: The Three Magi (for Boreal Hound)
-- @pos -331 -29 -49 112
-----------------------------------
package.loaded["scripts/zones/Xarcabard/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Xarcabard/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(WINDURST,THE_THREE_MAGI) == QUEST_ACCEPTED and player:hasItem(1104) == false) then
		if (trade:hasItemQty(613,1) and trade:getItemCount() == 1) then -- Trade Faded Crystal
			player:tradeComplete();
			SpawnMob(17236201,180):updateClaim(player);
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