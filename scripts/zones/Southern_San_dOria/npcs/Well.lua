-----------------------------------
-- Area: Southern San d'Oria
-- NPC:  Well
-- Involved in Quest: Starting a Flame (R)
-- @zone 230
-- @pos -129 -6 92
-------------------------------------
package.loaded["scripts/zones/Southern_San_dOria/TextIDs"] = nil;
-----------------------------------

require("scripts/globals/settings");
require("scripts/globals/quests");
require("scripts/zones/Southern_San_dOria/TextIDs");

----------------------------------- 
-- onTrade Action 
----------------------------------- 

function onTrade(player,npc,trade)
	
	if(player:getQuestStatus(SANDORIA,GRAVE_CONCERNS) == QUEST_ACCEPTED) then
		if(trade:hasItemQty(TGWaterskin,1) and trade:getItemCount() == 1) then
			player:tradeComplete();
			player:addItem(SOWellWater);
			player:messageSpecial(ITEM_OBTAINED,SOWellWater);
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