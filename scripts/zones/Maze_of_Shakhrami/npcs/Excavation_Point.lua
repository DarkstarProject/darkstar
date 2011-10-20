-----------------------------------
-- Area: Maze of Shakhrami
-- NPC: Excavation Point
-- Starts Quest: The Holy Crest
-----------------------------------

package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
require("scripts/zones/Maze_of_Shakhrami/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	count = trade:getItemCount();
	gil = trade:getGil();

	if (trade:hasItemQty(PICKAXE,1) == true and count == 1 and gil == 0) then
		if (player:getVar("TheHolyCrest_Event") == 3 and player:hasItem(WYVERN_EGG) == false) then
			if (player:getFreeSlotsCount(0) >= 1) then
				player:tradeComplete();
				player:addItem(WYVERN_EGG);
				player:messageSpecial(ITEM_OBTAINED, WYVERN_EGG);
			else
			   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, WYVERN_EGG);
			end
		end
	end
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
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
