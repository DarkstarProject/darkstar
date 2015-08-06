-----------------------------------
-- Area: Konschtat Highlands
-- NPC:  qm2 (???)
-- Involved in Quest: Forge Your Destiny
-- @pos -709 2 102 108
-----------------------------------
package.loaded["scripts/zones/Konschtat_Highlands/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/quests");
require("scripts/zones/Konschtat_Highlands/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	
	if (player:getQuestStatus(OUTLANDS,FORGE_YOUR_DESTINY) == QUEST_ACCEPTED) then
		if (trade:getItemCount() == 1 and trade:hasItemQty(1151,1) and GetMobAction(17219999) == 0) then -- Oriental Steel
			SpawnMob(17219999, 300):updateClaim(player); -- Spawn Forger, Despawn after inactive for 5 minutes
			player:tradeComplete();
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