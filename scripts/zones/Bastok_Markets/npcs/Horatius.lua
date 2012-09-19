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
require("scripts/zones/Bastok_Markets/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	
	if (player:getQuestStatus(BASTOK,BREAKING_STONES) ~= QUEST_AVAILABLE) then
	
		if (trade:hasItemQty(553,1) == true and trade:getItemCount() == 1) then
			player:startEvent(0x0065);
			player:tradeComplete();
		end

	end

end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	
	if (player:getQuestStatus(BASTOK,BREAKING_STONES) == QUEST_AVAILABLE and player:getFameLevel(BASTOK) <=2) then
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
	
	if (csid == 100 and option == 0) then
		player:addQuest(BASTOK,BREAKING_STONES);
	end
	if (csid == 0x0065) then
		if(player:getQuestStatus(BASTOK,BREAKING_STONES) == QUEST_ACCEPTED) then
			player:completeQuest(BASTOK,BREAKING_STONES);
		end
		player:messageSpecial(GIL_OBTAINED,400);
		player:addGil(400);
	end
		
end;

