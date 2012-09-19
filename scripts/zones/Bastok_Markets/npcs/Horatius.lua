-----------------------------------
--  Area: Bastok Markets
--   NPC: Horatius
--  Type: Quest Giver
-- @zone: 235
--  @pos: -158.392 -5.839 -117.061
--
-- Starts and Finishes: Breaking Stones
--
-- Auto-Script: Requires Verification. Verfied standard dialog - thrydwolf 12/8/2011
-----------------------------------
package.loaded["scripts/zones/Bastok_Markets/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Bastok_Markets/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getQuestStatus(BASTOK,BREAKING_STONES) ~= QUEST_AVAILABLE) then
		if (trade:hasItemQty(553,1) and trade:getItemCount() == 1) then
			player:startEvent(0x0065);
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getQuestStatus(BASTOK,BREAKING_STONES) == QUEST_AVAILABLE and player:getFameLevel(BASTOK) >= 2) then
		player:startEvent(0x0064);
	else
		player:startEvent(0x006e);
	end
end;

-----------------------------------
-- onEventUpdate
-----------------------------------

function onEventUpdate(player,csid,option)
	-- printf("CSID: %u",csid);
	-- printf("RESULT: %u",option);
end;

-----------------------------------
-- onEventFinish
-----------------------------------

function onEventFinish(player,csid,option)
	 --printf("CSID: %u",csid);
	 --printf("RESULT: %u",option);
	
	if (csid == 0x0064 and option == 0) then
		player:addQuest(BASTOK,BREAKING_STONES);
	end
	if (csid == 0x0065) then
        player:tradeComplete();
        player:addGil(GIL_RATE*400);
        player:messageSpecial(GIL_OBTAINED,GIL_RATE*400);
		player:completeQuest(BASTOK,BREAKING_STONES);
	end
end;

