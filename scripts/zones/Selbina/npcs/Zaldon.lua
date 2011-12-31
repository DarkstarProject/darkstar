-----------------------------------
-- Area: Selbina
-- NPC: Zaldon
-- Involved in Quests: Under the sea
-- @zone 248
-- @pos -13 -7 -5
-----------------------------------

require("scripts/globals/settings");
package.loaded["scripts/globals/quests"] = nil;
require("scripts/globals/quests");
package.loaded["scripts/zones/Selbina/TextIDs"] = nil;
require("scripts/zones/Selbina/TextIDs");

-----------------------------------
-- onTrade Action
-----------------------------------

function onTrade(player,npc,trade)
	if(player:getQuestStatus(OTHER_AREAS,UNDER_THE_SEA) == QUEST_ACCEPTED and player:hasKeyItem(ETCHED_RING) == false) then 
		if(trade:hasItemQty(4501,1) == true and trade:getGil() == 0 and trade:getItemCount() == 1) then 
			rand = math.random(1,5);
			if(rand == 3) then 
				player:startEvent(0x0023); -- Ring found !
			else
				player:startEvent(0x0024); -- Ring not found...
			end
		end
	end
end; 

-----------------------------------
-- onTrigger Action
-----------------------------------

function onTrigger(player,npc)
	if(player:getVar("underTheSeaVar") == 3) then 
		player:startEvent(0x0022,4501); -- During quest "Under the sea" - 3rd dialog
	else
		player:startEvent(0x0096); -- Standard dialog
	end
end; 

-- 0x0096  0x0022  0x0024  0x0023  0x004d  0x00a0  0x00a1  0x00a2  0x00a3  0x00a4  0x00a5  0x00a6  0x00a7  0x0055

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
	if(csid == 0x0022) then 
		player:setVar("underTheSeaVar",4);
	elseif(csid == 0x0024) then 
		player:tradeComplete();
	elseif(csid == 0x0023) then 
		player:addKeyItem(ETCHED_RING);
		player:messageSpecial(KEYITEM_OBTAINED,ETCHED_RING);
		player:tradeComplete();
	end
end;



