-----------------------------------
--  Area: Bastok Markets
--   NPC: ??? (QM2)
--  Type: Item Giver
-- @zone: 191
--  @pos: -120.041 2.621 415.989
--
-- Starts and Finishes: Breaking Stones
--
-- 
-- Only spawns if the weather is SUNNY
-----------------------------------

package.loaded["scripts/zones/Dangruf_Wadi/TextIDs"] = nil;
require("scripts/zones/Dangruf_Wadi/TextIDs");
require("scripts/globals/quests");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
		
	if (player:getQuestStatus(BASTOK,BREAKING_STONES) ~= QUEST_ACCEPTED) then
		player:startEvent(0x006E);
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
	 
	if (csid == 0x006E and option == 0) then
		if (player:getFreeSlotsCount() > 0) then
			if (player:hasItem(553 == false) then
				player:addItem(553,1);
				player:messageSpecial(ITEM_OBTAINED,553);
			else
				player:addItem(553,1); -- Triggers the "You cannot obtain more then one of this item" message.
			end
		else
			player:messageSpecial(ITEM_CANNOT_BE_OBTAINED,553);
		end
	end
end;

