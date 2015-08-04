-----------------------------------
-- Area: Maze of Shakhrami
-- NPC:  Excavation Point
-- Used in Quest: The Holy Crest
-- @pos 234 0.1 -110 198
-----------------------------------
package.loaded["scripts/zones/Maze_of_Shakhrami/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/excavation");
require("scripts/zones/Maze_of_Shakhrami/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)

	if (player:getVar("TheHolyCrest_Event") == 3 and player:hasItem(1159) == false) then
		if (trade:hasItemQty(605,1) and trade:getItemCount() == 1) then
			if (player:getFreeSlotsCount(0) >= 1) then
				player:tradeComplete();
				player:addItem(1159);
				player:messageSpecial(ITEM_OBTAINED, 1159); -- Wyvern Egg
			else
			   player:messageSpecial(ITEM_CANNOT_BE_OBTAINED, 1159); -- Wyvern Egg
			end
		end
	else
		startExcavation(player,player:getZoneID(),npc,trade,0x003C);
	end
	
end;

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	player:messageSpecial(MINING_IS_POSSIBLE_HERE,605);
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