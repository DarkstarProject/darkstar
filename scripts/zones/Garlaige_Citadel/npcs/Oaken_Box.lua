-----------------------------------
-- Area: Garlaige Citadel
-- NPC:  Oaken Box
-- Involved In Quest: Peace for the Spirit
-- @pos -164 0.1 225 200
-----------------------------------
package.loaded["scripts/zones/Garlaige_Citadel/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/keyitems");
require("scripts/globals/quests");
require("scripts/zones/Garlaige_Citadel/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(SANDORIA,PEACE_FOR_THE_SPIRIT) == QUEST_ACCEPTED) then
		if (trade:hasItemQty(1094,1) and trade:getItemCount() == 1) then -- Trade Nail Puller
			player:startEvent(0x000e);
		end
	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)

	if (player:getVar("peaceForTheSpiritCS") == 4 and player:hasItem(1094) == false) then -- Nail Puller
		player:messageSpecial(SENSE_OF_FOREBODING);
		SpawnMob(17596643,180):updateClaim(player);
	else
		player:messageSpecial(YOU_FIND_NOTHING);
	end
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

	if (csid == 0x000e) then
		player:tradeComplete();
		player:setVar("peaceForTheSpiritCS",5);
	end

end;